return {
  'olexsmir/gopher.nvim',
  ft = "go",
  -- branch = "develop", -- if you want develop branch
  -- keep in mind, it might break everything
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  ---@type gopher.Config
  opts = {},
}
