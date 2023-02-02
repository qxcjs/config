--[[
    python format failed, [LSP] Format request failed, no matching language servers.
    Not every LSP supports formating and, if you want to use any linter or formatter through the LSP interface you need something like null-ls
--]] --
local status, lsp_config = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
--
-- https://github.com/microsoft/pyright/blob/main/docs/settings.md
local pyright_settings = {
    settings = {
        python = {
            extraPaths = {"__pypackages__/3.10/lib/"},
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = false,
                typeCheckingMode = "off",
                -- 不知道为什么不生效
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = "none",
                    reportUndefinedVariable = "none",
                    reportUnusedExpression = "none",
                    reportMissingTypeStubs = "none",
                    reportMissingImports = "none"
                }
            }
        }
    }
}

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end
    -- 绑定快捷键
    require('keymaps').mapLSP(buf_set_keymap)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}

local root_files = {'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json'}

lsp_config['pyright'].setup {
    -- cmd = {'pyright'},
    settings = pyright_settings,
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = require('lspconfig.util').root_pattern(unpack(root_files))
}
