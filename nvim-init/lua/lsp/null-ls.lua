local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("没有找到 null-ls")
    return
end

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

-- https://alpha2phi.medium.com/neovim-for-beginners-lsp-using-null-ls-nvim-bd954bf86b40
null_ls.setup {
    debug = true,
    log_level = "warn",
    -- debounce = 150,
    save_after_format = false,
    sources = {
        -- Formatting
        formatting.shfmt, -- for shell
        formatting.lua_format.with({extra_args = {"--column-limit=128"}}), -- for lua
        -- formatting.stylua.with({extra_args = {"--column-width=150"}}), -- for lua
        -- formatting.flake8,
        formatting.taplo, -- for .toml
        formatting.prettier.with({ -- 只比默认配置少了 markdown
            filetypes = {
                "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json",
                "yaml", "graphql"
            },
            prefer_local = "node_modules/.bin"
        }), -- formatting.fixjson,
        formatting.black.with({extra_args = {"--fast"}}), -- for python
        formatting.sql_formatter.with({extra_args = {"--language", "mysql"}}), -- for sql
        diagnostics.luacheck.with({extra_args = {"--ignore", "vim", "--max-line-length", "128"}}) -- for lua
        -- diagnostics.ruff
        -- completion.vsnip
    }
    -- 保存自动格式化
    -- on_attach = function(client)
    --     if client.server_capabilities.documentFormattingProvider then
    --         vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
    --     end
    -- end
}
