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

-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    -- 补全源
    sources = cmp.config.sources({{name = "nvim_lsp"}}, {{name = "vsnip"}}, {{name = "buffer", keyword_length = 3}},
                                 {{name = "path"}}, {{name = 'nvim_lsp_signature_help'}}),

    -- 快捷键设置
    mapping = require("keymaps").cmp(cmp),

    -- 设置补全显示的格式
    formatting = {
        -- format = lspkind.cmp_format({
        --     with_text = true,
        --     maxwidth = 50,
        --     before = function(entry, vim_item)
        --         -- source 显示来源
        --         vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        --         return vim_item
        --     end
        -- })
        -- 指定显示顺序 菜单, kind, 类型
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, vim_item)
            local menu_icon = {nvim_lsp = 'λ', luasnip = '⋗', buffer = 'Ω', path = '🖫'}

            vim_item.menu = menu_icon[entry.source.name]

            vim_item.dup = ({vsnip = 0})[entry.source.name] or 0
            return vim_item
        end
    }
})

-- 命令模式下输入 "/" 启用补全
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'nvim_lsp_document_symbol'}}, {{name = 'buffer'}})
})

-- 命令模式下输入 ":" 启用补全 使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- The following example advertise capabilities to `pyright`.
-- require'lspconfig'.pyright.setup {capabilities = capabilities}
