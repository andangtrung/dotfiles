return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        -- width = 35,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
