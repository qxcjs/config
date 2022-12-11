require'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {pycodestyle = {ignore = {'W391'}, maxLineLength = 128}}
        }
    },
    on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- 禁用格式化功能，交给专门插件插件处理
        -- client.resolved_capabilities.document_formatting = false
        -- client.resolved_capabilities.document_range_formatting = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- 绑定快捷键
        require('keymaps').mapLSP(buf_set_keymap)
    end,
    flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 500
    }
}
