print "start to load taplo for toml"
local status, tap = pcall(require, "taplo")
if not status then
    vim.notify("没有找到 taplo for toml")
    return
end

require'lspconfig'.taplo.setup {}
