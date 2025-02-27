---@meta

-- version: 25.2.11
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types)
---

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.url)
---
---@class Url
---@field frag string The fragment string of the url. Let's say the url archive:///root/my-archive.zip#1.jpg, the fragment 1.jpg
---@field is_regular boolean Whether the file represented by the url is a regular file
---@field is_search boolean Whether the file represented by the url from the search result
---@field is_archive boolean Whether the file represented by the url from an archive
---@field is_absolute boolean  Whether the path represented by the url is absolute
---@field has_root boolean Whether the path represented by the url has a root
---
---@field name fun(): string|nil Returns the filename if any
---@field stem fun(): string|nil Returns the filename without the extension if any
---@field join fun(url: Url | string): Url Joins with another Url or a string of url, returns a new Url
---@field parent fun(): Url|nil Returns parent directory Url if any
---@field starts_with fun(url: Url | string): boolean Whether the url starts with another Url or a string of url
---@field ends_with fun(url: Url | string): boolean Whether the url ends with another Url or a string of url
---@field strip_prefix fun(url: Url | string): Url Strips the prefix of another Url or a string of url, returns a new Url
---
---@operator concat(Url): Url

---Create a Url
---@param path string
---@return Url url
function Url(path) end

---Cha means one file's characteristics
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.cha)
---
---@class Cha
---@field is_dir boolean Whether this file is a directory
---@field is_hidden boolean Whether this file is hidden (starts with a dot)
---@field is_link boolean Whether this file is a symlink
---@field is_orphan boolean Whether this file is a bad symlink, which points to a non-existent file
---@field is_dummy boolean Whether the file is dummy, which fails to load complete metadata, possibly the filesystem doesn't support it, such as FUSE
---@field is_block boolean Whether this file is a block device
---@field is_char boolean Whether this file is a character device
---@field is_fifo boolean Whether this file is a fifo
---@field is_sock boolean Whether this file is a socket
---@field is_exec boolean Whether this file is executable
---@field is_sticky boolean Whether this file has the sticky bit set
---
---@field len integer The length of this file, returns an integer representing the size in bytes. Note that it can't reflect the size of a directory, use size() instead
---@field atime string|nil The accessed time of this file in Unix timestamp
---@field btime string|nil The birth time of this file in Unix timestamp
---@field mtime string|nil The modified time of this file in Unix timestamp
---
---@field uid string|nil The user id of this file (Unix only)
---@field gid string|nil The group id of this file (Unix only)
---@field nlink integer|nil The number of hard links to this file (Unix only)
---
---@field perm fun(): string|nil Unix permissions of this file in string, e.g. drwxr-xr-x. For Windows, it's always `nil`

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.file)
---
---@class File
---@field url Url The [Url](lua://Url) of this file
---@field cha Cha The [Cha](lua://Cha) of this file
---@field link_to Url|nil The [Url](lua://Url) of this file pointing to, if it's a symlink
---@field name string The name of this file

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.icon)
---
---@class Icon
---@field text string The text of this icon
---@field style ui.Style The Style of this icon

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.error)
---
---@class Error
---@field code integer|nil The raw error code if any
---
---@operator concat(string): string

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.range)
---
---@class Range

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#shared.window)
---
---@class Window
---@field rows integer The number of rows of this window
---@field cols integer The number of cols of this window
---@field width integer The width of this window in pixels
---@field height integer The height of this window in pixels

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data)
---
---@class cx
---@field active tab.Tab The active tab
---@field tabs manager.Tabs All of tabs
---@field yanked manager.Yanked The yanked urls
---@field tasks tasks.Tasks All of tasks
cx = {}

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.manager-tabs)
---
---@class manager.Tabs
---@field idx integer The index of the active tab
---
---@field __len fun(): integer
---@field __index fun(index: integer): tab.Tab Access the Tab by index

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.manager-yanked)
---
---@class manager.Yanked
---@field is_cut boolean Whether the yanked urls are cut
---
---@field __len fun(): integer
---@field __pairs fun() Iterate over the yanked Urls

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tasks-tasks)
---
---@class tasks.Tasks
---@field progress tasks.Tasks.progress The progress of all tasks

---@class tasks.Tasks.progress
---@field total integer Number of tasks
---@field succ integer Number of successed tasks
---@field fail integer Number of failed tasks
---@field found integer Number of found tasks
---@field processed integer Number of processed tasks

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tab-tab)
---
---@class tab.Tab
---@field mode tab.Mode The mode of this tab
---@field perf tab.Preference The preference of this tab
---@field current tab.Folder The current folder within this tab
---@field parent tab.Folder|nil The parent folder within this tab
---@field selected tab.Selected The selected files within this tab
---@field preview tab.Preview The preview within this tab

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tab-mode)
---
---@class tab.Mode
---@field is_select boolean Whether the mode is select
---@field is_unset boolean Whether the mode is unset
---@field is_visual boolean Whether the mode is select or unset

---These properties are consistent with those in `yazi.toml`
---
---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tab-preference)
---
---@class tab.Preference
---@field sort_by sort_by File sorting method
---@field sort_sensitive boolean Sort case-sensitively
---@field sort_reverse boolean Display files in reverse order
---@field sort_dir_first boolean Display directories first
---@field sort_translit boolean Transliterate filenames for sorting (i.e. replaces Â as A, Æ as AE, etc.), only available if sort_by = "natural". This is useful for files that contain Hungarian characters.
---@field linemode linemode Display information associated with the file on the right side of the file list row
---@field show_hidden boolean Show hidden files

---@alias sort_by
---| "none" Don't sort
---| "mtime" Sort by last modified time
---| "btime" Sort by birth time
---| "extension" Sort by file extension
---| "alphabetical" Sort alphabetically, e.g. `1.md` < `10.md` < `2.md`
---| "natural" Sort naturally, e.g. `1.md` < `2.md` < `10.md`
---| "size" Sort by file size
---| "random" Sort randomly

---@alias linemode
---| "none" No line mode
---| "size" Display the size in bytes of the file. Note that currently directory sizes are only evaluated when `sort_by = "size"`, and this might change in the future
---| "btime" Display the birth time of the file
---| "mtime" Display the last modified time of the file
---| "permissions" Display the permissions of the file, only available on Unix-like systems
---| "owner" Display the owner of the file, only available on Unix-like systems

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tab-folder)
---
---@class tab.Folder
---@field cwd Url The current working directory of this folder
---@field offset integer The offset of this folder
---@field cursor integer The cursor position of this folder
---@field window File[] Files in the visible area of this folder
---@field files fs.File[] Files in the visible area of this folder
---@field hovered File|nil The hovered File of this folder

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tab-selected)
---
---@class tab.Selected
---@field __len fun(): integer
---@field __pairs fun() Iterate over the selected Urls

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.tab-preview)
---
---@class tab.Preview
---@field skip integer The number of units to skip. The units largely depend on your previewer, such as lines for code and percentages for videos
---@field folder tab.Folder|nil The Folder being previewed, or `nil` if this preview is not for folders

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.fs-files)
---
---@class fs.Files
---@field __len fun(): integer
---@field __index fun(index: integer): fs.File Access the File by index

---[Open in Browser](https://yazi-rs.github.io/docs/plugins/types#app-data.fs-file)
---
---@class fs.File : File
---@field size fun(): integer|nil The size in bytes of this file, or nil if its a directory and it has not been evaluated
---@field mime fun(): string|nil The mime-type of this file,or `nil` if it's a directory or hasn't been lazily calculated at all
---@field prefix fun(): string The prefix of this file relative to `CWD`, which used in the flat view during search. For instance, if `CWD` is `/foo`, and the file is `/foo/bar/baz`, then the prefix is `bar/`
---@field icon fun(): Icon|nil The [Icon](lua://Icon) of this file, [icon] rules are applied; if no rule matches, returns nil
---@field style fun(): ui.Style|nil The [Style](lua://ui.Style) of this file, [filetype] rules are applied; if no rule matches, returns nil
---@field is_hovered fun(): boolean Whether this file is hovered
---@field is_yanked fun(): boolean Whether this file is yanked
---@field is_selected fun(): boolean Whether this file is selected
---@field found fun(): fs.File.found|nil When users find a file using the find command, the status of the file - returns `nil` if it doesn't match the user's find keyword
---@field highlights fun() TODO

---@class fs.File.found
---@field idx integer The position of matched file
---@field all integer The number of all matched files
