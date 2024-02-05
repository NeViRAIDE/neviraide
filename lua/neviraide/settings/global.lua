local g = vim.g
local N = NEVIRAIDE()

g.ntc = vim.fn.stdpath('data') .. '/neviraide_ui/'
g.nt = N.theme
g.t = N.transparency
g.b = N.border
g.n = N.nonicons
g.lp = N.latest_plugins
g.l_fbs = N.lsp.format_before_save
g.l_d_s = N.lsp.diagnostic.signs
g.l_d_vt = N.lsp.diagnostic.virtual_text
g.l_d_soh = N.lsp.diagnostic.show_on_hover
g.l_cl = N.lsp.code_lenses

for _, provider in ipairs({ 'node', 'perl', 'python3', 'ruby' }) do
  g['loaded_' .. provider .. '_provider'] = 0
end
