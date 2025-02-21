---@meta

-- version: 25.2.11
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya)
---
---@class ya
ya = {}

---@class permit.drop
local permit = {}

function permit:drop() end

---Hide Yazi to the secondary screen by returning to the terminal,
---completely controlled by the requested plugin.
---
---Note that since there's always only one available terminal control resource, ya.hide() cannot be called again before the previous permit is dropped, otherwise an error will be thrown, effectively avoiding deadlocks.
---
---This function is only available in the async context.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.hide)
---
---@return permit.drop drop # a permit for this resource. When it's necessary to restore the TUI display, call its drop() method
function ya.hide() end

---@class file_cach_opts
---@field file string The File to be cached
---@field skip integer The number of units to skip. It's units largely depend on your previewer, such as lines for code, and percentages for videos

---Calculate the cached Url corresponding to the given file
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.file_cache)
---
---@param opts file_cach_opts
function ya.file_cahe(opts) end

---Re-render the UI, can only be used in the sync context
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.render)
function ya.render() end

---@alias command_arg nil|boolean|number|string|Url|command_arg[]

---Send a command to the [manager](https://yazi-rs.github.io/docs/configuration/keymap#manager)
---without waiting for the executor to execute
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.manager_emit)
---
---@param cmd string the command name
---@param args table<string|number, command_arg> the arguments of the command, which is a table with a number or string key and sendable values
function ya.manager_emit(cmd, args) end

--- Display the given image within the specified area, and the image will downscale to fit that area automatically
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.image_show)
---
---@param url Url the Url of the image
---@param rect ui.Rect
function ya.image_show(url, rect) end

---@class ya.which._opts
---@field cands ya.which._cands[] the key candidates

---@class ya.which._cands
---@field on string|string[] the key to be prompted
---@field desc? string the description of the key

--- Pre-cache the image to a specified url based on user-configured `max_width` and `max_height`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.image_precache)
---
---@param src Url the source Url of the image
---@param dist Url the destination Url of the image
function ya.image_precache(src, dist) end

--- Prompt users with a set of available keys
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.which)
---
---@param opts ya.which._opts the source Url of the image
---@param silent boolean whether to show the UI of key indicator
function ya.which(opts, silent) end

---@class ya.input._opts
---@field title string the title of the input
---@field value? string the default value of the input
---@field position ya.input._position the position of the input
---@field realtime? boolean whether to report user input in real time
---@field debounce? number the number of seconds to wait for the user to stop typing, which is a positive float. Can only be used when `realtime = true`

---@alias ya.input._position.position "top-left"|"top-center"|"top-right"|"bottom-left"|"bottom-center"|"bottom-right"|"center"|"hovered"

---@class ya.input._position
---@field [1] ya.input._position.position the origin position of the input
---@field x? integer the X offset from the origin position
---@field y? integer the Y offset from the origin position
---@field w integer the width of the input
---@field h integer the height of the input

---@alias ya.input._return.value string|nil The user input value carried by this event, which is a string if the `event` is non-zero; otherwise, `nil`
---@alias ya.input._return.event
---|0 Unknown error
---|1 The user has confirmed the input
---|2 The user has canceled the input
---|3 The user has changed the input (only if `realtime` is true)

--- Request user input
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.input)
---
---@param opts ya.input._opts the options of the input
---
---@return ya.input._return.value, ya.input._return.event
function ya.input(opts) end

---@class ya.notify._opts
---@field title string the title of the notification
---@field content string the content of the notification
---@field timeout number the timeout of the notification
---@field level? 'info'|'warn'|'error' the level of the notification. Default is `info`

--- Send a foreground notification to the user
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.notify)
---
---@param opts ya.notify._opts the options of the notification
function ya.notify(opts) end

--- Append messages to the log file at the debug level
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.dbg)
---
---@param ... any the message to be logged
function ya.dbg(...) end

--- Append messages to the log file at the error level
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ya.error)
---
---@param ... any the message to be logged
function ya.error(...) end
