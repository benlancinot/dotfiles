return {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            flavour = "frappe",
            term_colors = true,
            integrations = {
                alpha = true,
                mason = true,
                cmp = true,
                native_lsp = { enabled = true },
                dropbar = {
                    enabled = true,
                    color_mode = true,
                },
                lsp_trouble = true,
                nvim_surround = true,
                notify = true,
                nvimtree = true,
                telescope = {
                    enabled = true,
                },
                illuminate = {
                    enabled = true,
                    lsp = true,
                },
                treesitter = true,
                treesitter_context = true,
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
