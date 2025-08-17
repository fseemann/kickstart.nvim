local set = vim.keymap.set

set('n', '<C-d>', '<C-d>zz', { desc = 'Go half page down and center' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Go half page up and center' })

set('n', '<C-j>', '<M-}>', { desc = 'Go to previous fold' })
set('n', '<C-k>', '<M-{>', { desc = 'Go to next fold' })

set('n', '<F2>', function()
  vim.diagnostic.jump { count = 1, float = true }
end)
set('n', '<S-F2>', function()
  vim.diagnostic.jump { count = -1, float = true }
end)

set('n', '<leader>e', ':Oil<CR>', { desc = 'Explorer using Oil' })
set('n', '<leader>tt', ':terminal<CR>i', { desc = 'Open a terminal' })
set('n', '<leader>ts', ':vsplit<CR> :terminal<CR>i', { desc = 'Open a terminal in a vertical split' })

set('n', '<C-M-k>', ':m -2<CR>==', { desc = 'Move up' })
set('n', '<C-M-j>', ':m +1<CR>==', { desc = 'Move down' })
set('v', '<C-M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move down' })
set('v', '<C-M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move up' })
return {}
