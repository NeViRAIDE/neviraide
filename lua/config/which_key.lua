local wk = require("which-key")
wk.setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = { enabled = false, suggestions = 20 },
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	operators = { gc = "Comments" },
	key_labels = {
		["<space>"] = "SPACE",
		["<cr>"] = "Enter",
		["<tab>"] = "TAB",
		["<C>"] = "Ctrl",
	},
	icons = { breadcrumb = "»", separator = "➜", group = "+" },
	popup_mappings = { scroll_down = "<c-j>", scroll_up = "<c-k>" },
	window = {
		border = "single",
		position = "bottom",
		margin = { 1, 6, 1, 6 },
		padding = { 2, 2, 2, 2 },
		winblend = 10,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 13,
		align = "center",
	},
	ignore_missing = false,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
})
wk.register({
	["<C-s>"] = { ":wa<CR>", "Save All Files" },
	["<F2>"] = { ":SidebarNvimToggle<CR>", "Show/Close Sidebar" },
	["<F3>"] = { ":WhichKey<CR>", "Show all keybindings" },
	["<leader>"] = {
		name = "Leader Key Actions",
		f = { ":lua vim.lsp.buf.formatting()<CR>", " Format File " },
		g = { ":Neogit<CR>", " Git  " },
		c = {
			name = "Create notes",
			f = { "OFIX:<esc>:CommentToggle<CR>A ", "Perhaps i have a bug..." },
			t = { "OTODO:<esc>:CommentToggle<CR>A ", "I have to do this next time..." },
			h = { "OHACK:<esc>:CommentToggle<CR>A ", "I need to HACK this..." },
			w = { "OWARN:<esc>:CommentToggle<CR>A ", "I need to WARN this..." },
			p = { "OPERF:<esc>:CommentToggle<CR>A ", "This part can be better..." },
			n = { "ONOTE:<esc>:CommentToggle<CR>A ", "I should remember about this..." },
		},
		s = {
			name = "Session",
			s = { "<cmd>SessionSave<CR>", "Save this session" },
			l = { "<cmd>SessionLoad<CR>", "Load saved session" },
		},
		t = {
			name = "Telescope",
			p = {
				"<cmd>lua require('telescope.builtin').pickers()<CR>",
				"Pickers",
			},
			e = {
				"<cmd>lua require('telescope.builtin').registers()<CR>",
				"Registers",
			},
			m = {
				"<cmd>lua require('telescope.builtin').man_pages()<CR>",
				"Manual Pages",
			},
			r = {
				"<cmd>lua require('telescope.builtin').oldfiles()<CR>",
				"Recent Files",
			},
			b = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({initial_mode='normal',previewer=false,sort_lastused=true}))<CR>",
				"Show open buffers",
			},
			f = {
				"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>",
				"Find Files",
			},
			w = {
				"<cmd>lua require('telescope.builtin').live_grep()<CR>",
				"Find Word",
			},
			h = {
				"<cmd>lua require('telescope.builtin').help_tags()<CR>",
				"Help Tags",
			},
			t = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Tags" },
			s = {
				"<cmd>lua require('telescope.builtin').grep_string()<CR>",
				"Find String",
			},
			o = {
				"<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>",
				"Tags (Only Current Buffers)",
			},
		},
		d = {
			name = "Diagnostics",
			w = {
				":lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({initial_mode = 'normal', previewer = false, layout_config = {bottom_pane = {height = 12}}}))<CR>",
				"Workspace Diagnostics",
			},
			s = {
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				"Show Diagnostic Line",
			},
			p = {
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				"Jump To Previous Diagnostic Line",
			},
			n = {
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				"Jump To Next Diagnostic Line",
			},
			l = {
				"<cmd>lua vim.diagnostic.setloclist()<CR>",
				"Location List",
			},
		},
		w = {
			name = "Workspaces",
			a = {
				"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
				"Add Workspace Folder",
			},
			r = {
				"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
				"Remove Workspace Folder",
			},
			l = {
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
				"Workspace Folder's List",
			},
		},
		l = {
			name = "LSP",
			h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
			r = {
				":lua require('telescope.builtin').lsp_references(require('telescope.themes').get_ivy({initial_mode = 'normal', previewer = false, layout_config = {bottom_pane = {height = 12}}}))<CR>",
				"References",
			},
			a = {
				":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor({initial_mode = 'normal'}))<CR>",
				"Code actions",
			},
			n = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
			d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
			t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Sign help" },
		},
	},
})
