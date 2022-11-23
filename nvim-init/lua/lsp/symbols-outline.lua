local status, symbols_outline = pcall(require, "symbols-outline")
if not status then
    vim.notify("没有找到 symbols-outline")
    return
end

local opts = {symbol_blacklist = {'Variable'}}

symbols_outline.setup(opts)
