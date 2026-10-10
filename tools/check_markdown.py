from __future__ import annotations

import re
import sys
from collections import defaultdict
from pathlib import Path
from urllib.parse import unquote, urlsplit


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
FENCE_PATTERN = re.compile(r"^ {0,3}(`{3,}|~{3,})")
HEADING_PATTERN = re.compile(r"^ {0,3}#{1,6}[ \t]+(.+?)[ \t]*$")
INLINE_LINK_PATTERN = re.compile(r"!?\[[^\]\n]*\]\((<[^>]+>|(?:\\.|[^)\n])+)\)")
REFERENCE_DEFINITION_PATTERN = re.compile(r"^ {0,3}\[([^]]+)\]:[ \t]*<?([^\s>]+)>?")
REFERENCE_USE_PATTERN = re.compile(r"(?<!!)\[([^]\n]+)\]\[([^]\n]*)\]")
EXPLICIT_ANCHOR_PATTERN = re.compile(r'<(?:a|h[1-6])\s+[^>]*(?:id|name)=["\']([^"\']+)["\']', re.I)


def markdown_lines(source: str) -> tuple[list[tuple[int, str]], bool]:
    visible_lines = []
    active_fence = None

    for line_number, line in enumerate(source.splitlines(), start=1):
        marker = FENCE_PATTERN.match(line)
        if active_fence is None and marker:
            active_fence = marker.group(1)
            continue
        if active_fence is not None:
            if marker and marker.group(1)[0] == active_fence[0] and len(marker.group(1)) >= len(active_fence):
                active_fence = None
            continue
        visible_lines.append((line_number, line))

    return visible_lines, active_fence is not None


def github_heading_anchor(heading: str) -> str:
    heading = re.sub(r"!?\[([^]]+)\]\([^)]+\)", r"\1", heading)
    heading = re.sub(r"<[^>]*>", "", heading)
    heading = re.sub(r"[\`*_~]", "", heading)
    heading = heading.strip().lower()
    heading = re.sub(r"[^\w\s-]", "", heading, flags=re.UNICODE)
    return re.sub(r"\s", "-", heading)


def available_anchors(visible_lines: list[tuple[int, str]]) -> set[str]:
    headings = defaultdict(int)
    anchors = set()

    for _, line in visible_lines:
        heading_match = HEADING_PATTERN.match(line)
        if heading_match:
            heading = re.sub(r"[ \t]+#+[ \t]*$", "", heading_match.group(1))
            anchor = github_heading_anchor(heading)
            duplicate_count = headings[anchor]
            headings[anchor] += 1
            anchors.add(f"{anchor}-{duplicate_count}" if duplicate_count else anchor)

        for anchor_match in EXPLICIT_ANCHOR_PATTERN.finditer(line):
            anchors.add(anchor_match.group(1))

    return anchors


def targets_in_line(line: str, definitions: dict[str, str]) -> list[str]:
    targets = []

    for inline_match in INLINE_LINK_PATTERN.finditer(line):
        destination = inline_match.group(1).strip()
        if destination.startswith("<") and destination.endswith(">"):
            destination = destination[1:-1]
        else:
            titled_destination = re.match(r"^(\S+)\s+[\"'][^\"']+[\"']$", destination)
            if titled_destination:
                destination = titled_destination.group(1)
        targets.append(destination.replace(r"\(", "(").replace(r"\)", ")"))

    reference_definition = REFERENCE_DEFINITION_PATTERN.match(line)
    if reference_definition:
        targets.append(reference_definition.group(2))
    else:
        for reference_match in REFERENCE_USE_PATTERN.finditer(line):
            reference_name = (reference_match.group(2) or reference_match.group(1)).strip().lower()
            if reference_name in definitions:
                targets.append(definitions[reference_name])

    return targets


def main() -> int:
    documents = {}
    for markdown_file in sorted(REPOSITORY_ROOT.rglob("*.md")):
        if ".git" in markdown_file.parts:
            continue
        relative_path = markdown_file.relative_to(REPOSITORY_ROOT)
        content = markdown_file.read_text(encoding="utf-8")
        visible_lines, unclosed_fence = markdown_lines(content)
        documents[markdown_file.resolve()] = (relative_path, visible_lines, available_anchors(visible_lines), unclosed_fence)

    problems = []
    checked_links = 0
    checked_anchors = 0

    for markdown_file, (relative_path, visible_lines, _, unclosed_fence) in documents.items():
        if unclosed_fence:
            problems.append(f"{relative_path}: unclosed fenced code block")

        definitions = {
            match.group(1).strip().lower(): match.group(2)
            for _, line in visible_lines
            if (match := REFERENCE_DEFINITION_PATTERN.match(line))
        }

        for line_number, line in visible_lines:
            if "—" in line:
                problems.append(f"{relative_path}:{line_number}: replace em dash with natural punctuation")

            line_without_code = re.sub(r"(?<!`)`[^`]+`(?!`)", "", line)

            for destination in targets_in_line(line_without_code, definitions):
                destination_parts = urlsplit(destination)
                if destination_parts.scheme or destination.startswith("//"):
                    continue
                if not destination_parts.path and not destination_parts.fragment:
                    continue

                checked_links += 1
                target_path = unquote(destination_parts.path)
                target_file = (markdown_file.parent / target_path).resolve() if target_path else markdown_file

                if not target_file.is_relative_to(REPOSITORY_ROOT):
                    problems.append(f"{relative_path}:{line_number}: link escapes repository: {destination}")
                    continue

                if target_file.is_dir():
                    target_file = target_file / "README.md"
                if not target_file.exists():
                    problems.append(f"{relative_path}:{line_number}: missing local file: {destination}")
                    continue

                if destination_parts.fragment and target_file.suffix.lower() == ".md":
                    checked_anchors += 1
                    target_document = documents.get(target_file)
                    if target_document and unquote(destination_parts.fragment) not in target_document[2]:
                        problems.append(f"{relative_path}:{line_number}: missing GitHub heading anchor: {destination}")

    if problems:
        print("\n".join(problems))
        print(f"Found {len(problems)} documentation problem(s).")
        return 1

    print(f"Validated {len(documents)} Markdown files, {checked_links} local links, and {checked_anchors} heading anchors.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
