if vim.fn.has("termguicolors") == 1 then
  vim.o.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.o.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.o.termguicolors = true
end

require('plugins.sonokai')
vim.cmd 'color monokai'

-- highlights
local highlight = function(group, options)
    local bg     = options.bg == nil and "" or "guibg=" .. options.bg
    local fg     = options.fg == nil and "" or "guifg=" .. options.fg
    local gui    = options.gui == nil and "" or "gui=" .. options.gui
    local guisp  = options.guisp == nil and "" or "guisp=" .. options.guisp
    local link   = options.link or false
    local target = options.target

    if not link then
        vim.cmd(string.format("hi %s %s %s %s %s", group, bg, fg, gui, guisp))
    else
        vim.cmd(string.format("hi! link %s %s", group, target))
    end
end


-- filer
highlight("RnvimrNormal", { link = true, target = "CursorLine"})
-- terminal
highlight("FloatermBorder", { bg = "#F2A2E"})
-- compe
highlight("CompeDocumentation", { link = true, target = "NormalFloat" })
-- indentline
highlight("IndentBlanklineContextChar", { guifg="#00FF00", gui="nocombine" })
highlight("IndentBlanklineChar", { guifg="#00FF00", gui="nocombine" })

