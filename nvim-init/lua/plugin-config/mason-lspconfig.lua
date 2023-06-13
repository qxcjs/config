-- https://github.com/williamboman/mason.nvim/discussions/57
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason_lspconfig")
    return
end

-- "luacheck", "luaformatter", "taplo", "black", "flake8"
mason_lspconfig.setup({
    ensure_installed = {
        -- "lua-language-server", "pyright", "taplo", "css-lsp", "html-lsp", "json-lsp", "typescript-language-server"
        "lua_ls", "pyright", "taplo", "cssls", "html", "jsonls", "tsserver", "ruff_lsp"
    }
})
