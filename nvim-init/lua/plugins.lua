local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        -- 你的插件列表...
        use {"ellisonleao/gruvbox.nvim"}
        -- 左侧树
        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons"
        })
        -- tab 展示
        use({
            "akinsho/bufferline.nvim",
            requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}
        })
        -- 下面状态栏
        use({
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        })
        -- dashboard
        use("glepnir/dashboard-nvim")
        use("ahmedkhalf/project.nvim")
        -- 语法高亮
        use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

        -- LSP
        use({
            "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp", -- �码补全
            "hrsh7th/vim-vsnip", -- snippet 引擎
            "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
            "hrsh7th/cmp-vsnip", "hrsh7th/cmp-buffer", -- { name = 'buffer' },
            "hrsh7th/cmp-path", -- { name = 'path' }
            "hrsh7th/cmp-cmdline" -- { name = 'cmdline' }
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = "nvim-lua/plenary.nvim"
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({border = "single"})
            end
        }
    }
})

-- 每次保存 plugins.lua 自动安装插件
pcall(vim.cmd, [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])
