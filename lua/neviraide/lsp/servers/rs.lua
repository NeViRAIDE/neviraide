local M = {}

M.capabilities = {
  experimental = {
    serverStatusNotification = true,
  },
  general = {
    positionEncodings = { 'utf-16' },
  },
  textDocument = {
    codeAction = {
      codeActionLiteralSupport = {
        codeActionKind = {
          valueSet = {
            '',
            'quickfix',
            'refactor',
            'refactor.extract',
            'refactor.inline',
            'refactor.rewrite',
            'source',
            'source.organizeImports',
          },
        },
      },
      dynamicRegistration = true,
      isPreferredSupport = true,
      resolveSupport = {
        properties = { 'edit' },
      },
    },
    completion = {
      completionItem = {
        commitCharactersSupport = false,
        deprecatedSupport = false,
        documentationFormat = { 'markdown', 'plaintext' },
        preselectSupport = false,
        snippetSupport = true,
      },
      completionItemKind = {
        valueSet = {
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
          11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
          21, 22, 23, 24, 25,
        },
      },
      contextSupport = true,
      dynamicRegistration = false,
    },
    formatting = {
      dynamicRegistration = true,
      extraArgs = { "+nightly" },
    },
    hover = {
      contentFormat = { 'markdown', 'plaintext' },
      dynamicRegistration = true,
    },
    rename = {
      dynamicRegistration = true,
      prepareSupport = true,
    },
  },
}

M.settings = {
  ['rust-analyzer'] = {
    imports = {
      granularity = { group = 'module' },
      prefix = 'crate',
    },
    cargo = {
      allFeatures = true,
      loadOutDirsFromCheck = true,
      runBuildScripts = true,
    },
    -- checkOnSave = {
    --   command = 'clippy',
    --   extraArgs = { '--no-deps' },
    -- },
    procMacro = { enable = true },
    rustfmt = {
      extraArgs = { '+nightly' },
    },
  },
}

return M
