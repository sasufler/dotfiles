return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 20,
        open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl-\
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        direction = 'float', -- Set default direction (other options: "horizontal", "vertical", "tab")
        close_on_exit = true,
        shell = vim.o.shell, -- Use the shell set in Neovim
      }
    end,
  },
}
