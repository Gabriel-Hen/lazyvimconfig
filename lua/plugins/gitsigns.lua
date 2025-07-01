return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Ativa o blame inline
      current_line_blame_opts = {
        virt_text = true, -- Exibe como texto virtual
        virt_text_pos = "eol", -- Posição do texto virtual: 'eol' (fim da linha) ou 'right_align'
        delay = 1000, -- Atraso em milissegundos antes de exibir o blame
        ignore_whitespace = false, -- Ignora mudanças apenas em espaços em branco
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>", -- Formato da mensagem de blame
    },
  },
}
