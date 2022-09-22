-- leader key 为空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {noremap = true, silent = true}
-- local map = vim.api.nvim_set_keymap
local map = function(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- 快速打开vim配置文件
map("n", "<leader>ov", ":tabnew " .. vim.g.nvim_init_home .. "/init.vim<CR>")

-- 命令行下 Ctrl+j/k  上一个下一个
-- map("c", "<C-j>", "<C-n>", {noremap = false})
-- map("c", "<C-k>", "<C-p>", {noremap = false})

-- 保存
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>wq", ":wqa!<CR>")

-- 退出
map("n", "q", ":q<CR>")
map("n", "qq", ":q!<CR>")
map("n", "Q", ":qa!<CR>")

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP')

-- =======================================================================================
-- 移动光标
-- =======================================================================================
-- 插入模式
map("i", "<C-j>", "<up>")
map("i", "<C-k>", "<down>")
map("i", "<C-h>", "<left>")
map("i", "<C-l>", "<right>")
map("i", "<C-a>", "<home>")
map("i", "<C-e>", "<end>")
map("i", "<C-d>", "<del>")

-- 命令模式
map("c", "<C-j>", "<up>", {noremap = false})
map("c", "<C-k>", "<down>", {noremap = false})
map("c", "<C-h>", "<left>", {noremap = false})
map("c", "<C-l>", "<right>", {noremap = false})
map("c", "<C-a>", "<home>", {noremap = false})
map("c", "<C-e>", "<end>", {noremap = false})
map("c", "<C-d>", "<del>", {noremap = false})

-- 普通模式
map("n", "<C-j>", "5j")
map("n", "<C-k>", "5k")
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k")
map("n", "<C-d>", "10j")

-- 可视模式
map("v", "<C-j>", "5j")
map("v", "<C-k>", "5k")

-- =======================================================================================
-- window 
-- =======================================================================================
-- split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map("n", "<leader>sj", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>",
    {desc = ""})
map("n", "<leader>sk", ":set splitbelow<CR>:split<CR>", {desc = ""})
map("n", "<leader>sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>",
    {desc = ""})
map("n", "<leader>sl", ":set splitright<CR>:vsplit<CR>", {desc = ""})

-- 
map("n", "srh", "<C-w>b<C-w>K", {desc = ""})
map("n", "srv", "<C-w>b<C-w>H", {desc = ""})
map("n", "<leader>sh", "<C-w>t<C-w>K", {desc = ""})
map("n", "<leader>sv", "<C-w>t<C-w>H", {desc = ""})

-- 
map("n", "<C-A-n>", "<C-w>w",
    {desc = "Move cursor to window below/right of the current one"})
map("n", "<C-A-p>", "<C-w>W",
    {desc = "Move cursor to window above/left of the current one"})
map("n", "<A-j>", "<C-w>k", {desc = "Move cursor to below window"})
map("n", "<A-k>", "<C-w>j", {desc = "Move cursor to above window"})
map("n", "<A-h>", "<C-w>h")
map("n", "<A-l>", "<C-w>l")

-- 
map("n", "<leader>wq", "<C-w>c", {desc = ""})
map("n", "<leader>wo", "<C-w>o", {desc = ""})
map("n", "<leader>wa", "<C-w>o <bar> :q <CR>", {desc = ""})

-- 
map("n", "<C-up>", ":res +5", {desc = ""})
map("n", "<C-down>", ":res -5", {desc = ""})
map("n", "<C-left>", ":vertical resize-5", {desc = ""})
map("n", "<C-right>", ":vertical resize+5", {desc = ""})

-- =======================================================================================
-- buffer 
-- =======================================================================================
-- bufferline plugin
map("n", "bp", ":BufferLineCyclePrev<CR>")
map("n", "bn", ":BufferLineCycleNext<CR>")

-- "moll/vim-bbye"
map("n", "<leader>bd", ":Bdelete!<CR>", {desc = "difference between :q and :bd"})
map("n", "<leader>br", ":BufferLineCloseRight<CR>")
map("n", "<leader>bl", ":BufferLineCloseLeft<CR>")
map("n", "<leader>bc", ":BufferLinePickClose<CR>")

-- 
local pluginKeys = {}
-- =======================================================================================
-- nvim-tree
-- =======================================================================================
-- 
map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    -- <CR>, o 都映射到 edit 动作上面
    -- edit 打开一个buffer, tabnew 打开一个tab
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"},
    {key = {"O"}, action = "tabnew"}, {key = "v", action = "vsplit"},
    {key = "h", action = "split"}, {key = "i", action = "toggle_custom"},
    {key = ".", action = "toggle_dotfiles"}, -- Hide (dotfiles)
    {key = "<F5>", action = "refresh"}, {key = "a", action = "create"},
    {key = "d", action = "remove"}, {key = "r", action = "rename"},
    {key = "x", action = "cut"}, {key = "c", action = "copy"},
    {key = "p", action = "paste"}, {key = "s", action = "system_open"},
    {key = "W", action = "collapse_all"}, {key = "E", action = "expand_all"}
}

-- =======================================================================================
-- formatting
-- =======================================================================================
map("n", "==", ":lua vim.lsp.buf.formatting_sync()<CR>")

-- =======================================================================================
-- LSP
-- =======================================================================================
pluginKeys.mapLSP = function(mapbuf)
    -- go xx
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- diagnostic
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    mapbuf("n", "<S-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    mapbuf('n', '<S-d>', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- formatting
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
end

-- =======================================================================================
-- nvim-cmp
-- =======================================================================================
pluginKeys.cmp = function(cmp)
    return {
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        -- 预览窗口上下滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"})
    }
end

-- =======================================================================================
-- comment 
-- =======================================================================================
pluginKeys.comment = {
    -- Normal
    toggler = {line = "gcc", block = "gbc"},
    opleader = {line = "gc", bock = "gb"}
}

-- =======================================================================================
-- Telescope
-- =======================================================================================

map("n", "<C-p>", ":Telescope find_files<CR>")
map("n", "<C-f>", ":Telescope live_grep<CR>")

pluginKeys.telescopeList = {
    i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        ["<C-c>"] = "close",
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down"
    }
}
return pluginKeys
