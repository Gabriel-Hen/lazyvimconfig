local dap = require("dap") -- adaptador usando a extensão php-debug (vscode-php-debug)
dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
    -- host = "127.0.0.1",
}
dap.configurations.php = {
    {
        name = "Listen for XDebug Custom",
        type = "php",
        request = "launch",
        -- porta que o Xdebug “empurra” o evento de debug
        port = 9000,
        -- hostname = "127.0.0.1",
        -- log = true,
        -- em geral 127.0.0.1 já funciona, mas se você configurou outro host:
        -- mapeamento de caminhos: container → host (WSL)
        pathMappings = {
            -- caminho dentro do container
            ["/var/www/html"] = "/var/www/html/condominios/src",
            ["/integracao-integra-contador"] = "/var/www/html/integracao-integra-contador",
            -- ou use o caminho absoluto: "/home/usuario/projeto/src"
        },
        xdebugSettings = {
            max_data = -1,
            max_depth = 10,
        },
    },
}
