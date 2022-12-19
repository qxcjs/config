local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("没有找到 cmp")
    return
end

local _, lspkind = pcall(require, "lspkind")
if not _ then
    vim.notify("没有找到 lspkind")
    return
end


cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    -- 补全源
    sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "vsnip" } },
        { { name = "buffer" } }, { { name = "path" } },
        { { name = 'nvim_lsp_signature_help' } }),

    -- 快捷键设置
    mapping = require("keymaps").cmp(cmp),

    -- 设置补全显示的格式
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        }),
    },
})

-- 命令模式下输入 "/" 启用补全
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'nvim_lsp_document_symbol' } },
        { { name = 'buffer' } })
})

-- 命令模式下输入 ":" 启用补全 使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } })
})
