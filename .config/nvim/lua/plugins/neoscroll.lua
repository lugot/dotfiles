require('neoscroll').setup({
    mappings = {},
    hide_cursor = false,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = true,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true  -- The cursor will keep on scrolling even if the window cannot scroll further
})

-- local config = require('neoscroll.config')
-- local t = config.key_to_function
-- -- Syntax: t[keys] = {function, {function arguments}}
-- t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '8'}}
-- t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '8'}}
-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '7'}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '7'}}
-- t['<C-y>'] = {'scroll', {'-0.10', 'false', '20'}}
-- t['<C-e>'] = {'scroll', { '0.10', 'false', '20'}}
-- t['zt']    = {'zt', {'7'}}
-- t['zz']    = {'zz', {'7'}}
-- t['zb']    = {'zb', {'7'}}

-- config.set_mappings()
