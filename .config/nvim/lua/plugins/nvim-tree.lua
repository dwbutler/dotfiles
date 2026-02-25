return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      git = {
        enable = true,
      },
    })
    
    -- Toggle nvim-tree with <leader>e
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })
  end,
}


