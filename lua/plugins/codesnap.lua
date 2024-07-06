-- TODO: codesnap keybindings via whichkey
return {
  'mistricky/codesnap.nvim',
  build = 'make build_generator',
  cmd = {
    'CodeSnap',
    'CodeSnapSave',
    'CodeSnapHighlight',
    'CodeSnapSaveHighlight',
  },
  opts = {
    mac_window_bar = false,
    save_path = '~/Pictures/CodeScreenshots',
    has_breadcrumbs = true,
    -- watermark = 'NEVIRAIDE SANPSHOT',
    watermark = 'RAprogramm',
    -- watermark = 'RAPROGRAMM',
    code_font_family = 'JetBrainsMono Nerd Font',
    -- watermark_font_family = 'Pacifico',
    watermark_font_family = 'Anurati',
    -- bg_theme = 'bamboo',
    breadcrumbs_separator = '/',
    has_line_number = true,
    -- bg_color = '#535c68',
  },
}
