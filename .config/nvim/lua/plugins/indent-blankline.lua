require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    indent_blankline_show_current_context = true,
    indent_blankline_context_patterns = {'class', 'function', '^if', '^do', '^while', '^for', '^switch', '^case'},
    indent_blankline_buftype_exclude = {'terminal'},
    indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree'},
    indent_blankline_char = '▏',
    indent_blankline_use_treesitter = true,
    indent_blankline_show_trailing_blankline_indent = false,
}
apply_options(options)

