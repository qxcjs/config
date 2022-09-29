local cmp = require("cmp")

cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    -- 补全源
    sources = cmp.config.sources({{name = "nvim_lsp"}}, {{name = "vsnip"}},
                                 {{name = "buffer"}}, {{name = "path"}},
                                 {{name = 'nvim_lsp_signature_help'}}),

    -- 快捷键设置
    mapping = require("keymaps").cmp(cmp)
})

-- 命令模式下输入 "/" 启用补全
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'nvim_lsp_document_symbol'}},
                                 {{name = 'buffer'}})
})

-- : 命令模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
})
