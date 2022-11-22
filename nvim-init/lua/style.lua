-- gruvbox onedark
-- local colorscheme = "onedark"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--     vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
--     return
-- end
local status, onedark = pcall(require, "onedark")
if not status then
    vim.notify("没有找到 onedark")
    return
end

-- dark, darker, cool, deep, warm, warmer, light
onedark.setup({style = 'warm'})
onedark.load()
