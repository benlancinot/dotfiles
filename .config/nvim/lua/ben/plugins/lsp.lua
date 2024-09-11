local languages = {
    "bashls",
    "gopls",
    "jsonls",
    "clangd",
    "cssls",
    "lua_ls",
    "pylsp",
    "terraformls",
    "tflint",
    "yamlls",
    "html",
    "pyright",
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show hover information" })
        vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations,
            { buffer = ev.buf, desc = "Go to implementation" })
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references,
            { buffer = ev.buf, desc = "Show references" })
        vim.keymap.set("n", "ca", vim.lsp.buf.code_action,
            { buffer = ev.buf, desc = "Show code actions", noremap = true, silent = true })
    end,
})

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for _, language in pairs(languages) do
                require("lspconfig")[language].setup({
                    capabilities = capabilities,
                })
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = "nvim-lspconfig",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = languages,
        },
    },
    {
        -- LSP DIAGNOSTICS
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        keys = {
            {
                "<leader>xa",
                "<Cmd>Trouble diagnostics focus=true<CR>",
                desc = "Open diagnostics for all buffers in Trouble",
                mode = "n",
                noremap = true,
                silent = true
            },
            {
                "<leader>xx",
                "<Cmd>Trouble diagnostics focus=true filter.buf=0<CR>",
                desc = "Open diagnostics for current buffer in Trouble",
                mode = "n",
                noremap = true,
                silent = true
            },
            {
                "<leader>xl",
                "<Cmd>Trouble lsp_references focus=true<CR>",
                desc = "Open any references to this symbol in Trouble",
                mode = "n",
                noremap = true,
                silent = true
            },
        },
        opts = {
            use_diagnostic_signs = true,
        },
    }
}
