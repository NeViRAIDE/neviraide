local g = vim.g
local N = NEVIRAIDE()

---@type BorderType
g.b = 'rounded'
g.ntc = vim.fn.stdpath('data') .. '/neviraide_ui/'
g.nt = N.ui.theme
g.n = N.ui.nonicons
g.lp = N.latest_stable_plugins
g.l_fbs = N.lsp.format_before_save
g.l_d_s = N.lsp.diagnostic.enable_d_signs
g.l_d_vt = N.lsp.diagnostic.virtual_text
g.l_d_soh = N.lsp.diagnostic.show_on_hover
g.l_cl = N.lsp.code_lenses
g.g_gs = N.git.gitsigns.enable_g_signs
g.g_eclb = N.git.gitsigns.enable_current_line_blame
g.timer = false
g.lang = N.language
g.hyde = N.ui.hyde
g.notif = N.ui.notify
g.asrln = N.ui.line_numbers.auto_switch_relative

for _, provider in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  g['loaded_' .. provider .. '_provider'] = 0
end
