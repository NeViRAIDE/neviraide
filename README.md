# NEVIRAIDE
***Fast, comfortable and light GolangIDE with support json, markdown, lua, sql, html, bash and docker***
___
## This is my setup of NEOVIM
***...desctiption is comming soon...***
___
## Installation
Make sure that all dependecies are installed.
###  Auto
To quick install my vision of neovim (calls NEVIRAIDE) you may download install script and rin it!

**[Download install script](https://github.com/RAprogramm/NEVIRAIDE/blob/golangIDE/install.sh)** - right click and "Save Link As..."

**! Make script executable !** *(to make script executable run* `sudo chmod +x install.sh` *in place where downloaded script is located)*

### Manual
1. Clone this repository.
3. Delete ~/.config/nvim (if exist)
2. Rename it (from "NEVIRAIDE" to "nvim").
4. Move our renamed folder to ~/.config 
___
## Dependencies
<details>
- fd *(search in filesystem)*
- ripgrep *(search in text)*
- npm *(install dependecies)*
- unzip *(install dependecies)*
- lazygit *(working with git)*
- nonicons *(font for icons)*
- delta *(pretty look git diff)*
</details>


#### Comfortable colors for long reading
![Interface](https://github.com/RAprogramm/NEVIRAIDE/blob/golangIDE/neviraide_screens/interface.png)
___
Wokring in shell
![Terminal](./neviraide_screens/terminal.png)
___
#### All git actions
![Lazygit](./neviraide_screens/lazygit.png)
___
### Used plugins

<details>
<summary>Core</summary>

- [Lazy]() - plugin manager
- [Plenary](https://github.com/nvim-lua/plenary.nvim) - plugin for async 
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - is very powerfull feature
</details>

<details>
<summary>UI</summary>

- [Dashboard](https://github.com/glepnir/dashboard-nvim) - startup screen
- [Lualine]() - status line, winbar and tabline
- [Devicons](https://github.com/nvim-tree/nvim-web-devicons) - icons
- [Nonicons]() - outlined icons
- [Indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - indent guides
- [Notify](https://github.com/rcarriga/nvim-notify) - notification manager
- [DAP-UI](https://github.com/rcarriga/nvim-dap-ui) - a UI for nvim-dap
- [DAP-ghosttext](https://github.com/rcarriga/nvim-dap-ui) - a ghost text for nvim-dap
- [NoICE]() - klsadflkahsdlk
</details>

<details>
<summary>Completions</summary>

- [cmp]()
- [Luasnip](https://github.com/L3MON4D3/LuaSnip)
</details>

