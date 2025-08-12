-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 4

return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  {
    'jake-stewart/multicursor.nvim',
    config = function()
      -- Customize how cursors look.
      local mc = require 'multicursor-nvim'
      local set = vim.keymap.set

      mc.setup()

      -- Add or skip adding a new cursor by matching word/selection
      set({ 'n', 'x' }, '<M-j>', function()
        mc.matchAddCursor(1)
      end)
      set({ 'n', 'x' }, '<M-k>', function()
        mc.matchAddCursor(-1)
      end)

      -- Add and remove cursors with control + left click.
      set('n', '<c-leftmouse>', mc.handleMouse, { desc = 'Add to multicursor' })
      set('n', '<c-leftdrag>', mc.handleMouseDrag, { desc = 'Drag for multicursor' })
      set('n', '<c-leftrelease>', mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ 'n', 'x' }, '<c-q>', mc.toggleCursor, { desc = 'Toggle cursors' })

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Enable and clear cursors using escape.
        layerSet('n', '<esc>', function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
      local hl = vim.api.nvim_set_hl
      hl(0, 'MultiCursorCursor', { reverse = true })
      hl(0, 'MultiCursorVisual', { link = 'Visual' })
      hl(0, 'MultiCursorSign', { link = 'SignColumn' })
      hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
      hl(0, 'MultiCursorDisabledCursor', { reverse = true })
      hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
      hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
    end,
  },
}
