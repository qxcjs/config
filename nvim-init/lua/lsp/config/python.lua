-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- 禁用格式化功能，交给专门插件插件处理
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- 绑定快捷键
    require('keymaps').mapLSP(buf_set_keymap)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}
require('lspconfig')['pyright'].setup {on_attach = on_attach, flags = lsp_flags}

--[[ require'lspconfig'.pyright.setup {
    settings = {
        -- python stub config
        -- https://github.com/LunarVim/LunarVim/issues/2565
        python = {
            pythonPath = "python3",
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                -- stubPath = "$HOME/Documents/typings"
                -- stubPath = "/mnt/f/GitWorkspace/typeshed/stubs"
                stubPath = ""
            }
        }
    }
} ]]
