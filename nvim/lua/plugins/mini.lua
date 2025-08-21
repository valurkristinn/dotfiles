return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.pairs').setup()
        require('mini.git').setup()
        require('mini.diff').setup()
        require('mini.statusline').setup()
        require('mini.surround').setup()
        require('mini.jump2d').setup()
        require('mini.icons').setup()
        require('mini.move').setup()
        require('mini.comment').setup()
   end
}
