return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      git = {
        enable = false,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        }
      }
    })
  end,
}
