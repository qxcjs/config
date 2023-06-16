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

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local kind_icons = {
    Class = "ﴯ",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = "",
    Method = "",
    Module = "",
    Operator = "",
    Property = "ﰠ",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = ""
}

-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()},
    -- 补全源
    -- 为什么要用 {} 分组 ? 不分组 snip 出不来
    -- sources = cmp.config.sources({
    --     {name = "nvim_lsp", max_item_count = 10, priority_weight = 100},
    --     {name = "vsnip", pmax_item_count = 10, riority_weight = 120, keyword_length = 2}
    -- }, {{name = "buffer", keyword_length = 3}, {name = "path"}, {name = 'nvim_lsp_signature_help'}}),
    --  :h  cmp-config.sources
    sources = cmp.config.sources {
        {name = 'nvim_lsp', group_index = 1, max_item_count = 15}, {name = "vsnip", group_index = 1},
        {name = "buffer", group_index = 2}, {name = "path", group_index = 3}
    },

    -- 快捷键设置
    mapping = require("keymaps").cmp(cmp),
    -- matching = {
    --     -- fr 也能搜索出 for
    --     disallow_fuzzy_matching = false
    -- },
    -- completion = {keyword_length = 3},

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
        -- fields = {'menu', 'abbr', 'kind'},
        -- format = function(entry, vim_item)
        --     local menu_icon = {vsnip = 'v', nvim_lsp = 'λ', luasnip = '⋗', buffer = 'Ω', path = '🖫'}
        --
        --     vim_item.menu = menu_icon[entry.source.name]
        --
        --     vim_item.dup = ({vsnip = 0})[entry.source.name] or 0
        --     return vim_item
        -- end,
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- Concatonate the icons with name of the item-kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                spell = "[Spellings]",
                zsh = "[Zsh]",
                buffer = "[Buffer]",
                vsnip = "[Snip]",
                treesitter = "[Treesitter]",
                calc = "[Calculator]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                nvim_lsp_signature_help = "[Signature]",
                cmdline = "[Vim Command]"
            })[entry.source.name]
            return vim_item
        end
    }
})

-- 命令模式下输入 "/" 启用补全
cmp.setup.cmdline("/", {
    -- 绑定快捷键
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
-- require('lspconfig')['pyright'].setup {capabilities = capabilities}
