-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
require'lspconfig'.pyright.setup {
    settings = {
        -- python stub config
        -- https://github.com/LunarVim/LunarVim/issues/2565
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                -- stubPath = "$HOME/Documents/typings"
                stubPath = "/mnt/f/GitWorkspace/typeshed/stubs"
            }
        }
    }
}
