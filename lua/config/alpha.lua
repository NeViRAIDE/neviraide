local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

local function footer()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date("%H:%M:%S %A, %d %B %Y")
	return "...you have " .. total_plugins .. " installed plugins...\n" .. datetime
end

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl = "CursorLineNr"
	b.opts.hl_shortcut = "EndOfBuffer"
	return b
end

dashboard.section.header.val = {
    [[]],
	[[          ▄▄▄▓██████▓▄▄▄▄]],
	[[   ▄▄▄▓███▀▀▀░ ▄▄▄▄▄░ ▀▀▀████▄▄▄]],
	[[    ▀  ▄▄▄██████████▀▀███▄▄▄▄  ▀▀▀▀]],
	[[  ▄██▀▀▀   █▌ ████ ▐▌      ▀▀▀██▄▄▄▄▄]],
	[[▄█▀▀▀▀██▄▄▄▐▌  ██  █      ▄▄▄▓█▀▀▀]],
	[[       ██▀█████▓▓██▄▓████▀▀▀]],
	[[  ▄▄ ▄▄██   ██▄                          ▒▄                ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[   ▐█████     ██▄            ▄▄▄▄▄      ▓▒▒▄               ██║   ██║ ██║ ████╗ ████║]],
	[[     ▀███       ▀█▄        ▓███▌▀██    ▓▒▒▒▒▄              ██║   ██║ ██║ ██╔████╔██║]],
	[[       ██         ▀██▄     ████▌ ██   ▓▄▒▓▒▒▒▄             ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[        █            ▀██▄▄▄   ▄▄▓█▀  ▓▒▒▒▒▒▒▒▒▄   ███████╗  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[                         ▀▀▀▀▀▀▀   ▄▒▒▒▒▒▒▒▒▒▒▒▌  ╚══════╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
	[[                                  ▄▒▒▒▒▓   ▀▒▒▒▒▓    ]],
	[[                                 ▄▒▒▒▒▒     ▒▒▒▒▓▓   ]],
	[[                                ▓▒▒▒▒▒▓     ▐▒▒▒▒▓▄  ]],
	[[                               ▓▓▀▀             ▀▀▓▒▄]],
	[[]]
}
dashboard.section.header.opts.hl = "String"

dashboard.section.buttons.val = {
	button("<F3>", "⌨ ▶ Keybindings"),
	button("start to create...", " ▶ New file", "<Cmd>ene<CR>"),
	button("SPC s l", " ▶ Open saved session"),
	button("SPC t f", " ▶ Find file"),
	button("SPC t w", " ▶ Find word"),
	button("SPC t r", "⌚ ▶ Recently opened files"),
	button("by 'Packer'", " ▶ Update plugins", "<Cmd>PackerUpdate<CR>"),
	button("q", "⏻ ▶ Quit", "<Cmd>qa<CR>"),
}
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Comment"

alpha.setup(dashboard.config)
-- -- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
