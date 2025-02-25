---@meta

-- version: 25.2.11
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps)
---
---@class ps
ps = {}

--- Publish a message to the current instance, and all plugins subscribed through sub() for this kind will receive it, achieving internal communication within the instance
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps.pub)
---
---@param kind string the kind of the message, which is a string of alphanumeric with dashes, and cannot be `built-in kinds`
---@param value table<string|number, command_arg> the value of the message, which is a sendable value
function ps.pub(kind, value) end

--- Publish a message to a specific instance with `receiver` as the ID
--- - If the receiver is the current instance (local), and is subscribed to this `kind` through `sub()`, it will receive this message.
--- - If the receiver is not the current instance (remote), and is subscribed to this `kind` through `sub_remote()`, it will receive this message.
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps.pub_to)
---
---@param receiver integer ID of the remote instance; if it's 0 then broadcasting to all remote instances
---@param kind string the kind of the message, which is a string of alphanumeric with dashes, and cannot be `built-in kinds`
---@param value table<string|number, command_arg> the value of the message, which is a sendable value
function ps.pub_to(receiver, kind, value) end

--- Subscribe to local messages of `kind` and call the `callback` handler for it
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps.sub)
---
---@param kind string the kind of the message
---@param callback fun(body) the callback function, with a single parameter body containing the content of the message
function ps.sub(kind, callback) end

--- Similar to `sub()`, but it subscribes to remote messages of this `kind` instead of local
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps.sub_remote)
---
---@param kind string the kind of the message
---@param callback fun(body) the callback function, with a single parameter body containing the content of the message
function ps.sub_remote(kind, callback) end

--- Unsubscribe from local messages of this `kind`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps.unsub)
---
---@param kind string the kind of the message
function ps.unsub(kind) end

--- Unsubscribe from remote messages of this `kind`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps.unsub_remote)
---
---@param kind string the kind of the message
function ps.unsub_remote(kind) end
