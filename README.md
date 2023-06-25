# ORKING VERSION OF MY CONFIG ON "lightIDEgo" branch
try it
---

# NEVIRAIDE
Fast, comfortable and light IDE
---
![Welcome](./neviraide_screens/dashboard1.gif)

### This is my setup of NEOVIM
***Remember that it's only modifications of config files and collect of different plugins.
Vim/Neovim is a FREEDOM.
You can setup your own IDE or simple text editor.
You need only define what you want and what you need.***

#### Content
- [Screenshots](#screenshots)
- [Dependencies](#dependecies)
- [Instalation](#installation)
  - [Auto](#auto)
  - [Manual](#manual)
- [Used plugins](#used-plugins)
___
## Screenshots
#### Customizable startup screen
![Interface](./neviraide_screens/startup_screen.png)
___
#### Comfortable colors for long reading
![Interface](https://github.com/RAprogramm/NEVIRAIDE/blob/golangIDE/neviraide_screens/interface.png)
___
#### Wokring in shell
![Terminal](./neviraide_screens/terminal.png)
___
#### All git actions with lazygit
![Lazygit](./neviraide_screens/lazygit.png)
___
## Dependencies
<details>

- fd *(search in filesystem)*
- git
- npm (package manager nodejs)
- ripgrep *(search in text)*
- npm *(install dependecies)*
- unzip *(install dependecies)*
- lazygit *(working with git)*
- nonicons *(font for icons)*
- delta *(pretty look git diff)*
</details>

~~~## Installation
Make sure that all dependecies are installed.
###  Auto
!!! THIS TIME INSTALL SCRIPT NOT READY. I TRY TO MAKE INSTALLATION MORE COMFORTABLE, SO I WILL REWRITE INSTALLATION
SCRIPT TO GO LANGUAGE. IF YOU WANT TO TRY HTIS CONFIG USE MANUAL INSTALLATION

To quick install my vision of neovim (calls NEVIRAIDE) you may download install script and rin it!

**[Install script](https://github.com/RAprogramm/NEVIRAIDE/blob/golangIDE/install.sh)** - to download it right click and "Save Link As..."

### Manual
1. Install dependecies
2. Clone this repository.
3. Delete ~/.config/nvim (if exist)
4. Rename it (from "NEVIRAIDE" to "nvim").
5. Move our renamed folder to ~/.config 
___~~~

### Used plugins

<details>
<summary>Core</summary>

- [Lazy]() - plugin manager
- [Plenary](https://github.com/nvim-lua/plenary.nvim) - plugin for async 
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - is very powerfull feature
</details>

<details>
<summary>UI</summary>

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

