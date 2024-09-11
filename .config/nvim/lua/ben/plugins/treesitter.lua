return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cmake",
                    "css",
                    "dockerfile",
                    "go",
                    "git_config",
                    "git_rebase",
                    "gitcommit",
                    "gitignore",
                    "gomod",
                    "gowork",
                    "html",
                    "http",
                    "javascript",
                    "json",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "printf",
                    "python",
                    "regex",
                    "terraform",
                    "vim",
                    "yaml",
                    "xml",
                    "sql",
                },
                sync_install = true,
                highlight = {
                    enable = true,
                    use_languagetree = true,
                    additional_vim_regex_highlighting = { "markdown" },
                },
                auto_install = true,
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil
                }
            })
        end
    },
    {
        -- HIGHLIGHT ARGUMENTS' DEFINITIONS AND USAGES, USING TREESITTER
        "m-demare/hlargs.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = true
    }
}
