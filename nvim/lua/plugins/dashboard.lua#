return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  priority = 999,
  config = function()
    require('dashboard').setup {
        theme = 'hyper',
    config = {
        header = {''},  
        shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
      },
      footer = {},
    },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
