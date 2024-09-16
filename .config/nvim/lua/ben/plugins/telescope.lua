return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-file-browser.nvim",
        "echasnovski/mini.icons",
    },

    keys = {
        { "f?", "<cmd>Telescope<CR>",                           desc = "Telescope menu" },
        {
            "fs",
            function()
                local telescope = require("telescope")

                local function telescope_buffer_dir()
                    return vim.fn.expand("%:p:h")
                end

                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                })
            end,
            desc = "Open File Browser with the path of the current buffer",
        },
        { "ff", "<cmd>Telescope find_files<CR>",                desc = "Find files" },
        { "fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in buffer" },
        { "fh", "<cmd>Telescope help_tags<CR>",                 desc = "Find help tags" },
        { "fo", "<cmd>Telescope oldfiles<CR>",                  desc = "Find old files" },
        { "fg", "<cmd>Telescope live_grep<CR>",                 desc = "Live grep" },
        { "ft", "<cmd>Telescope treesiter<CR>",                 desc = "Explore treesitter" },
        { "fb", "<cmd>Telescope buffers<CR>",                   desc = "Find opened buffers" },
    },
    config = function(_, opts)
        local telescope = require("telescope")

        opts.pickers = {
            find_files = { theme = "ivy" },
            live_grep = { theme = "ivy" },
            oldfiles = { theme = "ivy" },
            current_buffer_fuzzy_find = { theme = "ivy" },
            treesiter = { theme = "ivy" },
            buffers = { theme = "ivy" },
        }
        opts.extensions = {
            file_browser = {
                hijack_netrw = true,
                theme = "ivy",
            },
        }

        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
}
