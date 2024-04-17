return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = false },
  config = function ()
    require('lualine').setup()
  end
}
