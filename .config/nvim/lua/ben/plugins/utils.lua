return {
    {
        -- WORD USAGE HIGHLIGHTER
        "RRethy/vim-illuminate"
    },
    {
        -- MODIFY SURROUNDING CHARACTERS
        "kylechui/nvim-surround",
        config = true
    },
    {
        -- DISPLAY HEX COLOURS
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end -- WARNING: Don't replace with `opts = {}` or `config = true` as it doesn't work
    },
    {
        -- GENERATE HEX COLOURS
        -- :CccPick
        "uga-rosa/ccc.nvim",
        config = true
    },
    {
        -- ASYNC DISPATCH
        "tpope/vim-dispatch"
    },
    {
        'Bekaboo/dropbar.nvim',
        -- optional, but required for fuzzy finder support
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim'
        }
    },
}
