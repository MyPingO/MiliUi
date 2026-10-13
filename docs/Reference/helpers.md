# API reference: Helpers

> Generated from the matching `library/*.lua` LuaLS declarations shipped with MiliUI. This reference reports declared types and descriptions; it does not invent defaults or runtime behavior.

**Use `UI.*` entry points or the documented public `UI.<namespace>.*` tables.** Support types and implementation helper declarations may also appear here for type completeness; their presence does not imply they are public entry points.

**Source declaration:** `helpers.lua`  
**Coverage:** 40 classes, 180 fields, 2 aliases, 100 callable signatures.

[Reference index](README.md) · [Documentation index](../README.md)

**Usage guides:** [ResponsiveLayout](../ResponsiveLayout.md) · [Theming](../Theming.md) · [Motion](../Motion.md)

## Classes, component props and return types

### `MiliUI.AudioAPI`

*No fields are declared directly on this type.*

### `MiliUI.CoreAPI`

*No fields are declared directly on this type.*

### `MiliUI.LayoutOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `x?` | `number` | Move this whole group left or right by this many UI units. Positive numbers move it right. Example: `x = 20`. |
| `y?` | `number` | Move this whole group up or down by this many UI units. Positive numbers move it up. Example: `y = -10`. |
| `gap?` | `number` | Space between the controls in this group, in UI units. Example: `gap = 12`. |

### `MiliUI.GridLayoutOptions`

**Inherits from:** [`MiliUI.LayoutOptions`](helpers.md#miliuilayoutoptions). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `columns?` | `integer` | Number of items per row in the grid. Example: `columns = 3` makes three columns before starting a new row. Default: `2`. |
| `gapX?` | `number` | Space between neighboring grid columns, in UI units. If omitted, uses `gap`. Example: `gapX = 12`. |
| `gapY?` | `number` | Space between grid rows, in UI units. If omitted, uses `gap`. Example: `gapY = 8`. |
| `cellWidth?` | `number` | Width reserved for each grid cell, in UI units. Example: `cellWidth = 120`. |
| `cellHeight?` | `number` | Height reserved for each grid cell, in UI units. Example: `cellHeight = 48`. |

### `MiliUI.FanLayoutOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `x?` | `number` | Horizontal position or offset, in UI units (positive moves right). |
| `y?` | `number` | Vertical position or offset, in UI units (positive moves up). |
| `spacing?` | `number` | Horizontal card spacing. Default 145. |
| `curve?` | `number` | Quadratic downward curve amount. Default 12. |
| `rotation?` | `number` | Rotation step in degrees. Default 5. |

### `MiliUI.LayoutAPI`

*No fields are declared directly on this type.*

### `MiliUI.StackProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `gap?` | `number` | Space BETWEEN consecutive children. In a Row it separates them left-to-right; in a Column it separates them top-to-bottom. Example: `gap = 12`. |
| `padding?` | `number` | Empty space INSIDE the Row/Column, between its outside edge and the first/last children. Example: `padding = 16` on every side. |
| `paddingX?` | `number` | Empty space **inside** this Row or Column along both the left and right edges. Example: `paddingX = 16`. |
| `paddingY?` | `number` | Empty space **inside** this Row or Column along both the top and bottom edges. Example: `paddingY = 12`. |
| `paddingLeft?` | `number` | Space **inside** the left edge before the first child. Example: `paddingLeft = 16`. |
| `paddingRight?` | `number` | Space **inside** the right edge after the last child. Example: `paddingRight = 16`. |
| `paddingTop?` | `number` | Space **inside** the top edge, above the children. Example: `paddingTop = 12`. |
| `paddingBottom?` | `number` | Space **inside** the bottom edge, below the children. Example: `paddingBottom = 12`. |
| `align?` | `MiliUI.StackAlign` | Where to place children ACROSS the Row/Column: for a Row, top/center/bottom; for a Column, left/center/right. `stretch` expands them to fill this direction. Default `center`. |
| `justify?` | `MiliUI.StackJustify` | Where children sit ALONG the Row/Column: `start` packs toward the beginning, `center` groups them in the middle, `end` packs toward the end, `between` spreads free space between items. Default `center`. |
| `fitContent?` | `boolean` | Automatically make a Row/Column big enough to fit its children plus gaps and padding, if you have not set a fixed size. Useful for lists of varying content. |
| `fitWidth?` | `boolean` | Calculate the Row/Column width from its children when a fixed width is not provided. |
| `fitHeight?` | `boolean` | Calculate the Row/Column height from its children when a fixed height is not provided. Useful for long lists within ScrollArea. |
| `responsive?` | `MiliUI.StackResponsiveRule[]` | Rules that change this Row/Column's layout when the available space changes. Example: switch a horizontal Row into a vertical Column-like layout on a narrow screen. |
| `controllerNavigation?` | `boolean\|'linear'` | Make controller D-pad/left-stick movement follow the order of items in a Row or Column. Example: set `controllerNavigation = true` on a Row of Buttons to link left/right. ScrollColumn enables vertical links by default. |

### `MiliUI.StackChildOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `width?` | `MiliUI.Dimension` | Set the child's width in UI units (e.g. `width = 200`) or a parent percentage (e.g. `width = '50%'`). |
| `height?` | `MiliUI.Dimension` | Set the child's height in UI units (e.g. `height = 48`) or a parent percentage (e.g. `height = '100%'`). |
| `minWidth?` | `MiliUI.Dimension` | Smallest width this child is allowed to have. Example: `minWidth = 100`. |
| `maxWidth?` | `MiliUI.Dimension` | Largest width this child is allowed to have. Example: `maxWidth = 300`. |
| `minHeight?` | `MiliUI.Dimension` | Smallest height this child is allowed to have. Example: `minHeight = 48`. |
| `maxHeight?` | `MiliUI.Dimension` | Largest height this child is allowed to have. Example: `maxHeight = 200`. |
| `aspectRatio?` | `number` | Requested shape of the child, expressed as width divided by height. Example: `aspectRatio = 2` means twice as wide as it is tall when MiliUI can determine the size from one dimension. |
| `fillWidth?` | `boolean` | Make this child use the space available across its parent's width. Example: `UI.Button(column, { fillWidth = true })` fills the available width of the existing Column. |
| `fillHeight?` | `boolean` | Make this child use the available height in its parent. Example: `UI.Box(row, { fillHeight = true })` fills the existing Row's height. |
| `grow?` | `number` | How much leftover space this particular child receives from its Row/Column. Example: `grow = 2` next to `grow = 1` gets twice the EXTRA space. Use 0 to keep its requested size. |
| `alignSelf?` | `MiliUI.StackAlign` | Set how **this one child** lines up, without changing other children. In a Row this controls up/down position; in a Column, left/right position. Example: `alignSelf = 'stretch'` fills that direction. |

### `MiliUI.Stack`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.ContainerControl` | The outer container that defines this Row or Column's overall size and position. |
| `content` | `MiliUI.ContainerControl` | The **inside** container where MiliUI places the Row or Column's children after applying padding. |
| `direction` | `'horizontal'\|'vertical'` | The direction children are arranged: `'horizontal'` for a Row (left to right), `'vertical'` for a Column (top to bottom). |
| `gap` | `number` | Space between neighboring items, in UI units. |
| `align` | `MiliUI.StackAlign` | Current alignment setting of this Row or Column. For Rows, it controls whether children are toward the top, middle, or bottom; for Columns, toward the left, center, or right. |
| `justify` | `MiliUI.StackJustify` | Current spacing/position setting along the direction of this Row or Column. Example: `'center'` groups children in the middle, while `'between'` spreads them apart. |
| `paddingLeft` | `number` | Current inside space between the Row/Column's left edge and its contents. |
| `paddingRight` | `number` | Current inside space between the Row/Column's right edge and its contents. |
| `paddingTop` | `number` | Current inside space above the Row/Column's contents. |
| `paddingBottom` | `number` | Current inside space below the Row/Column's contents. |
| `children` | `MiliUI.Parent[]` | The controls currently laid out inside this Row or Column, in their display order. |

### `MiliUI.StackClass`

*No fields are declared directly on this type.*

### `MiliUI.MotionPopOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `from?` | `number` | Initial size multiplier (`0.82` means 18% smaller than normal). Default 0.82. |
| `duration?` | `number` | Length of the animation, in seconds. |
| `ease?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionPulseOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `scale?` | `number` | Pulse size multiplier (`1.07` means 7% bigger than normal). Default 1.07. |
| `upDuration?` | `number` | How long the up effect lasts, in seconds. |
| `downDuration?` | `number` | How long the down effect lasts, in seconds. |
| `easeIn?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeOut?` | `any` | Choose the speed curve for the movement away from the starting position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionFlipOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `duration?` | `number` | Total duration. Default 0.24. |
| `easeIn?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeOut?` | `any` | Choose the speed curve for the movement away from the starting position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionShakeOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `distance?` | `number` | Horizontal shake distance. Default 8. |
| `step?` | `number` | Seconds per shake step. Default 0.045. |

### `MiliUI.MotionSlideInOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `direction?` | `MiliUI.MotionDirection` | Direction the control enters from. Default 'left'. |
| `distance?` | `number` | Starting offset from the intended position. Default 48. |
| `duration?` | `number` | How long the animation lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.slow` from the active theme. |
| `ease?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionBounceInOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `from?` | `number` | Initial size multiplier (`0.72` means 28% smaller than normal). Default 0.72. |
| `overshoot?` | `number` | Peak size multiplier (`1.06` means 6% bigger than normal) before settling. Default 1.06. |
| `riseDuration?` | `number` | How long the upward movement lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.normal` from the active theme. |
| `settleDuration?` | `number` | How long the final movement back to the normal position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `easeOut?` | `any` | Choose the speed curve for the movement away from the starting position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeSettle?` | `any` | Choose the speed curve for the final movement back to the normal position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionNudgeOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `direction?` | `MiliUI.MotionDirection` | Direction of the nudge. Default 'right'. |
| `distance?` | `number` | Peak positional offset. Default 12. |
| `outDuration?` | `number` | How long the movement away from the starting position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `returnDuration?` | `number` | How long the movement back to the starting position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.normal` from the active theme. |
| `easeOut?` | `any` | Choose the speed curve for the movement away from the starting position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeReturn?` | `any` | Choose the speed curve for the movement back to the starting position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionWobbleOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `angle?` | `number` | Peak Z rotation in degrees. Default 7. |
| `step?` | `number` | Seconds per wobble step. Default 0.055. |
| `ease?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionPunchOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `scale?` | `number` | Initial outward size multiplier (`1.10` means 10% bigger than normal). Default 1.10. |
| `compress?` | `number` | Compression multiplier after the outward punch. Default 0.97. |
| `attackDuration?` | `number` | How long the first burst of movement lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.instant` from the active theme. |
| `compressDuration?` | `number` | How long the squeeze after the first movement lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `settleDuration?` | `number` | How long the final movement back to the normal position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.normal` from the active theme. |
| `easeAttack?` | `any` | Choose the speed curve for the first burst of movement: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeCompress?` | `any` | Choose the speed curve for the squeeze after the first movement: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeSettle?` | `any` | Choose the speed curve for the final movement back to the normal position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionSquashOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `scaleX?` | `number` | Horizontal size multiplier (`1.08` means 8% bigger than normal). Default 1.08. |
| `scaleY?` | `number` | Vertical size multiplier (`0.92` means 8% smaller than normal). Default 0.92. |
| `squashDuration?` | `number` | How long the squash movement lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `returnDuration?` | `number` | How long the movement back to the starting position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.normal` from the active theme. |
| `easeSquash?` | `any` | Choose the speed curve for the squash movement: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeReturn?` | `any` | Choose the speed curve for the movement back to the starting position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionSpinInOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `degrees?` | `number` | Starting Z rotation offset. Default 180 (clockwise in Miliastra). |
| `duration?` | `number` | How long the animation lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.slower` from the active theme. |
| `ease?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionHopOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `height?` | `number` | Peak upward offset. Default 24. |
| `landing?` | `number` | Small downward landing overshoot. Default 5. |
| `riseDuration?` | `number` | How long the upward movement lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `fallDuration?` | `number` | How long the downward movement lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.normal` from the active theme. |
| `settleDuration?` | `number` | How long the final movement back to the normal position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `easeRise?` | `any` | Choose the speed curve for the upward movement: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeFall?` | `any` | Choose the speed curve for the downward movement: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeSettle?` | `any` | Choose the speed curve for the final movement back to the normal position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionSwingOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `angle?` | `number` | Peak Z rotation in degrees. Default 14. |
| `step?` | `number` | Seconds per swing step. Default 0.11. |
| `ease?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionRubberBandOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `stretch?` | `number` | First horizontal stretch multiplier. Default 1.18. |
| `squeeze?` | `number` | First vertical compression multiplier. Default 0.86. |
| `step?` | `number` | Seconds per rubber-band step. Default 0.09. |
| `ease?` | `any` | Choose the speed curve for the animation: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionDropInOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `distance?` | `number` | Starting upward offset. Default 56. |
| `overshoot?` | `number` | Downward overshoot past the intended position. Default 8. |
| `dropDuration?` | `number` | How long the downward drop lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.slow` from the active theme. |
| `settleDuration?` | `number` | How long the final movement back to the normal position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `easeDrop?` | `any` | Choose the speed curve for the downward drop: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeSettle?` | `any` | Choose the speed curve for the final movement back to the normal position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionSlamOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `from?` | `number` | Initial enlarged size multiplier (`1.35` means 35% bigger than normal). Default 1.35. |
| `impact?` | `number` | Compressed impact multiplier. Default 0.92. |
| `rebound?` | `number` | Rebound size multiplier (`1.04` means 4% bigger than normal). Default 1.04. |
| `impactDuration?` | `number` | How long the first impact lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `reboundDuration?` | `number` | How long the bounce after impact lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.fast` from the active theme. |
| `settleDuration?` | `number` | How long the final movement back to the normal position lasts, in **seconds**. If omitted, MiliUI uses `Theme.motion.normal` from the active theme. |
| `easeImpact?` | `any` | Choose the speed curve for the first impact: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeRebound?` | `any` | Choose the speed curve for the bounce after impact: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeSettle?` | `any` | Choose the speed curve for the final movement back to the normal position: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionBreatheOptions`

| Field | Declared type | Description |
| --- | --- | --- |
| `scale?` | `number` | Inhale size multiplier (`1.035` means 3% bigger than normal). Default 1.035. |
| `inhaleDuration?` | `number` | Inhale duration in seconds. Default 0.65; minimum 0.01. |
| `exhaleDuration?` | `number` | Exhale duration in seconds. Default 0.85; minimum 0.01. |
| `easeInhale?` | `any` | Choose the speed curve for the growing phase: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |
| `easeExhale?` | `any` | Choose the speed curve for the shrinking phase: whether it starts slowly, speeds up, or slows down near the end. Use a Miliastra `Enum.EaseType` value, or leave it out for the default. |

### `MiliUI.MotionAPI`

*No fields are declared directly on this type.*

### `MiliUI.ParsedStyle`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `radius?` | `MiliUI.Radius` | Rounded corner size obtained by reading a MiliUI style-class string. |
| `background?` | `MiliUI.ColorValue` | Background color obtained by reading a MiliUI style-class string. |
| `textColor?` | `MiliUI.ColorValue` | Color used for the text part of this parsed. Example: `'accent'` or `'white'`. |
| `textSize?` | `MiliUI.TextSize` | Size of the text part, in UI units. |
| `border?` | `boolean` | Whether a border was requested by a MiliUI style-class string. |
| `borderColor?` | `MiliUI.ColorValue` | Color used for the border part of this parsed. Example: `'accent'` or `'white'`. |

### `MiliUI.StyleAPI`

*No fields are declared directly on this type.*

### `MiliUI.SurfaceRadiusMap`

| Field | Declared type | Description |
| --- | --- | --- |
| `none` | `integer` | Number used for none in this surface radius map. |
| `xs` | `integer` | Number used for xs in this surface radius map. |
| `sm` | `integer` | Number used for sm in this surface radius map. |
| `md` | `integer` | Number used for md in this surface radius map. |
| `lg` | `integer` | Number used for lg in this surface radius map. |
| `xl` | `integer` | Number used for xl in this surface radius map. |
| `["2xl"]` | `integer` | Corner radius value for the largest built-in rounded surface size. |

### `MiliUI.SurfaceAPI`

| Field | Declared type | Description |
| --- | --- | --- |
| `Square` | `integer` | Built-in image asset ID `100001` for a square surface background. |
| `radius` | `MiliUI.SurfaceRadiusMap` | Semantic radius-to-pair map. |

### `MiliUI.Binding`

*No fields are declared directly on this type.*

### `MiliUI.KeyBinding`

*No fields are declared directly on this type.*

### `MiliUI.HitboxCallbacks`

| Field | Declared type | Description |
| --- | --- | --- |
| `OnClick?` | `MiliUI.CursorCallback` | Function run when the player clicks or activates this invisible hit area. |
| `OnEnter?` | `MiliUI.CursorCallback` | Function run when the pointer enters the hit area. |
| `OnExit?` | `MiliUI.CursorCallback` | Function run when the pointer leaves the hit area. |
| `OnDown?` | `MiliUI.CursorCallback` | Function run when the pointer is pressed down on this area. |
| `OnUp?` | `MiliUI.CursorCallback` | Function run when the pointer is released. |
| `OnBeginDrag?` | `MiliUI.CursorCallback` | Function run when a held pointer starts dragging this area. |
| `OnDrag?` | `MiliUI.CursorCallback` | Function run while the pointer drags this area. |
| `OnEndDrag?` | `MiliUI.CursorCallback` | Function run when the drag ends. |

### `MiliUI.HitboxProps`

**Inherits from:** [`MiliUI.LayoutProps`](aliases.md#miliuilayoutprops). Inherited fields are defined by the linked parent type; they are not repeated below.

| Field | Declared type | Description |
| --- | --- | --- |
| `interactable?` | `boolean` | Let the player click or touch this invisible interaction area. Default: `true`. |
| `raycastTarget?` | `boolean` | Let mouse or touch input detect this hitbox. Set `false` if the pointer should pass through it. Default: `true`. |
| `controllerFocus?` | `boolean` | Default false. When true, this Cursor Event Area receives native controller focus and Confirm invokes its click path. A focus chevron is shown unless disabled. |
| `controllerFocusIndicator?` | `boolean\|MiliUI.ControllerFocusIndicatorProps` | Set false to hide the focus chevron on a focusable Hitbox, or supply placement, size, and animation overrides. |
| `parentScroll?` | `boolean` | Default true. When inside ScrollArea content, false keeps pointer/controller scrolling owned by this control instead of the parent ScrollArea. |

### `MiliUI.Hitbox`

| Field | Declared type | Description |
| --- | --- | --- |
| `root` | `MiliUI.CursorAreaControl` | Underlying native UI control created for this component. |
| `binding?` | `MiliUI.Binding` | Binding used by this hitbox. |
| `enabled` | `boolean` | Whether this component is enabled. |
| `raycastTarget` | `boolean` | Allow this native control to receive pointer hit-testing, such as clicks. |
| `controllerFocus` | `boolean` | Whether native gamepad focus is enabled for this Hitbox. |
| `controllerFocusIndicator?` | `MiliUI.ImageControl` | Chevron shown when this Hitbox has controller focus. |

### `MiliUI.HoverProps`

| Field | Declared type | Description |
| --- | --- | --- |
| `hitTarget?` | `MiliUI.Parent` | Separate control/wrapper that receives cursor events. |
| `scale?` | `number` | Hover scale multiplier. Default 1. |
| `pressScale?` | `number` | Press scale multiplier. Default 0.97. |
| `raise?` | `number` | Vertical lift while hovered. Positive moves up. |
| `rotation?` | `number` | Optional visual rotation to apply while the mouse pointer is over this control, in degrees. |
| `duration?` | `number` | Length of the animation, in seconds. |
| `ease?` | `any` | Choose how quickly the hover animation starts and slows to a stop, using a Miliastra `Enum.EaseType` value. |
| `press?` | `boolean` | Set false to disable press scaling. |
| `movePosition?` | `boolean` | Force hover to own/restore position even when raise=0. |
| `onEnter?` | `fun()` | Function called when enter happens. |
| `onExit?` | `fun()` | Function called when exit happens. |

### `MiliUI.Hover`

| Field | Declared type | Description |
| --- | --- | --- |
| `binding` | `MiliUI.Binding` | Binding used by this hover. |

### `MiliUI.InteractionAPI`

*No fields are declared directly on this type.*

## Type aliases and enum values

### `MiliUI.MotionDirection`

```lua
---@alias MiliUI.MotionDirection 'left'|'right'|'up'|'down'
```

### `MiliUI.MotionChannel`

```lua
---@alias MiliUI.MotionChannel 'position'|'size'|'scale'|'rotation'
```

## Callables and object methods

Signatures below are taken directly from IntelliSense declarations. `:` denotes an instance method; `.` denotes a table function.

### `AudioAPI.Play(audioId)`

Plays a configured 2D audio resource.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `audioId` | `integer` | — |
| Returns | `integer` | audioInstanceId Native instance ID used by Stop/IsPlaying. |

**Original LuaLS annotations:**

```lua
---@param audioId integer
---@return integer audioInstanceId Native instance ID used by Stop/IsPlaying.
```


### `AudioAPI.Stop(audioInstanceId)`

Stops a previously started audio instance. Passing nil is a no-op.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `audioInstanceId?` | `integer` | — |
| Returns | `MiliUI.AudioAPI` | — |

**Original LuaLS annotations:**

```lua
---@param audioInstanceId? integer
---@return MiliUI.AudioAPI
```


### `AudioAPI.IsPlaying(audioInstanceId)`

Returns whether a previously started audio instance is still alive.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `audioInstanceId?` | `integer` | — |
| Returns | `boolean` | — |

**Original LuaLS annotations:**

```lua
---@param audioInstanceId? integer
---@return boolean
```


### `CoreAPI.ResolveControl(value)`

Find the **native UI control** behind a MiliUI component or wrapper. This is mainly useful when working directly with Miliastra's built-in UI API.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `any` | — |
| Returns | `MiliUI.Control\|any` | — |

**Original LuaLS annotations:**

```lua
---@param value any
---@return MiliUI.Control|any
```


### `CoreAPI.ResolveParent(value)`

Find the native UI container that should receive new child elements when the supplied value is a MiliUI component.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `any` | — |
| Returns | `MiliUI.Control\|any` | — |

**Original LuaLS annotations:**

```lua
---@param value any
---@return MiliUI.Control|any
```


### `CoreAPI.InitTemplates(templates)`

Configures the shared primitive templates used by every attached Host.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `templates` | `MiliUI.Templates` | — |
| Returns | `MiliUI.CoreAPI` | — |

**Original LuaLS annotations:**

```lua
---@param templates MiliUI.Templates
---@return MiliUI.CoreAPI
```


### `CoreAPI.AttachHost(hostId, root)`

Attaches one named Host to a currently available native Client UI root.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `root` | `MiliUI.Parent` | — |
| Returns | `MiliUI.CoreAPI` | — |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param root MiliUI.Parent
---@return MiliUI.CoreAPI
```


### `CoreAPI.RegisterHostDetachHook(callback)`

Registers an internal callback that runs while a Host is being detached.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(hostId:string)` | — |
| Returns | `function` | callback |

**Original LuaLS annotations:**

```lua
---@param callback fun(hostId:string)
---@return function callback
```


### `CoreAPI.DetachHost(hostId)`

Disconnect this named UI Host from MiliUI and clean up its Host-owned UI resources. Returns `true` if it was detached.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | detached |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean detached
```


### `CoreAPI.IsHostAttached(hostId)`

Return `true` when the requested UI Host is attached to MiliUI; return `false` if it is not attached.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `boolean` | attached |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return boolean attached
```


### `CoreAPI.GetHostIds()`

Return the current host ids from this CoreAPI.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `string[]` | hostIds |

**Original LuaLS annotations:**

```lua
---@return string[] hostIds
```


### `CoreAPI.GetHostId(value)`

Returns the owning Host ID for a native control/wrapper, or the current Host
when value is nil and execution is already inside a Host context.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value?` | `MiliUI.Parent` | — |
| Returns | `string?` | hostId |

**Original LuaLS annotations:**

```lua
---@param value? MiliUI.Parent
---@return string? hostId
```


### `CoreAPI.GetRoot(hostId)`

Return the current root from this CoreAPI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Returns | `MiliUI.Control` | root |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@return MiliUI.Control root
```


### `CoreAPI.GetCurrentHostId()`

Return the current current host id from this CoreAPI.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `string?` | hostId |

**Original LuaLS annotations:**

```lua
---@return string? hostId
```


### `CoreAPI.TrackDisposable(hostId, dispose)`

Tracks arbitrary cleanup under one Host and returns an idempotent disposer.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `dispose` | `fun()` | — |
| Returns | `fun():boolean` | disposer |

**Original LuaLS annotations:**

```lua
---@param hostId string
---@param dispose fun()
---@return fun():boolean disposer
```


### `CoreAPI.WithHost(hostId, callback, ...)`

Runs a callback inside one attached Host's ownership context.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `hostId` | `string` | — |
| Parameter `callback` | `fun(...):T` | — |
| Parameter `...` | `any` | — |
| Returns | `T` | — |

**Additional annotations:** `@generic T`

**Original LuaLS annotations:**

```lua
---@generic T
---@param hostId string
---@param callback fun(...):T
---@param ... any
---@return T
```


### `CoreAPI.GetEffectiveScale(control)`

Return the current effective scale from this CoreAPI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Returns | `number` | scaleX, number scaleY |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@return number scaleX, number scaleY
```


### `CoreAPI.ScreenDeltaToLocal(control, deltaX, deltaY)`

Convert a movement measured on the screen into the corresponding movement in a control's local coordinate system. Useful when dragging UI elements.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `deltaX` | `number` | — |
| Parameter `deltaY` | `number` | — |
| Returns | `number` | localX, number localY |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param deltaX number
---@param deltaY number
---@return number localX, number localY
```


### `CoreAPI.ResolveDimension(value, relativeTo, fallback)`

Resolves a number or percentage string against one parent-axis size.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value?` | `MiliUI.Dimension` | — |
| Parameter `relativeTo` | `number` | — |
| Parameter `fallback?` | `number` | — |
| Returns | `number?` | — |

**Original LuaLS annotations:**

```lua
---@param value? MiliUI.Dimension
---@param relativeTo number
---@param fallback? number
---@return number?
```


### `CoreAPI.ConstrainDimension(value, minimum, maximum, relativeTo, fallback)`

Resolves a dimension and clamps it to optional numeric/percentage bounds.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value?` | `MiliUI.Dimension` | — |
| Parameter `minimum?` | `MiliUI.Dimension` | — |
| Parameter `maximum?` | `MiliUI.Dimension` | — |
| Parameter `relativeTo` | `number` | — |
| Parameter `fallback?` | `number` | — |
| Returns | `number?` | — |

**Original LuaLS annotations:**

```lua
---@param value? MiliUI.Dimension
---@param minimum? MiliUI.Dimension
---@param maximum? MiliUI.Dimension
---@param relativeTo number
---@param fallback? number
---@return number?
```


### `CoreAPI.SetSize(control, width, height)`

Change this CoreAPI's size setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `width` | `number` | — |
| Parameter `height` | `number` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param width number
---@param height number
---@return MiliUI.Control
```


### `CoreAPI.RegisterResize(control, callback)`

Registers an internal callback fired when Core.SetSize changes a control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `callback` | `fun(width:number, height:number, control:MiliUI.Control)` | — |
| Returns | `function` | callback |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param callback fun(width:number, height:number, control:MiliUI.Control)
---@return function callback
```


### `CoreAPI.RefreshLayout(parent)`

Re-resolves percentage/fill descendants and percentage bounds under a parent.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
```


### `CoreAPI.New(kind, parent, name)`

Create a new object or UI component using the supplied settings.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `kind` | `'container'\|'image'\|'text'\|'button'\|'cursorArea'\|'animation'\|'fullscreenAnimation'\|'keyHint'\|'textWindow'\|'gridScroller'\|string` | — |
| Parameter `parent?` | `MiliUI.Parent` | — |
| Parameter `name?` | `string` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param kind 'container'|'image'|'text'|'button'|'cursorArea'|'animation'|'fullscreenAnimation'|'keyHint'|'textWindow'|'gridScroller'|string
---@param parent? MiliUI.Parent
---@param name? string
---@return MiliUI.Control
```


### `CoreAPI.NewTemplate(templateIndex, parent, name)`

Instantiates an arbitrary editor-created Client UI template and tracks it under
the Host resolved from its parent/current context.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `templateIndex` | `integer` | — |
| Parameter `parent?` | `MiliUI.Parent` | — |
| Parameter `name?` | `string` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param templateIndex integer
---@param parent? MiliUI.Parent
---@param name? string
---@return MiliUI.Control
```


### `CoreAPI.HideNativeChildren(control)`

Hide existing native child controls under this parent without requiring you to hide each child separately.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@return MiliUI.Control
```


### `CoreAPI.Rect(control, props)`

Apply rectangle settings such as position, anchors, and size to a native UI control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.LayoutProps` | — |
| Returns | `MiliUI.Control` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param props? MiliUI.LayoutProps
---@return MiliUI.Control
```


### `CoreAPI.Tween(target, values, duration, ease)`

Smoothly animate the supplied properties of a control over the given duration instead of changing them immediately.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Parameter `values` | `table<string, number\|any>` | — |
| Parameter `duration?` | `number` | — |
| Parameter `ease?` | `any` | Enum.EaseType value. |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@param values table<string, number|any>
---@param duration? number
---@param ease? any Enum.EaseType value.
---@return any tween
```


### `CoreAPI.After(seconds, callback)`

Schedules delayed work in the current Host context.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `seconds` | `number` | — |
| Parameter `callback` | `fun()` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param seconds number
---@param callback fun()
---@return any tween
```


### `CoreAPI.Listen(control, eventType, callback)`

Register a function that runs when the specified cursor or input event occurs on a native UI control.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.CursorCallback` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param eventType any Enum.CursorEventType value.
---@param callback MiliUI.CursorCallback
---@return MiliUI.CursorCallback
```


### `CoreAPI.Unlisten(control, eventType, callback)`

Stop the previously registered function from receiving the specified cursor or input event.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `eventType` | `any` | Enum.CursorEventType value. |
| Parameter `callback` | `MiliUI.CursorCallback` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param eventType any Enum.CursorEventType value.
---@param callback MiliUI.CursorCallback
```


### `CoreAPI.Destroy(control)`

Destroy this UI control or component and release its resources. Do not keep using it afterward.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
```


### `CoreAPI.DestroyAll()`

Destroys MiliUI-created controls/resources across every attached Host.


### `LayoutAPI.HStack(children, options)`

Centers existing controls horizontally using their current widths.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.LayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.LayoutOptions
---@return MiliUI.Parent[] children
```


### `LayoutAPI.VStack(children, options)`

Centers existing controls vertically using their current heights.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.LayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.LayoutOptions
---@return MiliUI.Parent[] children
```


### `LayoutAPI.Fan(children, options)`

Arranges controls as a curved card-style fan.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.FanLayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.FanLayoutOptions
---@return MiliUI.Parent[] children
```


### `LayoutAPI.Grid(children, options)`

Arranges controls in a centered fixed-cell grid.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `children` | `MiliUI.Parent[]` | — |
| Parameter `options?` | `MiliUI.GridLayoutOptions` | — |
| Returns | `MiliUI.Parent[]` | children |

**Original LuaLS annotations:**

```lua
---@param children MiliUI.Parent[]
---@param options? MiliUI.GridLayoutOptions
---@return MiliUI.Parent[] children
```


### `Stack:Add(value, options)`

Add a child control to this Row/Column. The layout updates to include it; controls created directly under the Row/Column are already added automatically.
Example: `row:Add(button, { grow = 1 })` asks the Button to use spare width.

Adds a control/wrapper and immediately refreshes the layout. Controls created
with the Row/Column wrapper as parent are auto-added; explicit Add is still
supported and can override layout metadata.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `T` | — |
| Parameter `options?` | `MiliUI.StackChildOptions` | — |
| Returns | `T` | value |

**Additional annotations:** `@generic T`

**Original LuaLS annotations:**

```lua
---@generic T
---@param value T
---@param options? MiliUI.StackChildOptions
---@return T value
```


### `Stack:Remove(value)`

Remove the supplied child element from this Row or Column so MiliUI no longer arranges it among the other items.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `value` | `MiliUI.Parent` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param value MiliUI.Parent
---@return MiliUI.Stack
```


### `Stack:Clear()`

Forgets children without destroying them.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Stack
```


### `Stack:SetGap(gap)`

Set the empty space between consecutive Row/Column children in UI units.
Example: `row:SetGap(12)` keeps 12 units between Buttons.

Change this Stack's gap setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `gap` | `number` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param gap number
---@return MiliUI.Stack
```


### `Stack:SetPadding(padding)`

Change this Stack's padding setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `padding` | `number` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param padding number
---@return MiliUI.Stack
```


### `Stack:SetInsets(left, right, top, bottom)`

Sets inner insets in Left, Right, Top, Bottom order. nil preserves an edge.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `left?` | `number` | — |
| Parameter `right?` | `number` | — |
| Parameter `top?` | `number` | — |
| Parameter `bottom?` | `number` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param left? number
---@param right? number
---@param top? number
---@param bottom? number
---@return MiliUI.Stack
```


### `Stack:SetAlign(align)`

Change where children line up ACROSS the Row or Column.
For a Row this means vertical alignment; for a Column it means horizontal alignment. Example: `row:SetAlign('center')`.

Change this Stack's align setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `align` | `MiliUI.StackAlign` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param align MiliUI.StackAlign
---@return MiliUI.Stack
```


### `Stack:SetJustify(justify)`

Change how children are spread ALONG the Row or Column.
Options: `'start'`, `'center'`, `'end'`, `'between'`. Example: `'between'` puts spare room between children.

Change this Stack's justify setting using the supplied value.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `justify` | `MiliUI.StackJustify` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param justify MiliUI.StackJustify
---@return MiliUI.Stack
```


### `Stack:Batch(callback)`

When adding/removing MANY controls, group changes in `Batch` so MiliUI calculates layout once at the end, reducing freezes.
Example: `column:Batch(function(list) for i = 1, 50 do UI.Button(list, { label = { text = tostring(i) } }) end end)`.

Runs multiple Stack mutations while deferring layout refreshes until the
outermost batch completes. Nested batches on the same Stack settle once.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `fun(stack: MiliUI.Stack):` | T |
| Returns | `T` | — |

**Additional annotations:** `@generic T`

**Original LuaLS annotations:**

```lua
---@generic T
---@param callback fun(stack: MiliUI.Stack): T
---@return T
```


### `Stack:Refresh()`

Update this component so its UI reflects the latest settings or data.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Stack
```


### `Stack:Destroy()`

Destroy this UI control or component and release its resources. Do not keep using it afterward.


### `StackClass.New(root, direction, options)`

Create a new object or UI component using the supplied settings.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `root` | `MiliUI.Parent` | — |
| Parameter `direction` | `'horizontal'\|'vertical'` | — |
| Parameter `options?` | `MiliUI.StackProps` | — |
| Returns | `MiliUI.Stack` | — |

**Original LuaLS annotations:**

```lua
---@param root MiliUI.Parent
---@param direction 'horizontal'|'vertical'
---@param options? MiliUI.StackProps
---@return MiliUI.Stack
```


### `MotionAPI.Tween(target, properties, duration, ease)`

Creates and immediately plays a tracked Miliastra tween owned by the target's Host.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Parameter `properties` | `table<string, any>` | — |
| Parameter `duration?` | `number` | Defaults to Theme.motion.normal. |
| Parameter `ease?` | `any` | Enum.EaseType value. |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@param properties table<string, any>
---@param duration? number Defaults to Theme.motion.normal.
---@param ease? any Enum.EaseType value.
---@return any tween
```


### `MotionAPI.After(seconds, callback)`

Schedules delayed work in the current Host context. From bootstrap code use
`UI.Hosts.After(hostId, seconds, callback)`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `seconds` | `number` | — |
| Parameter `callback` | `fun()` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param seconds number
---@param callback fun()
---@return any tween
```


### `MotionAPI.Cancel(target, channels)`

Cancels managed motion on the selected channels while preserving the current
value of those channels. When channels is omitted, all managed motion on the
target is cancelled. A single channel name, a list of channel names, or a
boolean channel map may be supplied.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `target` | `MiliUI.Parent` | — |
| Parameter `channels?` | `MiliUI.MotionChannel\|MiliUI.MotionChannel[]\|table<MiliUI.MotionChannel, boolean>` | — |
| Returns | `MiliUI.Parent` | target |

**Original LuaLS annotations:**

```lua
---@param target MiliUI.Parent
---@param channels? MiliUI.MotionChannel|MiliUI.MotionChannel[]|table<MiliUI.MotionChannel, boolean>
---@return MiliUI.Parent target
```


### `MotionAPI.MoveTo(control, x, y, duration, ease)`

Animate a control moving to a new position on screen over the specified time.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `x` | `number` | — |
| Parameter `y` | `number` | — |
| Parameter `duration?` | `number` | — |
| Parameter `ease?` | `any` | Enum.EaseType value. |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param x number
---@param y number
---@param duration? number
---@param ease? any Enum.EaseType value.
---@return any tween
```


### `MotionAPI.ScaleTo(control, scaleX, scaleY, duration, ease)`

Animate a control growing or shrinking to the desired size multipliers. A scale value of `1` means normal size.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `scaleX` | `number` | — |
| Parameter `scaleY?` | `number` | Defaults to scaleX. |
| Parameter `duration?` | `number` | — |
| Parameter `ease?` | `any` | Enum.EaseType value. |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param scaleX number
---@param scaleY? number Defaults to scaleX.
---@param duration? number
---@param ease? any Enum.EaseType value.
---@return any tween
```


### `MotionAPI.RotateTo(control, rotation, duration, ease)`

Animate a control turning to the specified angle rather than rotating instantly.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `rotation` | `number` | Z rotation in degrees. |
| Parameter `duration?` | `number` | — |
| Parameter `ease?` | `any` | Enum.EaseType value. |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param rotation number Z rotation in degrees.
---@param duration? number
---@param ease? any Enum.EaseType value.
---@return any tween
```


### `MotionAPI.PopIn(control, options)`

Make a control briefly grow into view. Useful when showing a new popup, badge or card.

Play a quick entrance effect where a control grows from smaller than normal to its full size.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionPopOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionPopOptions
---@return any tween
```


### `MotionAPI.Pulse(control, options)`

Make an existing control gently enlarge/shrink to attract attention without changing its permanent size.

Play a quick size pulse: the control grows slightly and then returns to its usual size.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionPulseOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionPulseOptions
---@return any tween
```


### `MotionAPI.FlipX(control, options, midpointCallback)`

Collapses X scale, invokes midpointCallback, then expands again.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionFlipOptions` | — |
| Parameter `midpointCallback?` | `fun()` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionFlipOptions
---@param midpointCallback? fun()
---@return any tween
```


### `MotionAPI.Shake(control, options)`

Move a control briefly from side to side to draw attention to it, such as when an action is not allowed.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionShakeOptions` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionShakeOptions
```


### `MotionAPI.SlideIn(control, options)`

Starts offset from the control's intended position and slides into place.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionSlideInOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionSlideInOptions
---@return any tween
```


### `MotionAPI.BounceIn(control, options)`

Scales from a smaller size through a configurable overshoot, then settles.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionBounceInOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionBounceInOptions
---@return any tween
```


### `MotionAPI.Nudge(control, options)`

Moves briefly in one direction and returns to the intended position.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionNudgeOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionNudgeOptions
---@return any tween
```


### `MotionAPI.Wobble(control, options)`

Applies a diminishing rotational wobble around the intended Z rotation.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionWobbleOptions` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionWobbleOptions
```


### `MotionAPI.Punch(control, options)`

Applies a sharp scale-out, compression, and settle interaction effect.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionPunchOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionPunchOptions
---@return any tween
```


### `MotionAPI.Squash(control, options)`

Briefly stretches one scale axis while compressing the other, then restores.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionSquashOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionSquashOptions
---@return any tween
```


### `MotionAPI.SpinIn(control, options)`

Starts from a Z rotation offset and spins into the intended rotation.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionSpinInOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionSpinInOptions
---@return any tween
```


### `MotionAPI.Hop(control, options)`

Hops upward, lands slightly past the baseline, then settles.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionHopOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionHopOptions
---@return any tween
```


### `MotionAPI.Swing(control, options)`

Applies a slower pendulum-style diminishing Z rotation.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionSwingOptions` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionSwingOptions
```


### `MotionAPI.RubberBand(control, options)`

Alternates horizontal and vertical scale deformation before settling.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionRubberBandOptions` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionRubberBandOptions
```


### `MotionAPI.DropIn(control, options)`

Drops from above, passes the intended position slightly, then settles.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionDropInOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionDropInOptions
---@return any tween
```


### `MotionAPI.Slam(control, options)`

Starts enlarged, compresses on impact, rebounds, then settles.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionSlamOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionSlamOptions
---@return any tween
```


### `MotionAPI.Breathe(control, options)`

Loops a subtle scale-in/scale-out breathing motion until cancelled or replaced.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.MotionBreatheOptions` | — |
| Returns | `any` | tween |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.MotionBreatheOptions
---@return any tween
```


### `StyleAPI.Parse(classString)`

Parses utility tokens such as `w-300 rounded-lg bg-surface text-muted`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `classString?` | `string` | — |
| Returns | `MiliUI.ParsedStyle` | — |

**Original LuaLS annotations:**

```lua
---@param classString? string
---@return MiliUI.ParsedStyle
```


### `StyleAPI.Merge(props, componentName)`

Merges component theme defaults, utility classes, then explicit props.
When componentName is omitted this behaves like the normal utility-class merge.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `props?` | `T` | — |
| Parameter `componentName?` | `MiliUI.ThemeComponentName` | — |
| Returns | `T` | — |

**Additional annotations:** `@generic T: table`

**Original LuaLS annotations:**

```lua
---@generic T: table
---@param props? T
---@param componentName? MiliUI.ThemeComponentName
---@return T
```


### `StyleAPI.Color(name, fallback)`

Look up a named color from the active MiliUI theme. Example: `UI.Style.Color('accent')` returns the theme's accent color.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `name?` | `MiliUI.ColorValue` | — |
| Parameter `fallback?` | `MiliUI.Color` | — |
| Returns | `MiliUI.Color?` | — |

**Original LuaLS annotations:**

```lua
---@param name? MiliUI.ColorValue
---@param fallback? MiliUI.Color
---@return MiliUI.Color?
```


### `StyleAPI.SurfaceImage(style, outline)`

Choose a matching built-in surface image for the supplied style and whether you want its outline.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `style` | `MiliUI.ParsedStyle` | — |
| Parameter `outline?` | `boolean` | — |
| Returns | `integer?` | assetId |

**Original LuaLS annotations:**

```lua
---@param style MiliUI.ParsedStyle
---@param outline? boolean
---@return integer? assetId
```


### `SurfaceAPI.RoundedLevel(level, outline)`

Returns a filled/outline rounded surface from 106001-106030.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `level` | `integer` | Pair level 1-15. |
| Parameter `outline?` | `boolean` | false=filled odd ID; true=outline even ID. |
| Returns | `integer` | assetId |

**Original LuaLS annotations:**

```lua
---@param level integer Pair level 1-15.
---@param outline? boolean false=filled odd ID; true=outline even ID.
---@return integer assetId
```


### `SurfaceAPI.ShellLevel(level, outline)`

Returns a gradient/half-outline shell from 106061-106090.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `level` | `integer` | Pair level 1-15. |
| Parameter `outline?` | `boolean` | false=gradient odd ID; true=half-outline even ID. |
| Returns | `integer` | assetId |

**Original LuaLS annotations:**

```lua
---@param level integer Pair level 1-15.
---@param outline? boolean false=gradient odd ID; true=half-outline even ID.
---@return integer assetId
```


### `SurfaceAPI.EdgeLevel(level, outline)`

Backwards-compatible alias of ShellLevel.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `level` | `integer` | — |
| Parameter `outline?` | `boolean` | — |
| Returns | `integer` | assetId |

**Original LuaLS annotations:**

```lua
---@param level integer
---@param outline? boolean
---@return integer assetId
```


### `SurfaceAPI.ResolveLevel(radius)`

Convert the supplied rounded-corner setting, such as `'lg'`, into the built-in numeric radius level used for MiliUI surfaces.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `radius?` | `MiliUI.Radius` | — |
| Returns | `integer` | level 0 for none, otherwise 1-15. |

**Original LuaLS annotations:**

```lua
---@param radius? MiliUI.Radius
---@return integer level 0 for none, otherwise 1-15.
```


### `SurfaceAPI.Rounded(radius, outline)`

Return the built-in image asset ID for a solid rounded surface, or its outline when requested.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `radius?` | `MiliUI.Radius` | — |
| Parameter `outline?` | `boolean` | — |
| Returns | `integer?` | assetId |

**Original LuaLS annotations:**

```lua
---@param radius? MiliUI.Radius
---@param outline? boolean
---@return integer? assetId
```


### `SurfaceAPI.Shell(radius, outline)`

Return the built-in image asset ID for a decorative shell matching the requested rounded-corner style.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `radius?` | `MiliUI.Radius` | — |
| Parameter `outline?` | `boolean` | — |
| Returns | `integer?` | assetId |

**Original LuaLS annotations:**

```lua
---@param radius? MiliUI.Radius
---@param outline? boolean
---@return integer? assetId
```


### `SurfaceAPI.GetRoundedLevel(assetId)`

Return the current rounded level from this SurfaceAPI.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `assetId` | `integer` | Rounded-family asset ID. |
| Returns | `integer?` | level |

**Original LuaLS annotations:**

```lua
---@param assetId integer Rounded-family asset ID.
---@return integer? level
```


### `SurfaceAPI.MatchingShell(roundedAssetId, outline)`

Returns the exact shell from the same pair index as roundedAssetId.
Example: `MatchingShell(106007, true)` -> `106068`.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `roundedAssetId` | `integer` | — |
| Parameter `outline?` | `boolean` | — |
| Returns | `integer?` | assetId |

**Original LuaLS annotations:**

```lua
---@param roundedAssetId integer
---@param outline? boolean
---@return integer? assetId
```


### `Binding:Destroy()`

Removes every cursor listener owned by this binding.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Binding` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Binding
```


### `KeyBinding:Destroy()`

Removes every key listener owned by this binding.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.KeyBinding` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.KeyBinding
```


### `Hitbox:Bind(callbacks)`

Connect this Hitbox to the supplied control or callback so they stay in sync.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callbacks` | `MiliUI.HitboxCallbacks` | — |
| Returns | `MiliUI.Hitbox` | — |

**Original LuaLS annotations:**

```lua
---@param callbacks MiliUI.HitboxCallbacks
---@return MiliUI.Hitbox
```


### `Hitbox:OnClick(callback)`

Register a function that runs when click happens on this Hitbox.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `callback` | `MiliUI.CursorCallback` | — |
| Returns | `MiliUI.Hitbox` | — |

**Original LuaLS annotations:**

```lua
---@param callback MiliUI.CursorCallback
---@return MiliUI.Hitbox
```


### `Hitbox:CancelCurrentClick()`

Cancels activation for the current pointer gesture without disabling the Hitbox.
Used automatically when a parent ScrollArea promotes a press into scrolling.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Hitbox` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Hitbox
```


### `Hitbox:SetEnabled(enabled)`

Allow or prevent the player from interacting with this component. Pass `true` to enable or `false` to disable.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Hitbox` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Hitbox
```


### `Hitbox:RefreshControllerFocusIndicator()`

Reposition the focus chevron after moving a focused Hitbox outside normal layout.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.AnchorPlacementResult?` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.AnchorPlacementResult?
```


### `Hitbox:Destroy()`

Destroy this UI control or component and release its resources. Do not keep using it afterward.


### `Hover:SetEnabled(enabled)`

Allow or prevent the player from interacting with this component. Pass `true` to enable or `false` to disable.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Hover` | — |

**Original LuaLS annotations:**

```lua
---@param enabled boolean
---@return MiliUI.Hover
```


### `Hover:RefreshBase()`

Recaptures the visual control's current transform when not hovered.

| Kind | Type | Description |
| --- | --- | --- |
| Returns | `MiliUI.Hover` | — |

**Original LuaLS annotations:**

```lua
---@return MiliUI.Hover
```


### `Hover:Destroy()`

Destroy this UI control or component and release its resources. Do not keep using it afterward.


### `InteractionAPI.ConfigureControllerNavigation(control, enabled)`

Configures all four controller directions to native NearestControl when enabled, or None when disabled.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `enabled` | `boolean` | — |
| Returns | `MiliUI.Control?` | control |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param enabled boolean
---@return MiliUI.Control? control
```


### `InteractionAPI.Bind(control, callbacks)`

Connect this InteractionAPI to the supplied control or callback so they stay in sync.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `callbacks?` | `MiliUI.HitboxCallbacks` | — |
| Returns | `MiliUI.Binding` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param callbacks? MiliUI.HitboxCallbacks
---@return MiliUI.Binding
```


### `InteractionAPI.BindKeys(control, eventTypes, callback)`

Binds several native key-event types to one host-owned action callback.
A nil callback result is treated as handled.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `eventTypes` | `any[]` | Enum.KeyEventType values. |
| Parameter `callback` | `fun(...):boolean?` | — |
| Returns | `MiliUI.KeyBinding` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param eventTypes any[] Enum.KeyEventType values.
---@param callback fun(...):boolean?
---@return MiliUI.KeyBinding
```


### `InteractionAPI.Hitbox(parent, props)`

Create an **invisible clickable area** within a UI container. Use it when a custom visual needs mouse or touch interaction.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `parent` | `MiliUI.Parent` | — |
| Parameter `props?` | `MiliUI.HitboxProps` | — |
| Returns | `MiliUI.Hitbox` | — |

**Original LuaLS annotations:**

```lua
---@param parent MiliUI.Parent
---@param props? MiliUI.HitboxProps
---@return MiliUI.Hitbox
```


### `InteractionAPI.Hover(control, options)`

Attach hover and press behavior to an existing UI control so its appearance can respond to mouse or touch input.

| Kind | Type | Description |
| --- | --- | --- |
| Parameter `control` | `MiliUI.Parent` | — |
| Parameter `options?` | `MiliUI.HoverProps` | — |
| Returns | `MiliUI.Hover` | — |

**Original LuaLS annotations:**

```lua
---@param control MiliUI.Parent
---@param options? MiliUI.HoverProps
---@return MiliUI.Hover
```
