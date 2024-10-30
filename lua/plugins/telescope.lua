return {
  {
    'nvim-telescope/telescope.nvim', -- Ensure that telescope is installed
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required dependency for telescope
      'nvim-telescope/telescope-media-files.nvim', -- Add the media files extension
    },
    cmd = 'Telescope', -- Optionally, you can define when to load Telescope
    config = function()
      local telescope = require 'telescope'

      telescope.setup {
        defaults = {
          -- Set default previewer (Telescope handles this)
          previewer = true,
        },
        extensions = {
          media_files = {
            -- Configure the media files extension
            filetypes = { 'png', 'jpg', 'jpeg', 'mp4', 'webm', 'pdf' },
            find_cmd = 'rg', -- The command to find files (default is "fd")
          },
        },
      }

      -- Load the media_files extension
      telescope.load_extension 'media_files'
    end,
  },
}
