return {
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = "cd app && yarn install",
        init = function()
            local g = vim.g
            g.mkdp_auto_start = 0
            g.mkdp_auto_close = 1
            g.mkdp_refresh_slow = 0
            g.mkdp_command_for_global = 0
            g.mkdp_open_to_the_world = 0
            g.mkdp_open_ip = ''
            g.mkdp_browser = 'firefox'
            g.mkdp_echo_preview_url = 0
            g.mkdp_browserfunc = ''
            g.mkdp_theme = 'dark'
            g.mkdp_filetypes = { "markdown" }
            g.mkdp_page_title = "${name}.md"
            g.mkdp_preview_options = {
                disable_sync_scroll = 0,
                disable_filename = 1
            }
        end,
    },
    {
        'ChuufMaster/markdown-toc',
        opts = {

            -- The heading level to match (i.e the number of "#"s to match to) max 6
            heading_level_to_match = -1,

            -- Set to True display a dropdown to allow you to select the heading level
            ask_for_heading_level = false,

            -- TOC default string
            -- WARN
            toc_format = '%s- [%s](<%s#%s>)',
        }
    },
}
