return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "echasnovski/mini.icons",
    },

    keys = {
        { "f?", "<cmd>Telescope<CR>",                           desc = "Telescope menu" },
        { "ff", "<cmd>Telescope find_files<CR>",                desc = "Find files" },
        { "fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in buffer" },
        { "fh", "<cmd>Telescope help_tags<CR>",                 desc = "Find help tags" },
        { "fo", "<cmd>Telescope oldfiles<CR>",                  desc = "Find old files" },
        { "fg", "<cmd>Telescope live_grep<CR>",                 desc = "Live grep" },
        { "ft", "<cmd>Telescope treesiter<CR>",                 desc = "Explore treesitter" },
        { "fb", "<cmd>Telescope buffers<CR>",                   desc = "Find opened buffers" },
    },
    config = function()
        local ivy = require("telescope.themes").get_ivy
        local telescope = require("telescope")

        telescope.setup({
            defaults = ivy(),
        })
    end,
}
