local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 包管理器
        use 'wbthomason/packer.nvim'
        -- 主题
        use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
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
        -- status 状态栏展示
        use({
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        })
        -- 括号补全
        use({"windwp/nvim-autopairs"})
        -- 注释
        use {'numToStr/Comment.nvim'}
        use("arkav/lualine-lsp-progress")
        -- 快速搜索
        use {
            'nvim-telescope/telescope.nvim',
            requires = {"nvim-lua/plenary.nvim"}
        }
        -- dashboard
        use("glepnir/dashboard-nvim")
        use("ahmedkhalf/project.nvim")
        -- 代码高亮, 增量选择, 自动缩进等功能
        use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

        -- LSP
        use({
            "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig"
        })
        use({
            "hrsh7th/nvim-cmp", "hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp", -- { name = nvim_lsp }
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

-- 保存时自动下载插件
pcall(vim.cmd, [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]])
