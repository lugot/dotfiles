require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    --smoothie_speed_constant_factor = 20,
    smoothie_speed_linear_factor = 13,
    smoothie_speed_exponentiation_factor = 0.9,
}
apply_options(options)
