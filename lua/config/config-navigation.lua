-- Tabs
vim.keymap.set('n', '<Tab>', ':tabnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-w><C-[>', ':tabmove -1<CR>')
vim.keymap.set('n', '<C-w><C-]>', ':tabmove +1<CR>')
vim.keymap.set('n', 't', ':tabnew<CR>')
vim.keymap.set('n', 'T', ':-1tabnew<CR>')

-- Window
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>wk', '20<C-W>+')
vim.keymap.set('n', '<leader>wj', '20<C-W>-')
vim.keymap.set('n', '<leader>wh', '20<C-W>>')
vim.keymap.set('n', '<leader>wl', '20<C-W><')

-- Files by name
--vim.keymap.set('n', '<leader>oo', ':exec("tag ".expand("<cword>"))<CR>')
vim.keymap.set('n', '<leader>o\\', ':tab split<CR>:exec("tag ".expand("<cword>"))<CR>')
vim.keymap.set('n', '<leader>o}', ':split<CR>:exec("tag ".expand("<cword>"))<CR>')
vim.keymap.set('n', '<leader>o[', ':vsplit<CR>:exec("tag ".expand("<cword>"))<CR>')
vim.keymap.set('n', '<leader>o]', ':vsplit<CR><C-w>l:exec("tag ".expand("<cword>"))<CR>')
--vim.keymap.set('n', '<leader>ot', ':topleft :vsplit<CR>:exec("tag ".expand("<cword>")."Test")<CR>')
