return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      -- Where to store sessions
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      -- Save/restore automatically when you enter/leave a project dir
      auto_session_enable_last_session = false, -- set true if you always want the last session
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      -- Don't save when in certain dirs (optional)
      -- auto_session_suppress_dirs = { "~/" },
    })
    
    -- Simple keymaps
    vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession save<CR>", { desc = "Session Save" })
    vim.keymap.set("n", "<leader>sr", "<cmd>AutoSession restore<CR>", { desc = "Session Restore" })
    vim.keymap.set("n", "<leader>sd", "<cmd>AutoSession delete<CR>", { desc = "Session Delete" })
    vim.keymap.set("n", "<leader>sl", "<cmd>AutoSession search<CR>", { desc = "Session Search" })
  end,
}
