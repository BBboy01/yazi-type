---@meta

-- version: 25.2.11
---
---This object is created by `Command:spawn()` and represents a running child process.
---
---You can access the runtime data of this process through its proprietary methods.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#child)
---
---@class Child
child = {}

---@alias event
---| 0
---| 1
---| 2

---Let's say "available data source" refers to `stdout` or `stderr` that has been set with `Command.PIPED`, or them both.
---`read()` reads data from the available data source alternately, and the `event` indicates the source of the data:
--- - The data comes from stdout if event is 0.
--- - The data comes from stderr if event is 1.
--- - There's no data to read from both stdout and stderr, if event is 2.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.read)
---
---@param len integer
---
---@return string|nil data, event event
function child:read(len) end

---Similar to `read()`, but it reads data line by line.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.read_line)
---
---@return string|nil line, event event
function child:read_line() end

---Similar to `read_line()`, but it accepts a table of options
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.read_line_with)
---
---@param opts {timeout: integer} timeout in milliseconds
---
---@return string|nil line, event|3 event
function child:read_line_with(opts) end

---Writes all bytes from the string src to the stdin of the child process
---
---Please ensure that the child's stdin is available when calling this method, specifically:
---1. `stdin(Command.PIPED)` is set.
---2. `take_stdin()` has never been called.
---
---Otherwise, an error will be thrown.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.write_all)
---
---@param src string timeout in milliseconds
---
---@return boolean ok, Error err
function child:write_all(src) end

---Flushes any buffered data to the stdin of the child process
---
---Please ensure that the child's stdin is available when calling this method, specifically:
---1. `stdin(Command.PIPED)` is set.
---2. `take_stdin()` has never been called.
---
---Otherwise, an error will be thrown.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.flush)
---
---@return boolean ok, Error err
function child:flush() end

---Wait for the child process to finish
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.wait)
---
---@return Status|nil status, Error err
function child:wait() end

---Wait for the child process to finish and get the output
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.wait_with_output)
---
---@return Output|nil output, Error err
function child:wait_with_output() end

---Send a SIGTERM signal to the child process
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.start_kill)
---
---@return boolean ok, Error err
function child:start_kill() end

---Take and return the stdin stream of the child process, which can only be called once and is only applicable to processes with `stdin(Command.PIPED)` set; otherwise, it returns `nil`.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.take_stdin)
---
---@return any stdin
function child:take_stdin() end

---Take and return the stdout stream of the child process, which can only be called once and is only applicable to processes with `stdout(Command.PIPED)` set; otherwise, it returns `nil`.
---This is useful when redirecting stdout to another process's stdin:
---```lua
---local echo = Command("echo"):arg("Hello"):stdout(Command.PIPED):spawn()
---
---local rev = Command("rev"):stdin(echo:take_stdout()):stdout(Command.PIPED):output()
---
---ya.err(rev.stdout) -- "olleH\n"
---```
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.take_stdout)
---
---@return any stdout
function child:take_stdout() end

---Take and return the stderr stream of the child process, which can only be called once and is only applicable to processes with `stderr(Command.PIPED)` set; otherwise, it returns `nil`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Child.take_stderr)
---
---@return any stderr
function child:take_stderr() end

