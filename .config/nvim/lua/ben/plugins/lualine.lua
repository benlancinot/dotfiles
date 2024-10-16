return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    config = function()
        require('lualine').setup {
            options = {
                theme = "catppuccin",
                section_separators = { "|", "|" },
                component_separators = { "", "" },
                icons_enabled = true,
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
                lualine_b = {},
                lualine_c = { 'branch', 'diff' },

                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = {
                "nvim-tree",
                "quickfix",
                "mason",
            },
        }
    end
}
