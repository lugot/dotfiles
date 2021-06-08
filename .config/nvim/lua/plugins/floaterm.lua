require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    floaterm_wintype = 'split',
    floaterm_width   = 0.8,
    floaterm_height  = 0.4,
    floaterm_position = 'center',
    floaterm_borderchars = '─│─│╭╮╯╰ ',
    floaterm_rootmarkers = {
        '.project',
        '.git',
        '.hg',
        '.svn',
        '.root',
        '.compile_commands.json'
        },
    floaterm_keymap_prev   = '<M-n>',
    floaterm_keymap_next   = '<M-m>',
    floaterm_keymap_toggle = '<M-p>'
}
apply_options(options)

vim.api.nvim_exec('autocmd FileType floaterm setlocal nonumber', false)
