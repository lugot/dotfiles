local map = vim.api.nvim_set_keymap

-- map('n', '<F3>', ':set number! relativenumber!<CR>', {noremap = true, silent = false})
-- map('n', '<F4>', ':set list! list?<CR>', {noremap = false, silent = false})
map('n', '<M-i>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
map('n', '<M-l>', ':Vista<CR>', {noremap = false, silent = true})
map('n', '<F9>', ':VenterToggle<CR>', {noremap = false, silent = false})
map('n', '<leader>nm', ':Dispatch npm start<CR>', {noremap = false, silent = false})
-- Buffers
map('n', '<leader>bda', ':BufferCloseAllButCurrent<CR>', {noremap = false, silent = false})
map('n', '<leader>bn', ':bnext<CR>', {noremap = false, silent = false})
map('n', '<leader>bp', ':bprevious<CR>', {noremap = false, silent = false})
-- Fugitive
map('n', '<leader>gf', ':20G<CR>', {noremap = false, silent = false})
-- Ctrlsf
map('n', '<C-F>f', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})
map('v', '<C-F>f', '<Plug>CtrlSFVwordExec', {noremap = false, silent = false})
map('n', '<C-F>n', '<Plug>CtrlSFCwordExec', {noremap = false, silent = false})
map('n', '<C-F>t', ':CtrlSFToggle<CR>', {noremap = true, silent = false})
-- Easy-align
-- map('x', 'ea', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- map('n', 'ea', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- Vim-sneak
map('n', 'f', '<Plug>Sneak_f', {noremap = false, silent = false})
map('n', 'F', '<Plug>Sneak_F', {noremap = false, silent = false})
map('n', 't', '<Plug>Sneak_t', {noremap = false, silent = false})
map('n', 'T', '<Plug>Sneak_T', {noremap = false, silent = false})
-- LSP
map('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
map('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
map('n', 'ga', ':lua vim.lsp.diagnostic.code_action()<CR>', {noremap = true, silent = true})
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
map('n', 'gy', ':lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})
map('n', 'gf', ':lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
map('n', 'gr', ':lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
map('n', '<leader>lrfr', ':lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
map('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})
-- Spectre
map('n', '<leader>S', ":lua require('spectre').open()<CR>", {noremap = true, silent = false})
map('v', '<leader>S', ":lua require('spectre').open_visual()<CR>", {noremap = true, silent = false})
map('n', '<leader>Sw', "viw:lua require('spectre').open_visual()<CR>", {noremap = true, silent = false})
map('n', '<leader>sp', "viw:lua require('spectre').open_file_search()<CR>", {noremap = true, silent = false})
-- Lazygit
map('n', '<leader>gg', ':LazyGit<CR>', {noremap = false, silent = false})
-- Telescope
map('n', '<leader>r', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
map('n', '<leader>bb', ":lua require('telescoperbuiltin').buffers()<CR>", {noremap = true, silent = true})
map('n', '<leader>m', ":lua require('telescope.builtin').marks()<CR>", {noremap = true, silent = true})
map('n', '<leader>t', ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true})
map('n', '<leader>f', ":lua require('plugins.telescope').project_files()<CR>", {noremap = true, silent = true})
map('n', '<leader>p', ":lua require('telescope').extensions.project.project{}<CR>", {noremap = true, silent = true})
map('n', '<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>", {noremap = true, silent = true})
map('n', '<leader>g', ":lua require('plugins.telescope').my_git_status()<CR>", {noremap = true, silent = true})
map('n', '<leader>b', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {noremap = true, silent = true})
map('n', '<leader>n', ":lua require('plugins.telescope').my_note()<CR>", {noremap = true, silent = true})
map('n', '<leader>nn', ":e ~/Note/", {noremap = true, silent = false})
map('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
map('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})
-- HlsLens
map('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
map('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
map('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- Fterm
-- map('n', '<F5>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- map('t', '<F5>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
-- Rnvimr
map('n', '<M-o>', ':RnvimrToggle<CR>', { noremap = true, silent = true })
map('t', '<M-o>', '<C-\\><C-n>:RnvimrToggle<CR>', { noremap = true, silent = true })
-- Clipboard
map('', '"*y', 'y', {})
map('', '"*p', 'p', {})
map('', '"*x', 'x', {})
-- Shut up
map('n', '<F1>', ':echo<CR>', {noremap = true})
map('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
-- Splits
map('n', '<C-Up>',    '<C-W><Up>', {noremap = true, silent = true})
map('n', '<C-Down>',  '<C-W><Down>', {noremap = true, silent = true})
map('n', '<C-Left>',  '<C-W><Left>', {noremap = true, silent = true})
map('n', '<C-Right>', '<C-W><Right>', {noremap = true, silent = true})
map('t', '<C-Up>',    '<C-W><Up>', {noremap = true, silent = true})
map('t', '<C-Down>',  '<C-W><Down>', {noremap = true, silent = true})
map('t', '<C-Left>',  '<C-W><Left>', {noremap = true, silent = true})
map('t', '<C-Right>', '<C-W><Right>', {noremap = true, silent = true})
