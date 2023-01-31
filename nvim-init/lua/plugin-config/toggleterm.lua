local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    vim.notify("没有找到 toggleterm")
    return
end

toggleterm.setup({
    size = 10,
    open_mapping = [[<F7>]],
    -- shading_factor = 2,
    direction = "float",
    autochdir = true,
    start_in_insert = true,
    -- persist_size = false
})

-- function _G.set_terminal_keymaps()
--     local opts = {buffer = 0}
--     vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--     vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--     vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--     vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--     vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
