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
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup {
        theme = "light", -- define para tema claro
        bold_keywords = true,
        italic_comments = true,
      }
      vim.cmd.colorscheme("nordic")
    end,
  },
}
