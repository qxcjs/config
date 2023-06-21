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
        -- print(vim.inspect(term))
        -- print(vim.inspect(vim.tbl_keys(term)))
        -- print(term.dir)
        -- print(term.id)
        -- print(vim.api.nvim_buf_get_name(0))
        -- print(vim.fn.expand('%'))
        -- print(vim.fn.expand('%:p:h'))
        -- print(vim.fn.getcwd())
        -- print(vim.loop.cwd())
        -- print(vim.cmd("!echo %:p:h"))
        -- term:change_dir("/mnt/f/GitWorkspace/config/")
        -- term:change_dir(vim.loop.cwd())
        -- vim.notify(vim.cmd("ls"), vim.log.levels.INFO)
        -- vim.api.nvim_exec("ls", true)
        vim.notify(vim.api.nvim_command_output("ls"), vim.log.levels.INFO)

        local active_bufnr = vim.fn.bufnr("a")
        vim.notify(string.format('active bufnr num %s', active_bufnr), vim.log.levels.INFO)

        if active_bufnr == -1 then active_bufnr = vim.fn.bufnr("#") end
        -- active_bufnr = active_bufnr == -1 or vim.fn.bufnr("#")
        vim.notify(string.format('active bufnr num %s', active_bufnr), vim.log.levels.INFO)
        -- print(active_bufnr)
        local buf_path = vim.fn.expand('#' .. active_bufnr .. ":p:h")
        vim.notify(string.format('active bufnr path %s', buf_path), vim.log.levels.INFO)
        -- print(path)
        -- 打开 terminal 时进入当前激活 buffer 所在目录
        term:change_dir(buf_path)
        vim.cmd("startinsert!")

        -- 这里的 bufnr 是 terminal 的编号, 不是当前 buffer 的, ls 并不会显示 terminal 的编号
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
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
        -- 这里的 bufnr 是 terminal 的编号, 不是当前 buffer 的
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
local python = Terminal:new({
    cmd = "python3",
    hidden = true,
    on_open = function(term)
        vim.cmd("startinsert!")
    end
})

function _PYTHON_TOGGLE()
    python:toggle()
end

-- count 指定 terminal 的编号, 可以使用 :9ToggleTerm 打开 Terminal
local python_run = Terminal:new({
    -- cmd = "python3",
    hidden = true,
    -- count = 9,
    on_open = function(term)
        vim.cmd("startinsert!")
        local active_bufnr = vim.fn.bufnr("a")
        active_bufnr = active_bufnr == -1 or vim.fn.bufnr("#")

        print(active_bufnr)
        local full_path = vim.fn.expand('#' .. active_bufnr .. ":p")
        -- 打开 python 终端时执行文件
        local command = "python3 " .. full_path
        term:send(command)
    end
})

function _PYTHON_RUN_TOGGLE()
    python_run:toggle()
end
