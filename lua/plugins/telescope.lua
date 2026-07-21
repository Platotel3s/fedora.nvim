return{
  {
    'nvim-telescope/telescope.nvim', version = '*',
    opts={
      defaults = {
        layout_strategy = "horizontal", -- vertical
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.80,
          },
          width = 0.95,
          height = 0.95,
        },
        sorting_strategy = "ascending",
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },

}
