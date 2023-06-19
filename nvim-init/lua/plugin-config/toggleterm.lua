local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    vim.notify("没有找到 toggleterm")
    return
end

-- https://github.com/akinsho/toggleterm.nvim/issues/346
toggleterm.setup({
    size = 10,
    open_mapping = [[<F7>]],
    -- shading_factor = 2,
    direction = "float",
    autochdir = true,
    start_in_insert = true,
    on_open = function(term)
        print(vim.inspect(term))
        print(vim.inspect(vim.tbl_keys(term)))
        print(term.dir)
        print(term.id)
        print(vim.api.nvim_buf_get_name(term.bufnr))
        print(vim.fn.expand('%'))
        print(vim.fn.expand('%:p:h'))
        print(vim.loop.cwd())
        -- term:change_dir("/mnt/f/GitWorkspace/config/")
        term:change_dir(vim.loop.cwd())
        -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        -- print(vim.inspect(term))
        -- vim.cmd('cd /mnt/f')
    end,
    on_close = function(term)
        vim.cmd("startinsert!")
    end
    -- persist_size = false
})

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- 删除 TermOpen 命令
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {border = "double"},
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end
})

function _LAZYGIT_TOGGLE()
    -- lua 的面向对象, 使用 : 访问 Terminal 类的成员函数
    lazygit:toggle()
end

local node = Terminal:new({cmd = "node", hidden = true})

function _NODE_TOGGLE()
    node:toggle()
end

-- count 指定 terminal 的编号, 可以使用 :9ToggleTerm 打开 Terminal
local python = Terminal:new({cmd = "python3", hidden = true, count = 9})

function _PYTHON_TOGGLE()
    python:toggle()
end
