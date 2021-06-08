require('opts')
local apply_options = function(opts)
    for k, v in pairs(opts) do
        vim.opt[k] = v
    end
end

local options = {
    -- general: history, no backup or swapfiles
    history       = 500,
    hidden        = true,
    autowrite     = true,
    autoread      = true,
    backup        = false,
    writebackup   = false,
    swapfile      = false,
    backupcopy    = "yes",
    undolevels    = 1000,
    wrapscan      = true,
    showcmd       = true,
    title 	  = true,

    -- encoding: utf-8
    encoding      = "UTF-8",
    termencoding  = "UTF-8",
    fileencoding  = "UTF-8",
    fileformats   = {"unix", "dos", "mac"},

    -- text formatting
    wrap          = false,
    textwidth     = 0,
    startofline   = false,
    colorcolumn   = 80, -- 80 chars color column
    -- colorcolumn = vim.wo.colorcolumn .. '+' .. 1

    -- scrolling: nowrap and scrolloff
    scrolloff     = 5,
    sidescrolloff = 0,
    sidescroll    = 2,

    -- movement: go to next line when end of this
    backspace      = { "eol", "start", "indent" },
    whichwrap      = { "<", ">", "[", "]" },

    -- indentation: 4 spaces,
    shiftwidth    = 4,
    tabstop       = 4,
    softtabstop   = 4,
    autoindent    = true,
    cursorline    = true,
    expandtab     = true,
    smarttab      = true,
    smartindent   = true,
    showmode      = false,
    linebreak     = true,

    -- searching
    showmatch     = true,
    ignorecase    = true,
    smartcase     = true,
    hlsearch      = true,
    incsearch     = true,
    magic         = true,
    matchtime     = 2,
    joinspaces    = false,

    -- ui: cmdline, no TeX conceal, lazy when macros, errorbells
    termguicolors = true,
    laststatus    = 2,
    showtabline   = 2,
    wildmenu      = true,
    langmenu      = "en",
    ruler         = true,
    number        = true,
    cmdheight     = 1,
    signcolumn    = "yes",
    mouse         = "a",
    -- tex_conceal   = "",
    lazyredraw    = true,
    errorbells    = false,
    visualbell    = false,
    t_vb          = "",
    tm            = 500,

    -- competion
    completeopt    = { "menu", "menuone", "noselect", "noinsert" },
    inccommand     = "split",
    list           = false,
    -- listchars      = { tab = '▸', trai = '·', precedes = '←', extends = '→', eol = '↲', nbsp ='␣' },
    pumheight      = 20,
    shortmess      = vim.o.shortmess .. "Sc",
    re             = 0,
    timeoutlen     = 400,
    updatetime     = 100,

    -- splits: prefer below and right
    splitbelow     = true,
    splitright     = true,
    fillchars     = { vert = "│", eob = " " }, -- make vertical split sign better
    -- fillchars      = vim.o.fillchars .. 'vert: '

    -- folding
    foldmethod     = "indent",
    -- foldexpr       = "nvim_treesitter#foldexpr()",
    foldlevel      = 1,
    foldnestmax    = 2,
    foldenable     = false,
    -- foldopen    = {"percent", "search"}, -- don't open fold if I don't tell it to do so
    -- foldcolumn  = "auto", -- enable fold column for better visualisation

    -- clipboard
    clipboard      = "unnamedplus",

    -- python
    -- python3_host_prog = "/bin/python3",
}

apply_options(options)

-- vim.o.fillchars = vim.o.fillchars .. 'vert: '

vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, {last_pos, 0})
  end
end

vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
