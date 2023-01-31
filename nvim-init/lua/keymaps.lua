-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
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
map("n", "<leader>ov", ":tabnew " .. vim.g.nvim_init_home .. "/init.vim<CR>", {desc = "quick open vim config"})

-- 命令行下 Ctrl+j/k  上一个下一个
-- map("c", "<C-j>", "<C-n>", {noremap = false})
-- map("c", "<C-k>", "<C-p>", {noremap = false})

-- 保存退出
map("n", "<leader>w", "<cmd>w<CR>", {desc = "Save"})
map("n", "<leader>q", ":q<CR>", {desc = "Quit"})
map("n", "<C-q>", ":q!<CR>", {desc = "Force Quit"})
map("n", "<C-s>", ":w!<CR>", {desc = "Force Save"})
map("n", "<leader>wa", ":wqa!<CR>", {desc = "Force Save All"})
map("n", "<leader>qa", ":qa!<CR>", {desc = "Force Quit All"})

-- 在visual 模式里粘贴后不要复制覆盖的内容
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
map("n", "<leader>sj", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", {desc = "split window below keep cursor"})
map("n", "<leader>sk", ":set splitbelow<CR>:split<CR>", {desc = "split window below move cursor"})
map("n", "<leader>sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", {desc = "split window right keep cursor"})
map("n", "<leader>sl", ":set splitright<CR>:vsplit<CR>", {desc = "split window right move cursor"})

--
map("n", "srh", "<C-w>b<C-w>K", {desc = "go to bottom window then move to the very top"})
map("n", "srv", "<C-w>b<C-w>H", {desc = "go to bottom window then move to the far left"})
map("n", "<leader>sh", "<C-w>t<C-w>K", {desc = "go to top window then move to the very top"})
map("n", "<leader>sv", "<C-w>t<C-w>H", {desc = "go to top window then move to the very left"})

map("n", "<C-A-n>", "<C-w>w", {desc = "Move cursor to window below/right of the current one"})
map("n", "<C-A-p>", "<C-w>W", {desc = "Move cursor to window above/left of the current one"})
map("n", "<A-j>", "<C-w>k", {desc = "Move cursor to below window"})
map("n", "<A-k>", "<C-w>j", {desc = "Move cursor to above window"})
map("n", "<A-h>", "<C-w>h", {desc = "Move cursor to left window"})
map("n", "<A-l>", "<C-w>l", {desc = "Move cursor to right window"})

map("n", "<leader>wq", "<C-w>c", {desc = "close current window"})
map("n", "<leader>wo", "<C-w>o", {desc = "keep current window, close others"})
map("n", "<leader>wa", "<C-w>o <bar> :q <CR>", {desc = "close all window"})

map("n", "<leader><Up>", ":res +5<CR>", {desc = "up res +5"})
map("n", "<leader><Down>", ":res -5<CR>", {desc = "down res -5"})
map("n", "<leader><Left>", ":vertical resize-5<CR>", {desc = "vertical resize-5"})
map("n", "<leader><Right>", ":vertical resize+5<CR>", {desc = "vertical resize+5"})

-- =======================================================================================
-- buffer
-- =======================================================================================
-- bufferline plugin
map("n", "<S-n>", ":BufferLineCycleNext<CR>", {desc = "Next buffer tab"})
map("n", "<S-p>", ":BufferLineCyclePrev<CR>", {desc = "Previous buffer tab"})
map("n", "<leader>bn", ":BufferLineCycleNext<CR>", {desc = "Next buffer tab"})
map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", {desc = "Previous buffer tab"})
map("n", ">b", ":BufferLineMoveNext<CR>", {desc = "Move buffer tab right"})
map("n", "<b", ":BufferLineMovePrev<CR>", {desc = "Move buffer tab left"})

-- "moll/vim-bbye"
map("n", "<leader>bd", ":Bdelete!<CR>", {desc = "difference between :q and :bd"})
map("n", "<leader>br", ":BufferLineCloseRight<CR>")
map("n", "<leader>bl", ":BufferLineCloseLeft<CR>")
map("n", "<leader>bc", ":BufferLinePickClose<CR>")

-- =======================================================================================
-- lspconfig
-- =======================================================================================
map("n", "<leader>li", "<cmd>LspInfo<cr>", {desc = "LSP information"})

--
local pluginKeys = {}
-- =======================================================================================
-- nvim-tree
-- =======================================================================================
-- map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", {desc = "NvimTreeFindFileToggle"})
map("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "NvimTreeToggle"})

-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    -- <CR>, o 都映射到 edit 动作上面
    -- edit 打开一个buffer, tabnew 打开一个tab
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"}, {key = {"O"}, action = "tabnew"},
    {key = "v", action = "vsplit"}, {key = "h", action = "split"}, {key = "i", action = "toggle_custom"},
    {key = ".", action = "toggle_dotfiles"}, -- Hide (dotfiles)
    {key = "<F5>", action = "refresh"}, {key = "a", action = "create"}, {key = "d", action = "remove"},
    {key = "r", action = "rename"}, {key = "x", action = "cut"}, {key = "c", action = "copy"},
    {key = "p", action = "paste"}, {key = "s", action = "system_open"}, {key = "W", action = "collapse_all"},
    {key = "E", action = "expand_all"}
}

-- =======================================================================================
-- Toggleterm Terminal
-- =======================================================================================

map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", {desc = "Terminal float"})
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    {desc = "Terminal horizontal split on bottom"})
map("n", "<leader>tv", "<cmd>ToggleTerm size=10 direction=vertical<cr>", {desc = "Terminal vertical split on left"})
-- map("n", "<leader>tt", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", {desc = "Toggle terminal on normal mode"})
map("n", "<leader>tt", ":let $BUF_DIR=expand('%:p:h')<CR> :<cmd>ToggleTerm size=15 direction=horizontal dir=$BUF_DIR<cr>", {desc = "Toggle terminal on normal mode"})
-- map("t", "<leader>tt", "<cmd>ToggleTerm size=15 direction=horizontal<cr>",
--     { desc = "Toggle terminal on terminal mode" })
map("t", "<Esc>", "<c-\\><c-n>", {desc = "change to normal mode in terminal"})

-- =======================================================================================
-- formatting
-- =======================================================================================
map("n", "==", ":lua vim.lsp.buf.format{async = true}<CR>", {desc = "formatting"})

-- =======================================================================================
-- LSP
-- =======================================================================================
pluginKeys.mapLSP = function(mapbuf)
    -- go xx
    -- mapbuf("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    -- diagnostic
    mapbuf("n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf('n', '<leader>sd', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt) -- 显示告警列表
    mapbuf("n", "<leader>se", "<cmd>lua vim.diagnostic.open_float()<CR>", opt) -- 窗口中显示告警信息
    mapbuf("n", "<S-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    mapbuf('n', '<S-d>', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>sp", "<cmd>lua require'symbols-outline'.toggle_outline()<CR>", opt)

    -- Symbols are special keywords in your code such as variables, functions, etc.
    mapbuf("n", "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opt)
end

-- =======================================================================================
-- nvim-cmp
-- =======================================================================================
pluginKeys.cmp = function(cmp)
    local select_opts = {behavior = cmp.SelectBehavior.Select}
    return {
        -- {"i", "c"} 表示在 insert 模式和 command 模式
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}), -- 出现补全
        -- 取消 Cancel
        ["<C-e>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- 上一个
        ["<C-n>"] = cmp.mapping.select_next_item(), -- 下一个
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        -- 确认 Confirm 
        ["<CR>"] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace}),
        -- Confirm 
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
--
-- =======================================================================================
-- Symbols-outline
-- =======================================================================================
pluginKeys.symbolsOutline = function(mapbuf)
    -- go xx
    mapbuf("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
end

-- =======================================================================================
-- Telescope
-- =======================================================================================

map("n", "<leader>ff", ":Telescope find_files<CR>", {desc = "Telescope find_files"})
map("n", "<leader>fe", ":Telescope oldfiles<CR> <ESC>", {desc = "Telescope oldfiles"})
map("n", "<leader>fb", ":Telescope buffers<CR> <ESC>", {desc = "Telescope buffers"})
map("n", "<leader>fg", ":Telescope live_grep<CR>", {desc = "Telescope live_grep"})
map("n", "<leader>fh", ":Telescope help_tags<CR>", {desc = "Telescope help_tags"})

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
