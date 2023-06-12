require("project_nvim").setup {patterns = {".git", ".svn", "package.json", ".pyproject.tomal"}}

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    vim.notify("没有找到 nvim-tree")
    return
end

-- 列表操作快捷键
local list_keys = require('keymaps').nvimTreeList

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  -- list_keys
end

nvim_tree.setup({

    on_attach = my_on_attach,
    -- root_dirs = {".git"},
    -- 不显示 git 状态图标
    git = {enable = false},
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {enable = true, update_cwd = true, update_root = true},
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        -- 不显示隐藏文件
        dotfiles = true,
        -- 不显示 .git 目录中的内容
        custom = {'.git', 'node_modules', "**/logs", "**/__pycache__", "__pypackages__"},
        -- 显示 .gitignore
        exclude = {".gitignore"}
    },
    view = {
        -- 宽度
        width = 36,
        -- 位置, 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        -- mappings = {custom_only = false, list = list_keys},
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes'
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false
        }
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'wsl-open' -- mac 直接设置为 open
    },
    log = {enable = true, truncate = true, types = {diagnostics = true, git = true, profile = true, watcher = true}}
})
-- 自动关闭
-- [[
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
-- ]]
