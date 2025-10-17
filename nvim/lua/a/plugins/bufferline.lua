return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            separator = true,
          },
        },
      },
      highlights = {
        fill = {
          bg = "#282828",
        },
      },
    })
  end,
}
