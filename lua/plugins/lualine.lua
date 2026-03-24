return{
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local custom_codedark = require('lualine.themes.codedark')
      custom_codedark.normal.a.bg = '#569cd6'
      custom_codedark.normal.a.fg = '#ffffff'
      custom_codedark.normal.b.bg = '#2c2f33'
      custom_codedark.normal.c.bg = '#1e1e1e'
      custom_codedark.insert.a.bg = '#6a9955'
      custom_codedark.insert.a.fg = '#FFFFFF'
      custom_codedark.visual.a.bg = '#dcdcaa'
      custom_codedark.visual.a.fg = '#000000'
      custom_codedark.replace.a.bg = '#f44747'
      custom_codedark.replace.a.fg = '#ffffff'

      require("lualine").setup {
        options = {
          theme = custom_codedark,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          refresh = {
            statusline = 100,
          },
          disabled_filetypes = {
            statusline = { 'alpha', 'dashboard' },
          },
        },
        sections = {
          lualine_a = {
            { 'mode', icon = '', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = {
            { 'branch', icon = '' },
            { 'diff', symbols = { added = ' ', modified = '柳 ', removed = ' ' } },
            { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
          },
          lualine_c = {
            { 'filename', path = 1, symbols = { modified = ' ', readonly = ' ' } },
          },
          lualine_x = {
            {
              "overseer",
              label = '',
              symbols = {
                running = ' ',
                success = ' ',
                failed = ' ',
              },
            },
            { 'encoding', icon = '' },
            { 'fileformat', icon = '' },
            { 'filetype', icon = '' },
          },
          lualine_y = {
            { 'progress', icon = '' },
          },
          lualine_z = {
            { 'location', icon = '', separator = { right = '' } },
            {
              'datetime',
              style = '%H:%M',
              icon = '',
              separator = { right = '' },
              color = { fg = '#161617', bg = '#86e1fc', bold = true },
             },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              -- 'tabs'
              'buffers',
              mode = 2,
              max_length = vim.o.columns,
              tabs_color = {
                active = 'lualine_a_normal',
                inactive = 'lualine_c_normal',
              },
              symbols = {
                modified = '●',
              },
            }
          },
          lualine_z = {
            {
              'hostname',
              icon = '󰖟',
            }
          },
        },
        extensions = {
          'nvim-tree',
          'fugitive',
          'quickfix',
          'nvim-dap-ui',
        },
      }
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*',
        callback = function()
          vim.cmd('redrawstatus')
        end,
      })
    end,
  },
}
