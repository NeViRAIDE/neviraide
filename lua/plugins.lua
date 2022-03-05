local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
vim.cmd([[packadd packer.nvim]])
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
vim.cmd([[packadd packer.nvim]])
require("packer").init({
	git = { clone_timeout = 350 },
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = { toggle_info = "o" },
	},
})
return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use("github/copilot.vim")
		use({ "onsails/lspkind-nvim" })
		use("neovim/nvim-lspconfig")
		use("folke/lsp-colors.nvim")
		use("williamboman/nvim-lsp-installer")
		use("ray-x/lsp_signature.nvim")
		use("jose-elias-alvarez/null-ls.nvim")
		use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip").config.setup({ history = false })
			end,
		})
		use({
			"hrsh7th/nvim-cmp", --- Autocompletion
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")
				local has_words_before = function()
					if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
						return false
					end
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0
						and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
				end
				cmp.setup({
					preselect = cmp.PreselectMode.None,
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					completion = { completeopt = "menu,menuone,noselect" },
					mapping = {
						["<C-p>"] = cmp.mapping.select_prev_item({
							behavior = cmp.SelectBehavior.Insert,
						}),
						["<C-n>"] = cmp.mapping.select_next_item({
							behavior = cmp.SelectBehavior.Insert,
						}),
						["<C-d>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.close(),
						["<CR>"] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						}),
						["<Tab>"] = cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif luasnip.expand_or_jumpable() then
								luasnip.expand_or_jump()
							elseif has_words_before() then
								cmp.complete()
							else
								fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
							end
						end, { "i", "s" }),
					},
					documentation = {
						border = {
							"╭",
							"─",
							"╮",
							"│",
							"╯",
							"─",
							"╰",
							"│",
						},
						winhighlight = "FloatBorder:TelescopeBorder",
					},
					sources = {
						{ name = "latex_symbols" },
						{ name = "luasnip" },
						{ name = "nvim_lua" },
						{ name = "nvim_lsp" },
						{ name = "calc" },
						{ name = "path" },
						{ name = "buffer" },
					},
					formatting = {
						format = function(entry, vim_item)
							vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
							vim_item.menu = ({
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								luasnip = "[Snippet]",
								calc = "[Calculator]",
								path = "[Path]",
								latex_symbols = "[Latex]",
							})[entry.source.name]
							return vim_item
						end,
					},
				})
			end,
			requires = {
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "kdheepak/cmp-latex-symbols" },
				{ "L3MON4D3/LuaSnip" },
			},
		})
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			event = "BufRead",
			config = function()
				require("gitsigns").setup({
					signs = {
						add = {
							hl = "GitSignsAdd",
							text = "│",
							numhl = "GitSignsAddNr",
							linehl = "GitSignsAddLn",
						},
						change = {
							hl = "GitSignsChange",
							text = "│",
							numhl = "GitSignsChangeNr",
							linehl = "GitSignsChangeLn",
						},
						delete = {
							hl = "GitSignsDelete",
							text = "│",
							numhl = "GitSignsDeleteNr",
							linehl = "GitSignsDeleteLn",
						},
						topdelete = {
							hl = "GitSignsDelete",
							text = "│",
							numhl = "GitSignsDeleteNr",
							linehl = "GitSignsDeleteLn",
						},
						changedelete = {
							hl = "GitSignsChange",
							text = "│",
							numhl = "GitSignsChangeNr",
							linehl = "GitSignsChangeLn",
						},
					},
					signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
					numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
					linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
					word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
					watch_gitdir = { interval = 1000, follow_files = true },
					attach_to_untracked = true,
					current_line_blame = true,
					current_line_blame_opts = {
						virt_text = true,
						virt_text_pos = "right_align",
						delay = 1000,
						ignore_whitespace = false,
					},
					current_line_blame_formatter_opts = { relative_time = false },
					sign_priority = -100,
					update_debounce = 100,
					status_formatter = nil,
					max_file_length = 40000,
					preview_config = {
						border = "single",
						style = "minimal",
						relative = "cursor",
						row = 0,
						col = 1,
					},
					diff_opts = { internal = true }, -- If vim.diff or luajit is present
					yadm = { enable = false },
				})
			end,
		})
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter" })
		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
		})
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "kyazdani42/nvim-web-devicons" })
		use("navarasu/onedark.nvim")
		use("beauwilliams/statusline.lua")
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				local alpha = require("alpha")
				local startify = require("alpha.themes.startify")
				startify.section.top_buttons.val = {
					startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				}
				startify.section.mru.val = { { type = "padding", val = 0 } }
				startify.section.bottom_buttons.val = {
					startify.button("q", "  Quit NVIM", ":qa<CR>"),
				}
				startify.section.footer = {
					{ type = "string", val = "footer" },
				}
				alpha.setup(startify.config)
			end,
		})
		use("lukas-reineke/indent-blankline.nvim")
		use({ "norcalli/nvim-colorizer.lua" })
		use("folke/todo-comments.nvim")
		use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
		use("sidebar-nvim/sidebar.nvim")
		use("folke/which-key.nvim")
		use("terrortylor/nvim-comment")
		use("windwp/nvim-autopairs")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
