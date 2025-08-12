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

return {}
