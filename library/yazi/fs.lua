---@meta

-- version: 25.2.11
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#ps)
---
---@class fs
fs = {}

--- This function was added to compensate for the lack of a `getcwd` in Lua; it is used to retrieve the directory of the last `chdir` call
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.cwd)
---
---@return Url|nil url, Error err
function fs.cwd() end

--- Get the `Cha` of the specified file
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.cha)
---
---@param url Url the `Url` of the file
---@param follow? boolean whether to follow the symbolic link
---
---@return Cha|nil cha, Error err
function fs.cha(url, follow) end

--- Write data to the specified file
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.write)
---
---@param url Url the `Url` of the file
---@param data string the data to be written
---
---@return boolean ok, Error err
function fs.write(url, data) end

---@alias create_type
---| 'dir' Creates a new, empty directory
---| 'dir_all' Recursively create a directory and all of its parents if they are missing

--- Create the specified file(s) in the filesystem
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.create)
---
---@param type create_type the type of creation
---@param url Url the `Url` of the target
---
---@return boolean ok, Error err
function fs.create(type, url) end

---@alias remove_type
---| 'file' Removes a file from the filesystem
---| 'dir' Removes an existing, empty directory
---| 'dir_all' Removes a directory at this url, after removing all its contents. Use carefully!
---| 'dir_clean' Remove all empty directories under it, and if the directory itself is empty afterward, remove it as well

--- Remove the specified file(s) from the filesystem
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.remove)
---
---@param type remove_type the type of removal
---@param url Url the `Url` of the target
---
---@return boolean ok, Error err
function fs.remove(type, url) end

---@class fs.read_dir._options
---@field glob? string A glob pattern to filter files out if provided
---@field limit? number The maximum number of files to read, which is an integer, defaults to unlimited
---@field resolve? boolean Whether to resolve symbolic links, defaults to false

--- Reads the contents of a directory
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.read_dir)
---
---@param url Url the `Url` of the directory
---@param options? fs.read_dir._options a table with the following options
---
---@return File[]|nil files, Error err
function fs.read_dir(url, options) end

--- Get a unique name from the given `Url` to ensure it's unique in the filesystem
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/utils#fs.unique_name)
---
---@param url Url the `Url` of the path to get a unique name
---
---@return Url|nil url, Error err
function fs.unique_name(url) end
