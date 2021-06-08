require('opts')
apply_options = function(opts)
    for k, v in pairs(opts) do vim.g[k] = v end
end

local options = {
    sonokai_style                     = "shusia",
    sonokai_enable_italic             = 1,
    sonokai_cursor                    = "red",
    sonokai_transparent_background    = 0,
    sonokai_menu_selection_background = "red",
    sonokai_sign_column_background    = "none",
    sonokai_diagnostic_text_highlight = 1,
    sonokai_current_word              = "underline",
    sonokai_better_performance        = 1
}
apply_options(options)
