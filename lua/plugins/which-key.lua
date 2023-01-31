local open_diff_view = function()
  vim.ui.input({ prompt = 'Diff working tree with branch (leave blank for development): ' }, function(branch_name)
    require('diffview').open(string.len(branch_name) == 0 and 'development' or branch_name)
  end)
end

return {
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require('which-key')

      wk.register({
        -- buffers/windows
        w = { ':w<CR>', 'Save Buffer' },
        W = { ':W<CR>', 'Save All Buffers' },
        q = { ':q<CR>', 'Quit Window' },

        -- neo-tree
        e = { '<Cmd>Neotree toggle<CR>', 'Open Neo-tree' },
        E = { '<Cmd>Neotree focus<CR>', 'Focus Neo-tree' },

        -- diffview
        g = {
          name = '+Git Diffview',
          g = { '<Cmd>DiffviewOpen<CR>', 'Open Diffview' },
          G = { open_diff_view, 'Enter branch' },
          c = { '<Cmd>DiffviewClose<CR>', 'Close Diffview' },
          f = { '<Cmd>DiffviewFileHistory %<CR>', 'File history' },
        },
      }, { prefix = '<leader>' })
    end,
  },
}
