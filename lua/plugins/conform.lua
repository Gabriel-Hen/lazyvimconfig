return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer" },
    },
    formatters = {
      php_cs_fixer = {
        command = "php-cs-fixer",
        args = function(_, ctx)
          local cwd = vim.fn.getcwd()
          local config_paths = {
            cwd .. "/.php-cs-fixer.php",
            cwd .. "/src/.php-cs-fixer.php",
          }

          local config = nil
          for _, path in ipairs(config_paths) do
            if vim.fn.filereadable(path) == 1 then
              config = path
              break
            end
          end

          local args = { "fix", ctx.filename, "--using-cache=no" }
          if config then
            table.insert(args, "--config=" .. config)
          end

          return args
        end,
        stdin = false,
        cwd = require("conform.util").root_file({ ".php-cs-fixer.php", "composer.json", ".git" }),
      },
    },
  },
}

