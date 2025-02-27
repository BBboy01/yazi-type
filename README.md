[Type References](https://yazi-rs.github.io/docs/plugins/overview)

# yazi type

Details to see [Lua Language Server Addons](https://github.com/LuaLS/LLS-Addons)

## 📦 Installation

```bash
git clone https://github.com/BBboy01/yazi-type <path_where_you_like>
```

## ⚙️ Configuration

Examples:

```lua
{
  "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "local/path/where/this/repo/is",
        { path = "local/path/where/this/repo/is", words = {"ya", "ui", "ps", "fs", "Command"} }, --- conditional load
      },
    },
},
```
