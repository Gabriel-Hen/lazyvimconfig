return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {}, -- Remove padrões de exclusão padrão, se necessário
      },
      pickers = {
        find_files = {
          hidden = true, -- Inclui arquivos ocultos
          no_ignore = true, -- Inclui arquivos ignorados pelo .gitignore
        },
        live_grep = {
          additional_args = { "--hidden", "--no-ignore" }, -- Inclui arquivos ocultos e ignorados no grep
        },
      },
    },
  },
}
