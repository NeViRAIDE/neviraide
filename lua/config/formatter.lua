require("formatter").setup {
  logging = false,
  filetype = {
    typescript = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.api.nvim_buf_get_name(0),
            "--single-quote",
            "--semi false",
            "--trailing-comma none"
          },
          stdin = true
        }
      end
    },
    vue = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.api.nvim_buf_get_name(0),
            "--single-quote",
            "--semi false",
            "--trailing-comma none"
          },
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.api.nvim_buf_get_name(0),
            "--single-quote true",
            "--semi false",
            "--trailing-comma none"
          },
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = "luafmt",
          args = {
            "--stdin",
            "--indent-count",
            2
          },
          stdin = true
        }
      end
    }
    -- python = {},
  }
}

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html FormatWrite
augroup END
]],
  true
)
