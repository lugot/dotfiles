require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    rnvimr_enable_ex     = 1,
    rnvimr_enable_picker = 1,

    -- rnvimr_layout = {
    --     relative = 'editor',
        -- width    = vim.api.nvim_eval('float2nr(round(0.8 * &columns))'),
        -- height   = vim.api.nvim_eval('float2nr(round(0.8 * &lines))'),
        -- width    = 0.8,
        -- height   = 0.8,
        -- style    = 'minimal'
    -- }
}
apply_options(options)

-- vim.cmd:Lua([[
-- let rnvimr_layout = { 'relative': 'editor', 'width': float2nr(round(0.8 * &columns)), 'height': float2nr(round(0.8 * &lines)), 'style': 'minimal', }
-- ]])
--
--
vim.cmd([[
let g:rnvimr_presets = [{'width': 0.800, 'height': 0.800},]
]])
