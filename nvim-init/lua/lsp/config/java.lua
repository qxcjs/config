print "start to load jdtls"
local status, jdtls = pcall(require, "jdtls")
if not status then
    vim.notify("没有找到 jdtls")
    return
end

local config = {
    cmd = {
        "java", "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g",
        "--add-modules=ALL-SYSTEM", "--add-opens",
        "java.base/java.util=ALL-UNNAMED", "--add-opens",
        "java.base/java.lang=ALL-UNNAMED", "-jar",
        "/home/liss/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration",
        "/home/liss/.local/share/nvim/mason/packages/jdtls/config_linux",
        "-data",
        "/home/liss/.local/share/nvim/mason/packages/jdtls/workspace/folder"
    },
    root_dir = jdtls.setup.find_root({".git", "mvnw", "gradlew"}),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk-amd64/"
                    }
                }
            }
        }
    },
    on_attach = function(client, bufnr)
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
    end,
    flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 500
    },
    init_options = {bundles = {}}
}
-- require'lspconfig'.jdtls.setup {config}
jdtls.start_or_attach(config)
print "load jdtls"

-- vim.cmd('autocmd BufWritePre,BufRead *.java jdtls.start_or_attach(config)')
