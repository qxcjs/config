local ok, telescope = pcall(require, "telescope")
if not ok then
    vim.notify("没有找到 telescope")
    return
end

telescope.setup({
    defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = "insert",
        -- 窗口内快捷键
        mappings = require("keymaps").telescopeList,
        layout_strategy = 'horizontal',
        layout_config = {
            -- width = 0.9, 
            preview_width = 0.6
        }

    },
    pickers = {
        -- 内置 pickers 配置
        find_files = {
            -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
            -- theme = "dropdown",
        }
    },
    extensions = {
        -- 扩展插件配置
    }
})

require('aerial').setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
    end,
    layout = {default_direction = "prefer_right"}
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
