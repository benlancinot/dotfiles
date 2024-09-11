return {
    "akinsho/bufferline.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' },
    config = function()
        local bufferline = require("bufferline")
        local catppuccin = require("catppuccin.palettes").get_palette()
        local background = catppuccin.base
        local active_bg = catppuccin.crust
        local inactive_bg = catppuccin.mantle

        bufferline.setup({
            options = {
                numbers = "none",
                always_show_bufferline = true,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(_, _, diag)
                    local ret = (diag.error and " " .. diag.error .. " " or "")
                        .. (diag.warning and " " .. diag.warning or "")
                    return vim.trim(ret)
                end,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "📚 File Explorer: ",
                        text_align = "left",
                        separator = true
                    }
                },
            },
        })
    end,
}
