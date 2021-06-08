require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    -- vista_echo_cursor_strategy = "floating_win",
    -- -- vista_icon_indent = ["╰─▸ ", "├─▸ "],
    -- vista_default_executive = "nvim_lsp",
}
apply_options(options)


vim.cmd([[
"let g:vista_echo_cursor_strategy = 'floating_win'
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'nvim_lsp'
"let g:vista#renderer#enable_icon = 1
"let g:vista#renderer#icons = {
"\   "function": "\uf794",
"\   "variable": "\uf71b",
"\  }
]])
