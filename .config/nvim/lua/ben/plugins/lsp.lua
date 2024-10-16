return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "hrsh7th/cmp-nvim-lsp", -- for autocompletion
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local util = require("lspconfig.util")
            local lspui = require("lspconfig.ui.windows")
            local mason_tool_installer = require("mason-tool-installer")

            lspui.default_options.border = "rounded"

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

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

            local servers = {
                bashls = {},                -- Bash
                clangd = {},                -- C/C++
                marksman = {},              -- Markdown lsp
                sqlls = {},                 -- SQL
                eslint = {},                -- React/NextJS/Svelte
                emmet_language_server = {}, -- HTML
                ts_ls = {},                 -- Javascript, TypeScript
                html = {},                  -- HTML
                cssls = {},                 -- CSS
                pyright = {},               -- Python
                gopls = {                   -- Golang
                    cmd = { "gopls" },
                    filetypes = { "go", "gomod", "gowork", "gotmpl" },
                    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                    settings = {
                        gopls = {
                            completeUnimported = true,
                            usePlaceholders = false,
                            codelenses = {
                                gc_details = true,
                                generate = true,
                                tidy = true,
                                upgrade_dependency = true,
                                regenerate_cgo = false,
                                test = true,
                                vendor = false,
                            },
                            analyses = {
                                unusedparams = true,
                                unreachable = true,
                                appends = false,
                                asmdecl = false,
                                atomic = true,
                                defers = true,
                                deprecated = true,
                                errorsas = true,
                                httpresponse = true,
                                fillreturns = true,
                                ifaceassert = true,
                                infertypeargs = true,
                                nilness = true,
                                nilfunc = true,
                                shadow = true,
                                structtag = true,
                                undeclaredname = true,
                                useany = false,
                            },
                            -- report vulnerabilities
                            vulncheck = "Imports",
                            staticcheck = true,
                            gofumpt = true,
                        },
                    },
                },
                lua_ls = {}, -- Lua
            }

            local border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            }

            mason.setup({
                ui = {
                    border = "rounded",
                    width = 0.8,
                    height = 0.8,
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                -- FORMATTERS
                { "gofumpt" },   -- GO
                { "goimports" }, -- GO
                { "black" },     -- Python
                { "isort" },     -- Python
                { "prettierd" }, -- JS and Many More
                { "prettier" },  -- JS and Many More
                { "shfmt" },     -- Shell Script
                { "stylua" },    -- Lua

                -- LINTERS
                { "codespell" },
                { "pylint" },
                { "shellcheck" },
            })

            mason_tool_installer.setup({
                ensure_installed = ensure_installed,
                auto_update = false,
                run_on_start = true,
                start_delay = 3000, -- 3 second delay
            })

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            mason_lspconfig.setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        lspconfig[server_name].setup(server)
                    end,
                },
            })
        end,
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
