---@meta

-- version: 25.2.11
---
---You can invoke external programs through:
---
---```lua
---local child, err = Command("ls")
---  :args({ "-a", "-l" })
---  :stdout(Command.PIPED)
---  :spawn()
---```
---
---Compared to Lua's os.execute, it provides many comprehensive and convenient methods, and the entire process is async.
---
---It takes better advantage of the benefits of concurrent scheduling. However, it can only be used in async contexts, such as preloaders, previewers, and async functional plugins.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#command)
---
---@param cmd string
---
---@return Command_mod
function Command(cmd) end

---@class Command_mod
local Command_mod = {}

--- Append an argument to the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.arg)
---
---@param arg string the argument to be appended
---
---@return Command_mod self
function Command_mod:arg(arg) end

--- Append multiple arguments to the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.args)
---
---@param args string[] the arguments to be appended
---
---@return Command_mod self
function Command_mod:args(args) end

--- Set the current working directory of the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.dir)
---
---@param dir string the directory of the command
---
---@return Command_mod self
function Command_mod:cwd(dir) end

--- Append an environment variable to the command:
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.env)
---
---@param key string the key of the environment variable
---@param value string the value of the environment variable
---
---@return Command_mod self
function Command_mod:env(key, value) end


---@alias Command.PIPED any Pipe
---@alias Command.NULL any Discard
---@alias Command.INHERIT any Inherit
---@alias Command_mod.std._cfg
---| Command.PIPED
---| Command.NULL
---| Command.INHERIT

--- Set the stdin of the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.stdin)
---
---@param cfg Command_mod.std._cfg the configuration of the stdin
---
---@return Command_mod self
function Command_mod:stdin(cfg) end

--- Set the stdout of the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.stdout)
---
---@param cfg Command_mod.std._cfg the configuration of the stdout
---
---@return Command_mod self
function Command_mod:stdout(cfg) end

--- Set the stderr of the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.stderr)
---
---@param cfg Command_mod.std._cfg the configuration of the stderr
---
---@return Command_mod self
function Command_mod:stderr(cfg) end

--- Spawn the command
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.spawn)
---
---@return Child|nil child, Error err
function Command_mod:spawn() end

--- Spawn the command and wait for it to finish
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.output)
---
---@return Output|nil output, Error err
function Command_mod:output() end

--- Executes the command as a child process, waiting for it to finish and collecting its exit status
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils/#Command.status)
---
---@return Status|nil output, Error err
function Command_mod:status() end

---@class Output
---@field status Status The `Status` of the child process
---@field stdout string The stdout of the child process
---@field stderr string The stderr of the child process

---@class Status
---@field success boolean whether the child process exited successfully
---@field code integer the exit code of the child process
