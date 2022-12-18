local status, lspconfig = pcall(require, "lspconfig")
if not status then
    vim.notify("没有找到 lspconfig")
    return
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
table.insert(runtime_path, 'lua/vim/lsp/?/?.lua')
table.insert(runtime_path, '/usr/share/nvim/runtime/lua/vim/')

local log = require('vim.lsp.log')
-- local a = vim.lsp.buf.definition

local library_path = vim.api.nvim_get_runtime_file('', true)
table.insert(library_path, '/usr/share/nvim/runtime/lua/vim')

local opts = {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                -- library = vim.api.dfvim_get_runtime_file('', true),
                library = library_path,
                checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false }
        }
    },
    flags = { debounce_text_changes = 150 },
    -- cmd = { sumneko_lua_binapp, '-E', sumneko_lua_binpath..'main.lua', '--locale=zh-cn' },
    on_attach = function(client, bufnr)
        print(client.resolved_capabilities.document_formatting)
        -- print(#client.resolved_capabilities)
        -- 禁用格式化功能，交给专门插件插件处理
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- print(type(bufnr))
        -- 关于 table 中明明有内容但是长度为0的问题, https://developer.aliyun.com/article/11393
        -- print(#client)
        -- print(client.resolved_capabilities.document_formatting)
        for index, data in pairs(library_path) do
            log.info(index, ", ", data)
            -- for key, value in pairs(data) do print('\t', key, value) end
        end

        -- for index, data in pairs(client) do
        --     log.info(index, ", ", data)
        --     -- for key, value in pairs(data) do print('\t', key, value) end
        -- end

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- 绑定快捷键
        require('keymaps').mapLSP(buf_set_keymap)
        -- 保存时自动格式化
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()')
    end
}

lspconfig.sumneko_lua.setup(opts)
