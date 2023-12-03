return function()
  -- Fix ft detection for hyprland
  vim.filetype.add({
    pattern = { ['.*/hypr/.*%.conf'] = 'hypr' },
  })
  require('nvim-treesitter.parsers').get_parser_configs().hypr = {
    install_info = {
      url = 'https://github.com/luckasRanarison/tree-sitter-hypr',
      files = { 'src/parser.c' },
      branch = 'master',
    },
    filetype = 'hypr',
  }
end
