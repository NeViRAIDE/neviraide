return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = function()
      local fc = require("neo-tree.sources.filesystem.components")
      return {
        event_handlers = {
          {
            event = 'file_opened',
            handler = function(file_path) require("neo-tree.command").execute({ action = "close" }) end,
          },
        },
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        default_component_configs = {
          git_status = {
            symbols = {
              added = ' ',
              modified = ' ',
              deleted = ' ',
            },
          },
          icon = {
            folder_closed = "",
            folder_open = '',
            folder_empty = '',
          },
          modified = {
            symbol = "",
          },
        },
        filesystem = {
          components = {
            name = function(config, node, state)
              local result = fc.name(config, node, state)
              if node:get_depth() == 1 and node.type ~= "message" then
                result.text = vim.fn.fnamemodify(node.path, ":t")
              end
              return result
            end,
          },
          filtered_items = {
            always_show = { ".gitignore" },
          },
          use_libuv_file_watcher = true
        },
        nesting_rules = {
          ["js"] = { "js.map" },
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local action = require('telescope.actions')
      local action_layout = require('telescope.actions.layout')
      local sorters = require("telescope.sorters")
      local previewers = require("telescope.previewers")
      return {
        pickers = {
          find_files = {
            layout_strategy = 'horizontal',
            layout_config = {
              height = 0.8,
              width = 0.9,
              prompt_position = 'top',
              preview_width = 0.6,
              scroll_speed = 2,
            },
            find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
          },
          live_grep = {
            layout_strategy = 'horizontal',
            layout_config = {
              width = 0.8,
              height = 0.5,
              prompt_position = 'top',
              preview_width = 0.5,
              scroll_speed = 2,
            },
          },
          oldfiles = {
            initial_mode = 'normal',
            previewer = false,
            theme = 'dropdown',
            layout_config = {
              width = 0.6,
              height = 14,
            },
            border = {},
            borderchars = { "", "", "", "", "", "", "", "" },
          },
          help_tags = {
            layout_strategy = 'horizontal',
            layout_config = {
              height = 0.9,
              width = 0.9,
              prompt_position = 'top',
              scroll_speed = 2,
              preview_width = 0.6,
            },
          },
          man_pages = {
            layout_strategy = 'vertical',
            layout_config = {
              height = 0.8,
              prompt_position = 'top',
              preview_height = 0.8,
              mirror = true,
              scroll_speed = 2,
            },
          },
          lsp_references = {
            initial_mode = 'normal',
            theme = 'ivy',
            layout_config = {
              bottom_pane = { height = 12 },
              preview_width = 0.4,
            },
            border = {},
            borderchars = { "", "", "", "", "", "", "", "" },
          },
          diagnostics = {
            initial_mode = 'normal',
            theme = 'ivy',
            previewer = false,
            layout_config = {
              bottom_pane = { height = 12 },
            },
            border = {},
            borderchars = { "", "", "", "", "", "", "", "" },
          },
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = sorters.get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = sorters.get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 10,
          border = {},
          borderchars = { "", "", "", "", "", "", "", "" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = previewers.vim_buffer_cat.new,
          grep_previewer = previewers.vim_buffer_vimgrep.new,
          qflist_previewer = previewers.vim_buffer_qflist.new,
          buffer_previewer_maker = previewers.buffer_previewer_maker,
          -- dynamic_preview_title = true,
          mappings = {
            i = {
              ['<C-j>'] = 'preview_scrolling_down',
              ['<C-k>'] = 'preview_scrolling_up',
              ['<C-q>'] = action.close,
              ['<M-p>'] = action_layout.toggle_preview,
              ['<C-u>'] = false,
              ['<C-d>'] = action.delete_buffer + action.move_to_top,
            },
            n = {
              q = action.close,
              ['<C-j>'] = 'preview_scrolling_down',
              ['<C-k>'] = 'preview_scrolling_up',
              ['<C-q>'] = action.close,
              ['<M-p>'] = action_layout.toggle_preview,
              ['<C-d>'] = action.delete_buffer + action.move_to_top,
            },
          },
        },
        extensions_list = { "todo-comments", "notify" },
      }
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "<c-n>", "v" },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function()
      require('core.mappings').setup()
      return {
        plugins = { spelling = { enabled = true } },
        key_labels = {
          ['<space>'] = 'Space',
          ['<cr>'] = 'Enter',
          ['<CR>'] = 'Enter',
          ['<tab>'] = 'TAB',
          ['<c-w>'] = 'Ctrl + w',
          ['<C-S>'] = 'Ctrl + s',
          ['<C-L>'] = 'Ctrl + l',
          ['<C-Bslash>'] = 'Ctrl + \\',
          ['<C-P>'] = 'Ctrl + p',
          ['<C-H>'] = 'Ctrl + h',
          ['<C-l>'] = 'Ctrl + l',
        },
        popup_mappings = { scroll_down = '<c-j>', scroll_up = '<c-k>' },
        window = { winblend = 10 },
        layout = {
          height = { min = 5, max = 30 },
          width = { min = 20, max = 90 },
          spacing = 14,
          align = 'center',
        },
        hidden = {
          '<Plug>',
          'require',
          'execute v:count .',
          '<silent>',
          ':',
          '<Cmd>',
          '<CR>',
          'call',
          'lua',
          '^:',
          '^ ',
          '("nvim-treesitter.textsubjects")',
        },
      }
    end
  },
  { 'ggandor/lightspeed.nvim', event = { "BufReadPost", "BufNewFile" } },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n" },
      { "gc",  mode = "v" },
      { "gbc", mode = "n" },
      { "gb",  mode = "v" },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
  {
    'uga-rosa/ccc.nvim',
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      return {
        highlighter = {
          auto_enable = true,
          excludes = { 'neo-tree' }
        },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "gitsigns.nvim" } }
            end)
          end
        end,
      })
    end,
    opts = function()
      return {
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "lukas-reineke/cmp-under-comparator"
      },
    },
    opts = function()
      local cmp = require "cmp"
      return {
        completion = {
          completeopt = "menu,menuone",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        experimental = {
          ghost_text = {
            hl_group = 'Comment',
          },
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ':TSUpdate',
    opts = function()
      return {
        ensure_installed = { 'go', 'lua', },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = true },
        rainbow = {
          enable = true,
          disable = { 'jsx', 'cpp' },
          query = 'rainbow-parens',
          strategy = require('ts-rainbow').strategy.global,
        },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
          }
        },
        textobjects = {
          enable = true,
          lsp_interop = {
            enable = true,
          },
          keymaps = {
            ["iL"] = {
              go = "(function_definition) @function",
            },
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["aC"] = "@class.outer",
            ["iC"] = "@class.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["ae"] = "@block.outer",
            ["ie"] = "@block.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["is"] = "@statement.inner",
            ["as"] = "@statement.outer",
            ["ad"] = "@comment.outer",
            ["am"] = "@call.outer",
            ["im"] = "@call.inner"
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer"
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer"
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer"
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer"
            }
          },
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["iF"] = {
                python = "(function_definition) @function",
                go = "(method_declaration) @function"
              }
            }
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner"
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner"
            }
          }
        }
      }
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      'windwp/nvim-ts-autotag'
    }
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = "ToggleTerm",
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return vim.o.lines * 0.4
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      winbar = {
        enabled = true,
      },
      float_opts = {
        border = 'rounded',
        width = function(term) return math.floor(vim.o.columns * 0.6) end,
        height = function(term) return math.floor(vim.o.lines * 0.5) end,
      },
    }
  }
}
