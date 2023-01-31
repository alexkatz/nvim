return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'lua', 'rust', 'typescript', 'help', 'vim' },
        auto_install = true,

        highlight = { enable = true },
        playground = { enable = true },
        indent = { enable = true, disable = { 'python' } },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-v>',
            node_incremental = '<C-v>',
            node_decremental = '<M-v>',
          },
        },

        rainbow = {
          enable = true,
          extended_mode = false,
          colors = {
            'Gold',
            'Orchid',
            'DodgerBlue',
          },
          disable = { 'html' },
        },
        -- TODO: stuff from tj's kickstarter
        -- textobjects = {
        --   select = {
        --     enable = true,
        --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        --     keymaps = {
        --       -- You can use the capture groups defined in textobjects.scm
        --       ['aa'] = '@parameter.outer',
        --       ['ia'] = '@parameter.inner',
        --       ['af'] = '@function.outer',
        --       ['if'] = '@function.inner',
        --       ['ac'] = '@class.outer',
        --       ['ic'] = '@class.inner',
        --     },
        --   },
        --   move = {
        --     enable = true,
        --     set_jumps = true, -- whether to set jumps in the jumplist
        --     goto_next_start = {
        --       [']m'] = '@function.outer',
        --       [']]'] = '@class.outer',
        --     },
        --     goto_next_end = {
        --       [']M'] = '@function.outer',
        --       [']['] = '@class.outer',
        --     },
        --     goto_previous_start = {
        --       ['[m'] = '@function.outer',
        --       ['[['] = '@class.outer',
        --     },
        --     goto_previous_end = {
        --       ['[M'] = '@function.outer',
        --       ['[]'] = '@class.outer',
        --     },
        --   },
        -- swap = {
        --   enable = true,
        --   swap_next = {
        --     ['<leader>a'] = '@parameter.inner',
        --   },
        --   swap_previous = {
        --     ['<leader>A'] = '@parameter.inner',
        --   },
        -- },
        -- },
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'zsh',
        callback = function()
          -- let treesitter use bash highlight for zsh files as well
          require('nvim-treesitter.highlight').attach(0, 'bash')
        end,
      })
    end,
  },

  -- {
  --   -- Additional text objects via treesitter
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   dependencies = 'nvim-treesitter',
  -- },

  -- rainbow braces, brackets
  'p00f/nvim-ts-rainbow',

  {
    'nvim-treesitter/playground',
    event = 'BufRead',
  },
}
