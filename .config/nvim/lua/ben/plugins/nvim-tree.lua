local git_icons = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = "",
    ignored = "◌",
}

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<C-n>", ":NvimTreeFindFileToggle<CR>", desc = "NvimTree" },
    },
    config = function()
        require("nvim-tree").setup({
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_netrw = true,

            -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
            sync_root_with_cwd = true,
            --false by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree
            respect_buf_cwd = false,
            -- show lsp diagnostics in the signcolumn
            diagnostics = {
                enable = false,
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                highlight_opened_files = "none",
                root_folder_label = ":~",
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                        modified = true,
                    },
                    glyphs = {
                        git = git_icons,
                    },
                },
            },
            -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
            update_focused_file = {
                -- enables the feature
                enable = true,
                -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                -- only relevant when `update_focused_file.enable` is true
                update_root = true,
                -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
                -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
                ignore_list = {},
            },
            -- configuration options for the system open command (`s` in the tree by default)
            filters = {
                dotfiles = false,
                custom = {},
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false,
                },
                open_file = {
                    quit_on_open = true,
                    -- if true the tree will resize itself after opening a file
                    resize_window = false,
                    window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
            view = {
                -- width of the window, can be either a number (columns) or a string in `%`
                width = 40,
                -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
                side = "left",
                number = false,
                relativenumber = false,
            },
        })
    end,
}
