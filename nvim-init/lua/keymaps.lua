-- leader key 为空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {noremap = true, silent = true}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- 快速打开vim配置文件
map("n", "<leader>ov", ":tabnew " .. vim.g.nvim_init_home .. "/init.vim<CR>",
    opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", {noremap = false})
map("c", "<C-k>", "<C-p>", {noremap = false})

-- 保存
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- 左右Tab切换
-- =======================================================================================
-- bufferline
-- =======================================================================================
map("n", "bp", ":BufferLineCyclePrev<CR>", opt)
map("n", "bn", ":BufferLineCycleNext<CR>", opt)

-- 关闭
-- "moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- 插件快捷键
local pluginKeys = {}
-- =======================================================================================
-- nvim-tree
-- ======================================================================================= 
-- 打开关闭tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    -- <CR>, o 都映射到 edit 动作上面
    -- edit 打开一个buffer, tabnew 打开一个tab
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
    -- 分屏打开文件
    {key = "v", action = "vsplit"}, {key = "h", action = "split"},
    -- 显示隐藏文件
    {key = "i", action = "toggle_custom"}, -- 对应 filters 中的 custom (node_modules)
    {key = ".", action = "toggle_dotfiles"}, -- Hide (dotfiles)
    -- 文件操作
    {key = "<F5>", action = "refresh"}, {key = "a", action = "create"},
    {key = "d", action = "remove"}, {key = "r", action = "rename"},
    {key = "x", action = "cut"}, {key = "c", action = "copy"},
    {key = "p", action = "paste"}, {key = "s", action = "system_open"}
}

-- =======================================================================================
-- 格式化 
-- ======================================================================================= 
map("n", "==", ":lua vim.lsp.buf.formatting_sync()<CR>", opt)

-- =======================================================================================
-- LSP 跳转, 文档
-- =======================================================================================
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    -- code action
    mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    mapbuf("n", "<S-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<S-d>', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- =======================================================================================
-- nvim-cmp 自动补全
-- =======================================================================================
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"})
    }
end

-- =======================================================================================
-- comment 代码注释
-- =======================================================================================
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = "gcc", -- 行注释
        block = "gbc" -- 块注释
    },
    -- Visual 模式
    opleader = {line = "gc", bock = "gb"}
}

-- =======================================================================================
-- Telescope 
-- ======================================================================================= 

-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down"
    }
}
return pluginKeys
