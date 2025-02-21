---@meta

-- version: 25.2.11
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout)
---
---@class ui
---@field Rect ui.Rect
---@field Pad ui.Pad|ui.Pad_call
---@field Style ui.StyleMod
---@field Span ui.Span|ui.Span_call
---@field Line ui.Line|ui.Line_call
---@field Text ui.Text|ui.Text_call
---@field Layout ui.LayoutMod
---@field Constraint ui.Constraint
---@field List ui.List|ui.List_call
---@field Bar ui.Bar|ui.Bar_call
---@field Border ui.Border|ui.Border_call
---@field Gauge ui.GaugeMod
local ui

---A Rect is represented an area within the terminal
---You can get a pre-computed `Rect` through `ui.Layout()`. Note that if you intend to create a `Rect` yourself, ensure these values are calculated accurately; otherwise, it may cause Yazi to crash!
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#rect)
---
---@class ui.Rect
---@field x number x position
---@field y number y position
---@field w number width
---@field h number height
---@field left number left position
---@field right number right position
---@field top number top position
---@field bottom number bottom position
---@field default ui.Rect
---
---@field pad fun(self: ui.Rect, pad: ui.Pad): ui.Rect Apply a Pad

---Pad represents a padding
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#pad)
---
---@class ui.Pad
---@field left fun(v: integer) left padding
---@field right fun(v: integer) right padding
---@field top fun(v: integer) top padding
---@field bottom fun(v: integer) bottom padding
---@field x fun(v: integer) left & right padding
---@field y fun(v: integer) top & bottom padding
---@field xy fun(v: integer) all dimention padding

---@alias ui.Pad_call fun(left:integer, right:integer, top:integer, bottom:integer)

---@alias Color
---|string
---|"rest"
---|"black"
---|"white"
---|"red"
---|"lightred"
---|"green"
---|"lightgreen"
---|"yellow"
---|"lightyellow"
---|"blue"
---|"lightblue"
---|"magenta"
---|"lightmagenta"
---|"cyan"
---|"lightcyan"
---|"gray"
---|"darkgray"

---Create a style
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#style)
---
---@class ui.StyleMod
---@operator call:ui.Style

---@class ui.Style
local Style = {}

---Patch the style with another `Style`
---@generic T
---@param self T
---@param style T
---@return T
function Style.patch(self, style) end

---Set the foreground color of the style
---@generic T
---@param self T
---@param color Color
---@return T
function Style.fg(self, color) end

---Set the background color of the style
---@generic T
---@param self T
---@param color Color
---@return T
function Style.bg(self, color) end

---Set the style to bold
---@generic T
---@param self T
---@return T
function Style.bold(self) end

---Set the style to dim
---@generic T
---@param self T
---@return T
function Style.dim(self) end

---Set the style to italic
---@generic T
---@param self T
---@return T
function Style.italic(self) end

---Set the style to underline
---@generic T
---@param self T
---@return T
function Style.underline(self) end

---Set the style to blink
---@generic T
---@param self T
---@return T
function Style.blink(self) end

---Set the style to blink rapid
---@generic T
---@param self T
---@return T
function Style.blink_rapid(self) end

---Set the style to reverse
---@generic T
---@param self T
---@return T
function Style.reverse(self) end

---Set the style to hidden
---@generic T
---@param self T
---@return T
function Style.hidden(self) end

---Set the style to crossed
---@generic T
---@param self T
---@return T
function Style.crossed(self) end

---Reset the style
---@generic T
---@param self T
---@return T
function Style.reset(self) end

---`ui.Span` is the smallest unit of text, yet a component of `ui.Line`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#span)
---
---@class ui.Span: ui.Style
---@field visible fun(self: ui.Span): boolean Whether the span is visible (includes any printable characters)
---@field style fun(self: ui.Span, style: ui.Style): ui.Span Set the style of the span

---@alias ui.Span_call fun(span:string|ui.Span): ui.Span

---`ui.Line` represents a line, consisting of multiple `ui.Spans`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#line)
---
---@class ui.Line: ui.Style
---@field area fun(self: ui.Line): ui.Rect Changing the area of the line
---@field area fun(self: ui.Line, rect: ui.Rect): ui.Line Changing the area of the line
---@field width fun(self: ui.Line): integer Get the width of the line
---@field align fun(self: ui.Line, alignment: ui.Line.LEFT|ui.Line.CENTER|ui.Line.RIGHT): ui.Line Get the width of the line
---@field visible fun(self: ui.Line): boolean Whether the line is visible (includes any printable characters)
---@field style fun(self: ui.Line, style: ui.Style): ui.Line Set the style of the line
---
---@field LEFT any
---@field CENTER any
---@field RIGHT any

---@alias ui.Line.LEFT any
---@alias ui.Line.CENTER any
---@alias ui.Line.RIGHT any

---@alias ui.Line_call fun(line:string|ui.Line|ui.Span|(string|ui.Line|ui.Span)[]): ui.Line

---`ui.Text` is used to represent multi-line text, it takes a table of `ui.Line`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#text)
---
---@class ui.Text: ui.Style
---@field area fun(self: ui.Text): ui.Rect Changing the area of the text
---@field area fun(self: ui.Text, rect: ui.Rect): ui.Text Changing the area of the text
---@field align fun(self: ui.Text, alignment: ui.Text.LEFT|ui.Text.CENTER|ui.Text.RIGHT): ui.Text Set the alignment of the text
---@field wrap fun(self: ui.Text, alignment: ui.Text.WRAP_NO|ui.Text.WRAP|ui.Text.WRAP_TRIM): ui.Text Set the wrap of the text
---@field style fun(self: ui.Text, style: ui.Style): ui.Text Set the style of the text
---
---@field LEFT any
---@field CENTER any
---@field RIGHT any
---@field WRAP_NO any
---@field WRAP any
---@field WRAP_TRIM any

---@alias ui.Text.LEFT any
---@alias ui.Text.CENTER any
---@alias ui.Text.RIGHT any
---@alias ui.Text.WRAP_NO any
---@alias ui.Text.WRAP any
---@alias ui.Text.WRAP_TRIM any

---@alias ui.Text_call fun(line:string|ui.Line|ui.Span|(string|ui.Line|ui.Span)[]): ui.Text

---Create a layout
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#layout)
---
---@class ui.LayoutMod
---@operator call:ui.Layout
---
---@field HORIZONTAL any
---@field VERTICAL any

---A constraint that defines the size of a layout element
---Constraints can be used to specify a fixed size, a percentage of the available space, a ratio of the available space, a minimum or maximum size or a fill proportional value for a layout element.
---Relative constraints (percentage, ratio) are calculated relative to the entire space being divided, rather than the space available after applying more fixed constraints (min, max, length).
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#constraint)
---
---@class ui.Constraint
---
---@field Min fun(min: number) Applies a minimum size constraint to the element
---@field Max fun(max: number) Applies a maximum size constraint to the element
---@field Length fun(len: number) Applies a length constraint to the element
---@field Percentage fun(p: integer) Applies a percentage of the available space to the element
---@field Ratio fun(num: integer, den: integer) Applies a ratio of the available space to the element
---@field Fill fun(scale: number) Applies the scaling factor proportional to all other `Fill` elements to fill excess space

---@class ui.Layout
---@field direction fun(self: ui.Layout, alignment: ui.Layout.HORIZONTAL|ui.Layout.VERTICAL): ui.Layout Set the direction of the layout
---@field margin fun(self: ui.Layout, margin: integer): ui.Layout Set the margin of the layout, which accepts an positive integer
---@field margin_h fun(self: ui.Layout, margin: integer): ui.Layout Set the horizontal margin of the layout, which accepts an positive integer
---@field margin_v fun(self: ui.Layout, margin: integer): ui.Layout Set the vertical margin of the layout, which accepts an positive integer
---@field constraints fun(self: ui.Layout, constraints: ui.Constraint[]): ui.Layout Set the constraints of the layout
---@field split fun(self: ui.Layout, rect: ui.Rect): ui.Layout Accepts a `Rect` and split it into multiple `Rect` according to the constraints

---@alias ui.Layout.HORIZONTAL any
---@alias ui.Layout.VERTICAL any

---Create a `List` that takes a table of `ui.Text`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#list)
---
---@class ui.List
---
---@field area fun(self: ui.List): ui.Rect Changing the area of the list
---@field area fun(self: ui.List, rect: ui.Rect): ui.List Changing the area of the list
---@field style fun(self: ui.List, style: ui.Style): ui.List Set the style of the list

---@alias ui.List_call fun(list: (string|ui.Line|ui.Span|ui.Text)[])

---Create a `Bar`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#bar)
---
---@class ui.Bar
---
---@field area fun(self: ui.Bar): ui.Rect Changing the area of the bar
---@field area fun(self: ui.Bar, rect: ui.Rect): ui.Bar Changing the area of the bar
---@field symbol fun(self: ui.Bar, symbol: string): ui.Bar Specifying the symbol for the bar
---@field style fun(self: ui.Bar, style: ui.Style): ui.Bar Set the style of the bar
---
---@field NONE any
---@field TOP any
---@field RIGHT any
---@field BOTTOM any
---@field LEFT any
---@field ALL any

---@alias ui.Bar.NONE any
---@alias ui.Bar.TOP any
---@alias ui.Bar.RIGHT any
---@alias ui.Bar.BOTTOM any
---@alias ui.Bar.LEFT any
---@alias ui.Bar.ALL any

---@alias ui.Bar._Direction
---|ui.Bar.NONE
---|ui.Bar.TOP
---|ui.Bar.RIGHT
---|ui.Bar.BOTTOM
---|ui.Bar.LEFT
---|ui.Bar.ALL

---@alias ui.Bar_call fun(direction: ui.Bar._Direction)

---Create a border
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#border)
---
---@class ui.Border
---
---@field area fun(self: ui.Border): ui.Rect Changing the area of the border
---@field area fun(self: ui.Border, rect: ui.Rect): ui.Border Changing the area of the border
---@field type fun(self: ui.Border, type: ui.Border._Type): ui.Border Specifying the type of the border
---@field style fun(self: ui.Border, style: ui.Style): ui.Bar Set the style of the border
---
---@field NONE any
---@field TOP any
---@field RIGHT any
---@field BOTTOM any
---@field LEFT any
---@field ALL any
---
---@field PLAIN any
---@field ROUNDED any
---@field DOUBLE any
---@field THICK any
---@field QUADRANT_INSIDE any
---@field QUADRANT_OUTSIDE any

---@alias ui.Border.NONE any
---@alias ui.Border.TOP any
---@alias ui.Border.RIGHT any
---@alias ui.Border.BOTTOM any
---@alias ui.Border.LEFT any
---@alias ui.Border.ALL any

---@alias ui.Border.PLAIN any
---@alias ui.Border.ROUNDED any
---@alias ui.Border.DOUBLE any
---@alias ui.Border.THICK any
---@alias ui.Border.QUADRANT_INSIDE any
---@alias ui.Border.QUADRANT_OUTSIDE any

---@alias ui.Border._Position
---|ui.Border.NONE
---|ui.Border.TOP
---|ui.Border.RIGHT
---|ui.Border.BOTTOM
---|ui.Border.LEFT
---|ui.Border.ALL

---@alias ui.Border._Type
---|ui.Border.PLAIN
---|ui.Border.ROUNDED
---|ui.Border.DOUBLE
---|ui.Border.THICK
---|ui.Border.QUADRANT_INSIDE
---|ui.Border.QUADRANT_OUTSIDE

---@alias ui.Border_call fun(position: ui.Border._Position)

---Create a gauge
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#gauge)
---
---@class ui.GaugeMod
---@operator call:ui.Gauge

---@class ui.Gauge
---
---@field area fun(self: ui.Gauge): ui.Rect Changing the area of the gauge
---@field area fun(self: ui.Gauge, rect: ui.Rect): ui.Gauge Changing the area of the gauge
---@field percent fun(self: ui.Gauge, percent: integer): ui.Gauge Set the percentage of the gauge
---@field ratio fun(self: ui.Gauge, ratio: integer): ui.Gauge Set the ratio of the gauge
---@field label fun(self: ui.Gauge, label: string): ui.Gauge Set the label of the gauge
---@field style fun(self: ui.Gauge, style: ui.Style): ui.Gauge Set the style of everything except the bar itself
---@field gauge_style fun(self: ui.Gauge, style: ui.Style): ui.Gauge Set the style of the bar

---Clear the content of a specific area
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/layout#clear)
---
---@class ui.Clear
---
---@field area fun(self: ui.Clear): ui.Rect Changing the area of the clear
---@field area fun(self: ui.Clear, rect: ui.Rect): ui.Clear Changing the area of the clear

---@alias ui.Clear_call fun(rect: ui.Rect)
