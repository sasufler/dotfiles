return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers', -- Display buffers in the line
          numbers = 'none', -- No numbering on buffers
          diagnostics = 'nvim_lsp', -- Enable LSP diagnostics on buffer tabs
          separator_style = 'slant', -- Style of the separators between buffers
          always_show_bufferline = true, -- Always show the bufferline
          show_buffer_close_icons = true,
          show_close_icon = false,
          enforce_regular_tabs = false,
          offsets = {
            {
              filetype = 'NvimTree', -- Offset for NvimTree so it integrates with bufferline
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'center',
            },
          },
        },
      }

      -- Keybindings for navigating buffers
      vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    end,
  },
}
