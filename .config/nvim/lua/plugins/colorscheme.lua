return {
  'lifepillar/vim-solarized8',  -- A modern, maintained Solarized colorscheme
  lazy = false,  -- Load at startup
  priority = 1000,  -- Load before other plugins
  config = function()
    -- Set Solarized Dark
    vim.o.background = 'dark'
    vim.cmd([[colorscheme solarized8]])
    
    -- Custom highlights for better visibility
    vim.cmd([[
      " Set line numbers to be more visible
      highlight LineNr guifg=#839496 ctermfg=245
      
      " Make the cursor line more subtle
      highlight CursorLine cterm=NONE ctermbg=235 guibg=#002b36
      
      " Make the cursor line number stand out
      highlight CursorLineNr guifg=#93a1a1 ctermfg=247
      
      " Make the sign column match the background
      highlight SignColumn guibg=NONE ctermbg=NONE

      " Make terminal background match editor
      highlight TermNormal guibg=#002b36
      highlight TermCursorNC guibg=#073642
    ]])
  end,
}
