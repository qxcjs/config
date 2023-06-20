local ok, notify = pcall(require, "notify")
if not ok then
    vim.notify("没有找到 nvim-notify")
    return
end

vim.notify = notify
