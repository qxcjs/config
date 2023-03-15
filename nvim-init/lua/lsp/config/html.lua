local status, lsp_config = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- 绑定快捷键
    require('keymaps').mapLSP(buf_set_keymap)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

lsp_config['html'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
