local status, navigator = pcall(require, "navigator")
if not status then
    vim.notify("没有找到 navigator")
    return
end

navigator.setup({
    lsp = {
        disable_lsp = { 'pylsp' }
    }
})
