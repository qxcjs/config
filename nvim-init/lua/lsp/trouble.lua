local status, trouble = pcall(require, "trouble")
if not status then
    vim.notify("没有找到 trouble")
    return
end

trouble.setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true -- use devicons for filenames
}
