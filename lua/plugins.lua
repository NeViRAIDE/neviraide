local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

vim.cmd [[packadd packer.nvim]]
require("packer").init(
    {
        git = {clone_timeout = 350},
        display = {
            title = "Packer",
            done_sym = "",
            error_syn = "×",
            keybindings = {toggle_info = "o"}
        }
    }
)

return require("packer").startup(
    function(use)
        use {"wbthomason/packer.nvim"}

        use {
            "lewis6991/impatient.nvim",
            opt = true,
            config = function()
                require("impatient")
            end
        }

        use {"nvim-lua/popup.nvim"}
        use {"nvim-lua/plenary.nvim"}

        use "navarasu/onedark.nvim"

        use "nvim-telescope/telescope.nvim"

        use "folke/lsp-colors.nvim"

        use "windwp/nvim-autopairs"
        use {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip").config.setup({history = false})
            end
        }

        use "neovim/nvim-lspconfig"
        use "williamboman/nvim-lsp-installer"
        use {
            "hrsh7th/nvim-cmp", --- Autocompletion
            config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")
                local has_words_before = function()
                    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
                        return false
                    end
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    return col ~= 0 and
                        vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                end

                -- local feedkey = function(key)
                --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true,
                --                                                          true, true),
                --                           "n", true)
                -- end
                cmp.setup {
                    preselect = cmp.PreselectMode.None,
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end
                    },
                    completion = {completeopt = "menu,menuone,noselect"},
                    mapping = {
                        ["<C-p>"] = cmp.mapping.select_prev_item(
                            {
                                behavior = cmp.SelectBehavior.Insert
                            }
                        ),
                        ["<C-n>"] = cmp.mapping.select_next_item(
                            {
                                behavior = cmp.SelectBehavior.Insert
                            }
                        ),
                        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.close(),
                        ["<CR>"] = cmp.mapping.confirm(
                            {
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true
                            }
                        ),
                        ["<Tab>"] = cmp.mapping(
                            function(fallback)
                                if cmp.visible() then
                                    cmp.select_next_item()
                                elseif luasnip.expand_or_jumpable() then
                                    luasnip.expand_or_jump()
                                elseif has_words_before() then
                                    cmp.complete()
                                else
                                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                                end
                            end,
                            {"i", "s"}
                        )
                        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                        --     if vim.fn.pumvisible() == 1 then
                        --         feedkey("<C-p>")
                        --     elseif luasnip.jumpable(-1) then
                        --         luasnip.jump(-1)
                        --     else
                        --         fallback()
                        --     end
                        -- end, {"i", "s"})
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
                            "│"
                        },
                        winhighlight = "FloatBorder:TelescopeBorder"
                    },
                    sources = {
                        {name = "luasnip"},
                        {name = "nvim_lua"},
                        {name = "nvim_lsp"},
                        {name = "calc"},
                        {name = "path"},
                        {name = "buffer"}
                    },
                    experimental = {ghost_text = true},
                    formatting = {
                        format = function(entry, vim_item)
                            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
                            vim_item.menu =
                                ({
                                buffer = "[Buffer]",
                                nvim_lsp = "[LSP]",
                                luasnip = "[Snippet]",
                                calc = "[Calculator]",
                                path = "[Path]",
                                latex_symbols = "[Latex]"
                            })[entry.source.name]
                            return vim_item
                        end
                    }
                }
            end,
            requires = {
                {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
                {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
                {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"},
                {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
                {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"},
                {"hrsh7th/cmp-calc", after = "nvim-cmp"},
                {"hrsh7th/cmp-path", after = "nvim-cmp"},
                {"L3MON4D3/LuaSnip"}
            }
        }

        use {"onsails/lspkind-nvim"}

        use "ray-x/lsp_signature.nvim"
        use {
            "simrat39/symbols-outline.nvim",
            setup = function()
                vim.g.symbols_outline = {
                    highlight_hovered_item = true,
                    show_guides = true,
                    auto_preview = true,
                    position = "right",
                    width = 25,
                    show_numbers = false,
                    show_relative_numbers = false,
                    show_symbol_details = true,
                    keymaps = {
                        close = "q",
                        goto_location = "<CR>",
                        focus_location = "<space>",
                        hover_symbol = "K",
                        toggle_preview = "p",
                        rename_symbol = "r",
                        code_actions = "a"
                    }
                }
            end,
            cmd = {"SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose"}
        }

        use {
            "lewis6991/gitsigns.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            event = "BufRead",
            config = function()
                require("gitsigns").setup {
                    signs = {
                        add = {
                            hl = "GitSignsAdd",
                            text = "│",
                            numhl = "GitSignsAddNr",
                            linehl = "GitSignsAddLn"
                        },
                        change = {
                            hl = "GitSignsChange",
                            text = "│",
                            numhl = "GitSignsChangeNr",
                            linehl = "GitSignsChangeLn"
                        },
                        delete = {
                            hl = "GitSignsDelete",
                            text = "│",
                            numhl = "GitSignsDeleteNr",
                            linehl = "GitSignsDeleteLn"
                        },
                        topdelete = {
                            hl = "GitSignsDelete",
                            text = "│",
                            numhl = "GitSignsDeleteNr",
                            linehl = "GitSignsDeleteLn"
                        },
                        changedelete = {
                            hl = "GitSignsChange",
                            text = "│",
                            numhl = "GitSignsChangeNr",
                            linehl = "GitSignsChangeLn"
                        }
                    },
                    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
                    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                    keymaps = {
                        -- Default keymap options
                        noremap = true,
                        ["n ]c"] = {
                            expr = true,
                            '&diff ? \']c\' : \'<cmd>lua require"gitsigns.actions".next_hunk()<CR>\''
                        },
                        ["n [c"] = {
                            expr = true,
                            '&diff ? \'[c\' : \'<cmd>lua require"gitsigns.actions".prev_hunk()<CR>\''
                        },
                        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                        ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
                        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                        ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                        ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
                        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
                        ["n <leader>hS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
                        ["n <leader>hU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',
                        -- Text objects
                        ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
                        ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
                    },
                    watch_index = {interval = 1000, follow_files = true},
                    attach_to_untracked = true,
                    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                    current_line_blame_formatter_opts = {relative_time = false},
                    sign_priority = 6,
                    update_debounce = 100,
                    status_formatter = nil,
                    max_file_length = 40000,
                    preview_config = {
                        -- Options passed to nvim_open_win
                        border = "single",
                        style = "minimal",
                        relative = "cursor",
                        row = 0,
                        col = 1
                    },
                    use_internal_diff = true, -- If vim.diff or luajit is present
                    yadm = {enable = false}
                }
            end
        }

        use "lukas-reineke/indent-blankline.nvim"

        use "hoob3rt/lualine.nvim"
        use {"kyazdani42/nvim-web-devicons"}
        use {"norcalli/nvim-colorizer.lua"}

        use "rinx/nvim-minimap"

        use "akinsho/nvim-bufferline.lua"

        use "terrortylor/nvim-comment"
        use "folke/todo-comments.nvim"

        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter"}
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter"
        }
        use {
            "JoosepAlviste/nvim-ts-context-commentstring",
            requires = {{"Olical/aniseed", after = "nvim-treesitter"}},
            after = "nvim-treesitter"
        }
        use {
            "nvim-treesitter/playground",
            cmd = "TSPlaygroundToggle",
            after = "nvim-treesitter"
        }
        use {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"}

        use "kyazdani42/nvim-tree.lua"

        use "sbdchd/neoformat"
        --    Lua
        --
        use {"SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter"}

        use "folke/which-key.nvim"
        use "arkav/lualine-lsp-progress"

        use "glepnir/dashboard-nvim"

        use {"tami5/lspsaga.nvim"}
    end
)
