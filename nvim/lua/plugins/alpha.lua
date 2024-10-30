return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'catppuccin/nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function getLen(str, start_pos)
        local byte = string.byte(str, start_pos)
        if not byte then
          return nil
        end
        return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
      end

      local function colorize(header, header_color_map, colors)
        for letter, color in pairs(colors) do
          local color_name = 'AlphaJemuelKwelKwelWalangTatay' .. letter
          vim.api.nvim_set_hl(0, color_name, color)
          colors[letter] = color_name
        end

        local colorized = {}

        for i, line in ipairs(header_color_map) do
          local colorized_line = {}
          local pos = 0

          for j = 1, #line do
            local start = pos
            pos = pos + getLen(header[i], start + 1)

            local color_name = colors[line:sub(j, j)]
            if color_name then
              table.insert(colorized_line, { color_name, start, pos })
            end
          end

          table.insert(colorized, colorized_line)
        end

        return colorized
      end

      local alpha_c = function()
        local alpha = require 'alpha'
        local mocha = require('catppuccin.palettes').get_palette 'mocha'
        local dashboard = require 'alpha.themes.dashboard'

        local color_map = {
          [[      AAAA]],
          [[AAAAAA  AAAA]],
          [[AA    AAAA  AAAA        KKHHKKHHHH]],
          [[AAAA    AAAA  AA    HHBBKKKKKKKKKKKKKK]],
          [[  AAAAAA      AAKKBBHHKKBBYYBBKKKKHHKKKKKK]],
          [[      AAAA  BBAAKKHHBBBBKKKKBBYYBBHHHHKKKKKK]],
          [[        BBAABBKKYYYYHHKKYYYYKKKKBBBBBBZZZZZZ]],
          [[    YYBBYYBBKKYYYYYYYYYYKKKKBBKKAAAAZZOOZZZZ]],
          [[    XXXXYYYYBBYYYYYYYYBBBBBBKKKKBBBBAAAAZZZZ]],
          [[    XXXXUUUUYYYYBBYYYYYYBBKKBBZZOOAAZZOOAAAAAA]],
          [[  ZZZZZZXXUUXXXXYYYYYYYYBBAAAAZZOOOOAAOOZZZZAAAA]],
          [[  ZZUUZZXXUUUUXXXXUUXXFFFFFFFFAAAAOOZZAAZZZZ  AA]],
          [[    RRRRUUUUZZZZZZZZXXOOFFFFOOZZOOAAAAAAZZZZAA]],
          [[    CCSSUUUUZZXXXXZZXXOOFFFFOOZZOOOOZZOOAAAA]],
          [[    CCCCUUUUUUUUUURRRROOFFFFOOZZOOOOZZOOZZZZ]],
          [[    CCCCUUUUUUUUSSCCCCEEQQQQOOZZOOOOZZOOZZZZ]],
          [[    CCCCUUGGUUUUCCCCCCEEQQQQOOZZOOOOZZEEZZ]],
          [[    RRRRGGGGUUGGCCCCCCOOOOOOOOZZOOEEZZII]],
          [[      IIRRGGGGGGCCCCCCOOOOOOOOZZEEII]],
          [[            GGRRCCCCCCOOOOEEEEII  II]],
          [[                RRRRRREEEE  IIII]],
          [[                      II]],
          [[]],
        }

        local yellow = '#FAC87C'
        local orange = '#BF854E'
        local maroon = '#502E2B'
        local brown = '#38291B'
        local colors = {
          ['A'] = { fg = mocha.rosewater },
          ['Y'] = { fg = yellow },
          ['B'] = { fg = '#D8B800' }, -- Darken manually or choose an appropriate color
          ['X'] = { fg = '#B3A300' },
          ['U'] = { fg = '#A49D00' },
          ['F'] = { fg = '#8F7C00' },
          ['O'] = { fg = '#7D6A00' },
          ['K'] = { fg = maroon },
          ['H'] = { fg = '#5E4B4D' }, -- Darken manually
          ['Z'] = { fg = mocha.crust },
          ['G'] = { fg = '#A89D00' }, -- Darken manually
          ['R'] = { fg = orange },
          ['Q'] = { fg = '#A26E4D' }, -- Darken manually
          ['E'] = { fg = '#8B5C4D' }, -- Darken manually
          ['I'] = { fg = brown },
          ['C'] = { fg = mocha.mantle },
          ['S'] = { fg = mocha.subtext1 },
        }

        local header = {}
        for _, line in ipairs(color_map) do
          local header_line = [[]]
          for i = 1, #line do
            if line:sub(i, i) ~= ' ' then
              header_line = header_line .. '█'
            else
              header_line = header_line .. ' '
            end
          end
          table.insert(header, header_line)
        end

        local header_add = [[          N        E      O    B   E E         ]]
        table.insert(header, header_add)

        local hl_add = {}
        for i = 1, #header_add do
          table.insert(hl_add, { 'NeoBeeTitle', 1, i })
        end

        dashboard.section.header.val = header
        local colorized = colorize(header, color_map, colors)

        table.insert(colorized, hl_add)

        dashboard.section.header.opts = {
          hl = colorized,
          position = 'center',
        }

        dashboard.section.buttons.val = {
          dashboard.button('SPC e e', '  New file', '<Cmd>ene <CR>'),
          dashboard.button('SPC f f', '  Find file'),
          dashboard.button('SPC s s', '  NeoBee config', '<Cmd>Neotree reveal ~/.config/nvim<CR>'),
          dashboard.button('SPC q q', '  Quit', '<Cmd>qa<CR>'),
        }
        for _, a in ipairs(dashboard.section.buttons.val) do
          a.opts.width = 49
          a.opts.cursor = -2
        end

        alpha.setup(dashboard.config)
      end

      alpha_c() -- Call the alpha_c function to setup
    end,
  },
}
