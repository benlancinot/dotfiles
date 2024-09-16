return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local alpha = require("alpha")
        local theta = require("alpha.themes.theta")
        local dashboard = require("alpha.themes.dashboard")


        theta.header.val = {
            [[]],
            [[]],
            [[  ／|_       ]],
            [[ (o o /      ]],
            [[  |.   ~.    ]],
            [[  じしf_,)ノ ]],
        }

        -- theta.header.val = {
        --     "                                                     ",
        --     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        --     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        --     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        --     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        --     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        --     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        --     "                                                     ",
        -- }

        theta.buttons.val = {
            { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },

            dashboard.button("n", "  New file", ":ene <bar> startinsert <cr>"),
            dashboard.button("SPC ff", "  Find file"),
            dashboard.button("!", "  go-verse",
                ":lua require('telescope.builtin').find_files({cwd = '/home/ben/dev/go/src/github.com/gustvision/go-verse' })<CR>"),
            dashboard.button("<", "  iac-verse-core",
                ":lua require('telescope.builtin').find_files({cwd = '/home/ben/dev/infra/iac-verse-core' })<CR>"),
            dashboard.button("u", "  Sync plugins", ":Lazy sync<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }

        alpha.setup(theta.config)
    end
};
