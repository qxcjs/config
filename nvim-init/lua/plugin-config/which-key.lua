-- https://zhuanlan.zhihu.com/p/555470098
local status, which_key = pcall(require, "which-key")
if not status then
    vim.notify("没有找到 which_key")
    return
end

local conf = {
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom" -- bottom, top
    }
}

local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
    -- ["w"] = {"<cmd>update!<CR>", "Save"},
    -- ["q"] = {"<cmd>q!<CR>", "Quit"},

    -- b = {
    --     name = "Buffer",
    --     c = {"<Cmd>bd!<Cr>", "Close current buffer"},
    --     D = {"<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers"}
    -- },

    k = {name = "Find", e = {"<cmd>NvimTreeToggle<cr>", "Explorer"}}

    -- z = {
    --     name = "Packer",
    --     c = {"<cmd>PackerCompile<cr>", "Compile"},
    --     i = {"<cmd>PackerInstall<cr>", "Install"},
    --     p = {"<cmd>PackerProfile<cr>", "Profile"},
    --     s = {"<cmd>PackerSync<cr>", "Sync"},
    --     S = {"<cmd>PackerStatus<cr>", "Status"},
    --     u = {"<cmd>PackerUpdate<cr>", "Update"}
    -- },

    -- g = {name = "Git", s = {"<cmd>Neogit<CR>", "Status"}}
}

which_key.setup(conf)
which_key.register(mappings, opts)
