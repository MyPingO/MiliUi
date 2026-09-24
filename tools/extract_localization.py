#!/usr/bin/env python3
"""Extract MiliUI Text Mapping IDs from Lua source into Miliastra localization CSV.

The extractor looks for Lua table literals containing a literal `textId = "..."`.
Within the same table it reads:
  * `text` as the English/code-first fallback when it is a literal string/number/bool
  * `needsTranslation` as TRUE/FALSE metadata (defaults to TRUE)

Nested text specs such as `label = { text=..., textId=... }` are discovered
recursively. Existing translation CSVs can be merged so non-English cells survive
regeneration while English and Need translation? stay owned by source code.
"""

from __future__ import annotations

import argparse
import csv
import dataclasses
from pathlib import Path
import re
import sys
from typing import Iterable, Iterator

LANGUAGE_COLUMNS = [
    "English",
    "Simplified Chinese",
    "Traditional Chinese",
    "Korean",
    "Japanese",
    "Spanish",
    "French",
    "Russian",
    "Thai",
    "Vietnamese",
    "German",
    "Indonesian",
    "Portuguese",
    "Turkish",
    "Italian",
]

CSV_COLUMNS = ["Text Mapping ID", "Need translation?", *LANGUAGE_COLUMNS]


@dataclasses.dataclass(frozen=True)
class Token:
    kind: str
    value: str
    start: int
    end: int
    line: int


@dataclasses.dataclass
class Entry:
    text_id: str
    english: str
    needs_translation: bool
    source: str
    line: int


IDENT_START = re.compile(r"[A-Za-z_]")
IDENT_CONTINUE = re.compile(r"[A-Za-z0-9_]")


def decode_lua_string(raw: str) -> str:
    body = raw[1:-1]
    out: list[str] = []
    index = 0
    escapes = {
        "a": "\a",
        "b": "\b",
        "f": "\f",
        "n": "\n",
        "r": "\r",
        "t": "\t",
        "v": "\v",
        "\\": "\\",
        '"': '"',
        "'": "'",
    }

    while index < len(body):
        char = body[index]
        if char != "\\":
            out.append(char)
            index += 1
            continue

        index += 1
        if index >= len(body):
            out.append("\\")
            break

        esc = body[index]
        index += 1
        if esc in escapes:
            out.append(escapes[esc])
        elif esc == "z":
            while index < len(body) and body[index].isspace():
                index += 1
        elif esc == "x" and index + 1 < len(body):
            digits = body[index : index + 2]
            if re.fullmatch(r"[0-9A-Fa-f]{2}", digits):
                out.append(chr(int(digits, 16)))
                index += 2
            else:
                out.extend(["\\", esc])
        elif esc.isdigit():
            digits = esc
            while index < len(body) and len(digits) < 3 and body[index].isdigit():
                digits += body[index]
                index += 1
            out.append(chr(int(digits, 10)))
        else:
            out.append(esc)

    return "".join(out)


def tokenize(source: str) -> list[Token]:
    tokens: list[Token] = []
    index = 0
    line = 1
    length = len(source)

    def advance_text(text: str) -> None:
        nonlocal line
        line += text.count("\n")

    while index < length:
        char = source[index]

        if char.isspace():
            start = index
            while index < length and source[index].isspace():
                index += 1
            advance_text(source[start:index])
            continue

        if source.startswith("--", index):
            start = index
            index += 2
            if source.startswith("[[", index):
                close = source.find("]]", index + 2)
                if close == -1:
                    advance_text(source[start:])
                    break
                index = close + 2
                advance_text(source[start:index])
            else:
                close = source.find("\n", index)
                if close == -1:
                    break
                index = close + 1
                advance_text(source[start:index])
            continue

        if char in ('"', "'"):
            start = index
            start_line = line
            quote = char
            index += 1
            escaped = False
            while index < length:
                current = source[index]
                if current == "\n":
                    line += 1
                if escaped:
                    escaped = False
                    index += 1
                    continue
                if current == "\\":
                    escaped = True
                    index += 1
                    continue
                index += 1
                if current == quote:
                    break
            tokens.append(Token("string", source[start:index], start, index, start_line))
            continue

        if IDENT_START.match(char):
            start = index
            start_line = line
            index += 1
            while index < length and IDENT_CONTINUE.match(source[index]):
                index += 1
            tokens.append(Token("ident", source[start:index], start, index, start_line))
            continue

        if char.isdigit() or (char == "." and index + 1 < length and source[index + 1].isdigit()):
            start = index
            start_line = line
            index += 1
            while index < length and source[index] in "0123456789abcdefABCDEFxXpP+-.eE":
                index += 1
            tokens.append(Token("number", source[start:index], start, index, start_line))
            continue

        tokens.append(Token("symbol", char, index, index + 1, line))
        index += 1

    return tokens


def matching_braces(tokens: list[Token]) -> dict[int, int]:
    stack: list[int] = []
    matches: dict[int, int] = {}
    for index, token in enumerate(tokens):
        if token.kind == "symbol" and token.value == "{":
            stack.append(index)
        elif token.kind == "symbol" and token.value == "}" and stack:
            opening = stack.pop()
            matches[opening] = index
    return matches


def literal_value(tokens: list[Token], start: int, end: int):
    while start < end and tokens[start].kind == "symbol" and tokens[start].value in ("(", ")"):
        start += 1
    if start >= end:
        return None
    token = tokens[start]
    if token.kind == "string":
        return decode_lua_string(token.value)
    if token.kind == "number":
        return token.value
    if token.kind == "ident" and token.value in ("true", "false"):
        return token.value == "true"
    return None


def top_level_fields(tokens: list[Token], opening: int, closing: int) -> dict[str, tuple[int, int]]:
    fields: dict[str, tuple[int, int]] = {}
    index = opening + 1
    depth = 0
    field_start = index
    chunks: list[tuple[int, int]] = []

    while index < closing:
        token = tokens[index]
        if token.kind == "symbol":
            if token.value in ("{", "(", "["):
                depth += 1
            elif token.value in ("}", ")", "]"):
                depth = max(0, depth - 1)
            elif token.value in (",", ";") and depth == 0:
                chunks.append((field_start, index))
                field_start = index + 1
        index += 1
    if field_start < closing:
        chunks.append((field_start, closing))

    for start, end in chunks:
        if start >= end:
            continue
        key_token = tokens[start]
        if key_token.kind != "ident":
            continue
        if start + 1 >= end or tokens[start + 1].kind != "symbol" or tokens[start + 1].value != "=":
            continue
        fields[key_token.value] = (start + 2, end)

    return fields


def extract_from_source(source: str, source_name: str) -> list[Entry]:
    tokens = tokenize(source)
    matches = matching_braces(tokens)
    entries: list[Entry] = []

    for opening in sorted(matches):
        closing = matches[opening]
        fields = top_level_fields(tokens, opening, closing)
        text_id_span = fields.get("textId")
        if text_id_span is None:
            continue
        text_id = literal_value(tokens, *text_id_span)
        if not isinstance(text_id, str) or not text_id:
            continue

        english = ""
        if "text" in fields:
            value = literal_value(tokens, *fields["text"])
            if value is not None:
                english = str(value).lower() if isinstance(value, bool) else str(value)

        needs_translation = True
        if "needsTranslation" in fields:
            value = literal_value(tokens, *fields["needsTranslation"])
            if isinstance(value, bool):
                needs_translation = value

        entries.append(
            Entry(
                text_id=text_id,
                english=english,
                needs_translation=needs_translation,
                source=source_name,
                line=tokens[opening].line,
            )
        )

    return entries


def iter_lua_files(paths: Iterable[Path]) -> Iterator[Path]:
    seen: set[Path] = set()
    for path in paths:
        if path.is_file() and path.suffix.lower() == ".lua":
            resolved = path.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield path
        elif path.is_dir():
            for child in sorted(path.rglob("*.lua")):
                if any(part.startswith(".") for part in child.relative_to(path).parts):
                    continue
                resolved = child.resolve()
                if resolved not in seen:
                    seen.add(resolved)
                    yield child


def dedupe(entries: Iterable[Entry]) -> list[Entry]:
    ordered: list[Entry] = []
    by_id: dict[str, Entry] = {}
    conflicts: list[str] = []

    for entry in entries:
        previous = by_id.get(entry.text_id)
        if previous is None:
            by_id[entry.text_id] = entry
            ordered.append(entry)
            continue

        english_conflict = previous.english and entry.english and previous.english != entry.english
        translation_conflict = previous.needs_translation != entry.needs_translation
        if english_conflict or translation_conflict:
            conflicts.append(
                f"{entry.text_id!r}: {previous.source}:{previous.line} conflicts with "
                f"{entry.source}:{entry.line}"
            )
        elif not previous.english and entry.english:
            previous.english = entry.english

    if conflicts:
        raise ValueError("Conflicting localization definitions:\n  " + "\n  ".join(conflicts))
    return ordered


def load_merge_csv(path: Path | None) -> tuple[list[str], dict[str, dict[str, str]]]:
    if path is None:
        return CSV_COLUMNS[:], {}

    with path.open("r", encoding="utf-8-sig", newline="") as handle:
        reader = csv.DictReader(handle)
        if not reader.fieldnames:
            raise ValueError(f"Merge CSV has no header: {path}")
        if "Text Mapping ID" not in reader.fieldnames:
            raise ValueError(f"Merge CSV is missing 'Text Mapping ID': {path}")
        rows = {
            row.get("Text Mapping ID", ""): row
            for row in reader
            if row.get("Text Mapping ID", "")
        }
        columns = list(reader.fieldnames)

    for required in ("Text Mapping ID", "Need translation?", "English"):
        if required not in columns:
            columns.append(required)
    for language in LANGUAGE_COLUMNS:
        if language not in columns:
            columns.append(language)

    return columns, rows


def write_csv(entries: list[Entry], output: Path, merge: Path | None) -> None:
    columns, previous_rows = load_merge_csv(merge)
    rows: list[dict[str, str]] = []

    for entry in entries:
        row = dict(previous_rows.get(entry.text_id, {}))
        row["Text Mapping ID"] = entry.text_id
        row["Need translation?"] = "TRUE" if entry.needs_translation else "FALSE"
        row["English"] = entry.english
        for column in columns:
            row.setdefault(column, "")
        rows.append(row)

    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=columns, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Extract MiliUI textId specs from Lua source into Miliastra localization CSV."
    )
    parser.add_argument("paths", nargs="+", type=Path, help="Lua file(s) or directories to scan")
    parser.add_argument("-o", "--output", type=Path, default=Path("Localization.csv"))
    parser.add_argument(
        "--merge",
        type=Path,
        help="Existing localization CSV whose non-English translations should be preserved",
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="Print discovered mappings and source locations",
    )
    args = parser.parse_args(argv)

    files = list(iter_lua_files(args.paths))
    if not files:
        parser.error("No .lua files found")

    discovered: list[Entry] = []
    for file in files:
        try:
            source = file.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            source = file.read_text(encoding="utf-8-sig")
        discovered.extend(extract_from_source(source, str(file)))

    try:
        entries = dedupe(discovered)
        write_csv(entries, args.output, args.merge)
    except ValueError as error:
        print(f"error: {error}", file=sys.stderr)
        return 2

    if args.list:
        for entry in entries:
            flag = "TRUE" if entry.needs_translation else "FALSE"
            print(f"{entry.text_id} | translate={flag} | {entry.source}:{entry.line} | {entry.english}")

    print(f"Wrote {len(entries)} mapping(s) from {len(files)} Lua file(s) to {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
