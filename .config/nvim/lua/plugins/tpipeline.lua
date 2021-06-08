require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    tpipeline_split = 1,
}
apply_options(options)
