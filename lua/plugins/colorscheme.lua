--[[return {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { 
        style = "storm",
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
}
]]


return {
  { "arcticicestudio/nord-vim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
