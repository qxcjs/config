-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   select_mode = "s",
--   term_mode = "t",
--   command_mode = "c",
--
-- leader key 为空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local vim_map = function(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

local nvim_map = function(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local options = {noremap = true, silent = true}

-- 快速打开vim配置文件
nvim_map("n", "<leader>ov", ":tabnew " .. vim.g.nvim_init_home .. "/init.vim<CR>", {desc = "quick open vim config"})
nvim_map("n", "<leader>so", ":so " .. vim.g.nvim_init_home .. "/init.vim<CR>", {desc = "quick source vim config"})

-- 命令行下 Ctrl+j/k  上一个下一个
-- map("c", "<C-j>", "<C-n>", {noremap = false})
-- map("c", "<C-k>", "<C-p>", {noremap = false})

-- 保存退出
nvim_map("n", "<leader>w", "<cmd>w<CR>", {desc = "Save"})
nvim_map("n", "<leader>q", ":q<CR>", {desc = "Quit"})
nvim_map("n", "<C-q>", ":q!<CR>", {desc = "Force Quit"})
nvim_map("n", "<C-s>", ":w!<CR>", {desc = "Force Save"})
nvim_map("n", "<leader>wa", ":wqa!<CR>", {desc = "Force Save All"})
nvim_map("n", "<leader>qa", ":qa!<CR>", {desc = "Force Quit All"})

-- 在visual 模式里粘贴后不要复制覆盖的内容
nvim_map("v", "p", '"_dP')

-- =======================================================================================
-- 移动光标
-- =======================================================================================
-- 插入模式
nvim_map("i", "<C-j>", "<up>")
nvim_map("i", "<C-k>", "<down>")
nvim_map("i", "<C-h>", "<left>")
nvim_map("i", "<C-l>", "<right>")
nvim_map("i", "<C-a>", "<home>")
nvim_map("i", "<C-e>", "<end>")
nvim_map("i", "<C-d>", "<del>")

-- 命令模式
nvim_map("c", "<C-j>", "<up>", {noremap = false})
nvim_map("c", "<C-k>", "<down>", {noremap = false})
nvim_map("c", "<C-h>", "<left>", {noremap = false})
nvim_map("c", "<C-l>", "<right>", {noremap = false})
nvim_map("c", "<C-a>", "<home>", {noremap = false})
nvim_map("c", "<C-e>", "<end>", {noremap = false})
nvim_map("c", "<C-d>", "<del>", {noremap = false})

-- 普通模式
nvim_map("n", "<C-j>", "5j")
nvim_map("n", "<C-k>", "5k")
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
nvim_map("n", "<C-u>", "10k")
nvim_map("n", "<C-d>", "10j")

-- 可视模式
nvim_map("v", "<C-j>", "5j")
nvim_map("v", "<C-k>", "5k")

-- =======================================================================================
-- jump
-- =======================================================================================
vim_map('n', '<leader>tjl', "<cmd>lua require('telescope.builtin').jumplist({show_line=true, trim_text=true}) <CR>",
        {desc = "Lists items from Vim's jumplist, jumps to location on"})
-- vim_map('n', '<leader>b', "<Ctrl-O>", {desc = "Back"})
-- vim_map('n', '<leader>f', "<Ctrl-I>", {desc = "Forword"})

-- =======================================================================================
-- window
-- =======================================================================================
-- split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nvim_map("n", "<leader>sj", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", {desc = "split window below keep cursor"})
nvim_map("n", "<leader>sk", ":set splitbelow<CR>:split<CR>", {desc = "split window below move cursor"})
nvim_map("n", "<leader>sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", {desc = "split window right keep cursor"})
nvim_map("n", "<leader>sl", ":set splitright<CR>:vsplit<CR>", {desc = "split window right move cursor"})

nvim_map("n", "srh", "<C-w>b<C-w>K", {desc = "go to bottom window then move to the very top"})
nvim_map("n", "srv", "<C-w>b<C-w>H", {desc = "go to bottom window then move to the far left"})
nvim_map("n", "<leader>sh", "<C-w>t<C-w>K", {desc = "go to top window then move to the very top"})
nvim_map("n", "<leader>sv", "<C-w>t<C-w>H", {desc = "go to top window then move to the very left"})

nvim_map("n", "<C-A-n>", "<C-w>w", {desc = "Move cursor to window below/right of the current one"})
nvim_map("n", "<C-A-p>", "<C-w>W", {desc = "Move cursor to window above/left of the current one"})
nvim_map("n", "<A-j>", "<C-w>k", {desc = "Move cursor to below window"})
nvim_map("n", "<A-k>", "<C-w>j", {desc = "Move cursor to above window"})
nvim_map("n", "<A-h>", "<C-w>h", {desc = "Move cursor to left window"})
nvim_map("n", "<A-l>", "<C-w>l", {desc = "Move cursor to right window"})

nvim_map("n", "<leader>wq", "<C-w>c", {desc = "close current window"})
nvim_map("n", "<leader>wo", "<C-w>o", {desc = "keep current window, close others"})
nvim_map("n", "<leader>wa", "<C-w>o <bar> :q <CR>", {desc = "close all window"})

nvim_map("n", "<leader><Up>", ":res +5<CR>", {desc = "up res +5"})
nvim_map("n", "<leader><Down>", ":res -5<CR>", {desc = "down res -5"})
nvim_map("n", "<leader><Left>", ":vertical resize-5<CR>", {desc = "vertical resize-5"})
nvim_map("n", "<leader><Right>", ":vertical resize+5<CR>", {desc = "vertical resize+5"})

-- =======================================================================================
-- buffer
-- =======================================================================================
-- bufferline plugin
-- nvim_map("n", "<S-n>", ":BufferLineCycleNext<CR>", {desc = "Next buffer tab"})
-- nvim_map("n", "<S-p>", ":BufferLineCyclePrev<CR>", {desc = "Previous buffer tab"})
nvim_map("n", "<leader>bn", ":BufferLineCycleNext<CR>", {desc = "Next buffer tab"})
nvim_map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", {desc = "Previous buffer tab"})
nvim_map("n", ">b", ":BufferLineMoveNext<CR>", {desc = "Move buffer tab right"})
nvim_map("n", "<b", ":BufferLineMovePrev<CR>", {desc = "Move buffer tab left"})

-- "moll/vim-bbye"
nvim_map("n", "<leader>bd", ":Bdelete!<CR>", {desc = "difference between :q and :bd"})
nvim_map("n", "<leader>br", ":BufferLineCloseRight<CR>")
nvim_map("n", "<leader>bl", ":BufferLineCloseLeft<CR>")
nvim_map("n", "<leader>bc", ":BufferLinePickClose<CR>")

-- =======================================================================================
-- lspconfig
-- =======================================================================================
nvim_map("n", "<leader>li", "<cmd>LspInfo<cr>", {desc = "LSP information"})

--
local pluginKeys = {}
-- =======================================================================================
-- nvim-tree
-- =======================================================================================
-- map("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", {desc = "NvimTreeFindFileToggle"})
nvim_map("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "NvimTreeToggle"})

-- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    -- <CR>, o 都映射到 edit 动作上面
    -- edit 打开一个buffer, tabnew 打开一个tab
    {key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit"}, {key = {"O"}, action = "tabnew"}, {key = "v", action = "vsplit"},
    {key = "h", action = "split"}, {key = "i", action = "toggle_custom"}, {key = ".", action = "toggle_dotfiles"}, -- Hide (dotfiles)
    {key = "<F5>", action = "refresh"}, {key = "a", action = "create"}, {key = "d", action = "remove"},
    {key = "r", action = "rename"}, {key = "x", action = "cut"}, {key = "c", action = "copy"}, {key = "p", action = "paste"},
    {key = "s", action = "system_open"}, {key = "W", action = "collapse_all"}, {key = "E", action = "expand_all"}
}

-- =======================================================================================
-- Toggleterm Terminal
-- =======================================================================================

-- vim_map("n", "<F6>", ":let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>A<CR>cd $VIM_DIR<CR>", {desc = "Terminal float"})
nvim_map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", {desc = "Terminal float"})
nvim_map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", {desc = "Terminal horizontal split on bottom"})
nvim_map("n", "<leader>tv", "<cmd>ToggleTerm size=10 direction=vertical<cr>", {desc = "Terminal vertical split on left"})
-- map("n", "<leader>tt", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", {desc = "Toggle terminal on normal mode"})
nvim_map("n", "<leader>tt",
         ":let $BUF_DIR=expand('%:p:h') | :ToggleTerm size=15 direction=horizontal dir=$BUF_DIR<cr> cd $BUF_DIR <CR>",
         {desc = "Toggle terminal on normal mode"})
-- map("t", "<leader>tt", "<cmd>ToggleTerm size=15 direction=horizontal<cr>",
--     { desc = "Toggle terminal on terminal mode" })
nvim_map("t", "<Esc>", "<c-\\><c-n>", {desc = "change to normal mode in terminal"})

-- =======================================================================================
-- LSP
-- =======================================================================================
nvim_map("n", "==", ":lua vim.lsp.buf.format{timeout_ms = 5000,async = true}<CR>", {desc = "formatting"})

pluginKeys.mapLSP = function(mapbuf)
    -- go xx
    -- mapbuf("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
    mapbuf("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)

    -- diagnostic
    mapbuf("n", "<leader>eo", "<cmd>lua vim.diagnostic.open_float()<CR>", options) -- 窗口中显示告警信息
    mapbuf("n", "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
    mapbuf("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
    -- mapbuf('n', '<leader>el', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt) -- 显示告警列表
    mapbuf("n", "<S-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
    mapbuf('n', '<S-d>', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)

    -- workspace
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    mapbuf('n', '<space>lw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', options)

    -- rename
    mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    mapbuf("n", "<leader>sp", "<cmd>lua require'symbols-outline'.toggle_outline()<CR>", options)

    -- Symbols are special keywords in your code such as variables, functions, etc.
    mapbuf("n", "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", options)
end

-- =======================================================================================
-- Symbols-outline
-- =======================================================================================
pluginKeys.symbolsOutline = function(mapbuf)
    -- go xx
    mapbuf("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", options)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
    mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
    mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
    mapbuf("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
end

-- =======================================================================================
-- Telescope
-- =======================================================================================

nvim_map("n", "<leader>ff", ":Telescope find_files<CR>", {desc = "Telescope find_files"})
nvim_map("n", "<leader>fe", ":Telescope oldfiles<CR> <ESC>", {desc = "Telescope oldfiles"})
nvim_map("n", "<leader>fb", ":Telescope buffers<CR> <ESC>", {desc = "Telescope buffers"})
nvim_map("n", "<leader>fg", ":Telescope live_grep<CR>", {desc = "Telescope live_grep"})
nvim_map("n", "<leader>fh", ":Telescope help_tags<CR>", {desc = "Telescope help_tags"})

local builtin = require('telescope.builtin')

vim_map('n', '<leader>tgi', builtin.lsp_implementations, {desc = "Lists LSP references for word under the cursor [Telescope]"})
vim_map('n', '<leader>tgd', function() builtin.lsp_definitions({show_line = false, fname_width = 15, trim_text = true}) end,
        {desc = "Goto the definition of the word under the cursor [Telescope]"})
vim_map('n', '<leader>tgt', builtin.lsp_type_definitions,
        {desc = "Goto the definition of the type of the word under the cursor [Telescope]"})
-- vim_map('n', '<leader>tlr', builtin.lsp_references, {desc = "Lists LSP references for word under the cursor [Telescope]"})
vim_map('n', '<leader>tlr',
        function() builtin.lsp_references({jump_type = 'never', show_line = false, fname_width = 15, trim_text = true}) end,
        {desc = "Lists LSP references for word under the cursor [Telescope]"})
vim_map('n', '<leader>tls', builtin.lsp_document_symbols,
        {desc = "Lists LSP document symbols in the current buffer [Telescope]"})
vim_map('n', '<leader>tli', builtin.lsp_incoming_calls,
        {desc = "Lists LSP incoming calls for word under the cursor [Telescope]"})
vim_map('n', '<leader>tlo', builtin.lsp_outgoing_calls,
        {desc = "Lists LSP outgoing calls for word under the cursor [Telescope]"})
nvim_map('n', '<leader>tle', "<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<CR>",
         {desc = "Lists Diagnostics for current open buffer [Telescope]"})

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

-- =======================================================================================
-- nvim-cmp
-- =======================================================================================
pluginKeys.cmp = function(cmp)
    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local select_opts = {behavior = cmp.SelectBehavior.Select}
    return {
        -- {"i", "c"} 表示在 insert 模式和 command 模式
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}), -- 出现补全
        -- 取消 Cancel
        ["<Esc>"] = cmp.mapping({i = cmp.mapping.abort(), c = cmp.mapping.close()}),
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- 上一个
        ["<C-n>"] = cmp.mapping.select_next_item(), -- 下一个
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        -- 确认 Confirm
        ["<CR>"] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace}),
        -- Confirm
        -- ['<Tab>'] = cmp.mapping.confirm({select = true}),
        -- ['<Space>'] = cmp.mapping.confirm({select = true}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete({select = false, behavior = cmp.ConfirmBehavior.Replace})
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {"i", "s"}),
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
return pluginKeys
