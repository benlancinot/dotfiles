return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            log_level = vim.log.levels.INFO, -- :ConformInfo to show log info
            formatters_by_ft = {
                -- https://github.com/mvdan/gofumpt
                -- https://pkg.go.dev/golang.org/x/tools/cmd/goimports (auto imports)
                go = { "gofumpt", "goimports" },
                -- https://github.com/threedaymonk/htmlbeautifier
                jq = { "jq" },
                -- https://github.com/rhysd/fixjson
                json = { "fixjson" },
                -- https://github.com/executablebooks/mdformat
                markdown = { "mdformat" },
                -- https://github.com/rust-lang/rustfmt
                terraform = { "terraform_fmt" }
            },
            -- NOTE: The gofumpt formatter isn't working properly.
            -- So although I have the below configured, I rely on an autocmd instead.
            -- See ../autocommands.lua
            -- It's also worth noting that I have gofumpt configured by gopls.
            -- So I'm not sure if that affects conform.nvim at all.
            -- See ./lsp.lua
            formatters = {
                gofumpt = {
                    command = "gofumpt",
                    args = { "$FILENAME" },
                    stdin = false, -- https://github.com/stevearc/conform.nvim/issues/387
                }
            },
            format_after_save = function(bufnr)
                -- disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 5000, lsp_format = "fallback" }
            end
        })

        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })

        vim.keymap.set("n", "<leader>fi", "<Cmd>ConformInfo<CR>", { desc = "Show Conform log" })

        -- DISABLED: in favour of format_on_save.
        --
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   group = vim.api.nvim_create_augroup("Formatting", { clear = true }),
        --   pattern = "*",
        --   callback = function(args)
        --     require("conform").format({ bufnr = args.buf })
        --   end
        -- })
    end,
}
