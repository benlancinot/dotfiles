return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    main = "ibl",
    config = function()
        vim.opt.list = true

        require("ibl").setup {
            exclude = {
                filetypes = { "help", "alpha", "lazy", "dashboard", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
                buftypes = { "terminal", "nofile", "telescope", "prompt", "quickfix" },
            },
        }
    end,
}
