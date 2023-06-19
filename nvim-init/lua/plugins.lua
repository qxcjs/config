local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
-- print(install_path)
local install_plugins = false

-- 自动下载 packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing packer...')
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
    print('Done.')

    vim.cmd('packadd packer.nvim')
    install_plugins = true
end

local packer = require("packer")
packer.startup({
    function(use)
        use 'rafcamlet/nvim-whid'
        -- Packer 包管理器
        use 'wbthomason/packer.nvim'
        -- 主题
        -- use {"ellisonleao/gruvbox.nvim"}
        use 'navarasu/onedark.nvim'

        -- dashboard
        -- use "glepnir/dashboard-nvim"
        -- use "ahmedkhalf/project.nvim"

        -- 快捷键提示
        use "folke/which-key.nvim"

        -- Terminal
        use {"akinsho/toggleterm.nvim", tag = 'v2.2.1'}

        -- 左侧树
        use {"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons", "ahmedkhalf/project.nvim"}}

        -- tab 展示
        use {"akinsho/bufferline.nvim", requires = {"nvim-tree/nvim-web-devicons", "moll/vim-bbye"}}

        -- status 状态栏展示
        use {"nvim-lualine/lualine.nvim", requires = {"nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress"}}

        -- 括号补全 depend nvim-cmp
        use {"windwp/nvim-autopairs", requires = {"hrsh7th/nvim-cmp"}}

        -- 注释
        use 'numToStr/Comment.nvim'

        -- 实时查看lua脚本的输出
        use 'rafcamlet/nvim-luapad'

        -- quick search
        use {
            'nvim-telescope/telescope.nvim',
            requires = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "stevearc/aerial.nvim"}
        }

        -- 代码高亮, 增量选择, 自动缩进等功能
        -- use {
        --     "nvim-treesitter/nvim-treesitter",
        --     run = ":TSUpdate",
        --     requires = {{"nvim-treesitter/nvim-treesitter-textobjects"}, {"nvim-treesitter/nvim-treesitter-context"}}
        -- }
        --
        -- LSP
        use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"}

        use "lukas-reineke/indent-blankline.nvim"

        -- 补全
        use {"folke/neodev.nvim", opts = {}} -- nvim lua api 补全
        use "hrsh7th/cmp-nvim-lsp" -- {name = nvim_lsp}
        use "hrsh7th/cmp-buffer" -- {name = buffer}
        use "hrsh7th/cmp-path" -- {name = path}
        use "hrsh7th/cmp-cmdline" -- {name = cmdline}
        -- use "hrsh7th/cmp-nvim-lsp-document-symbol"
        -- use "hrsh7th/cmp-nvim-lsp-signature-help" -- { name = 'nvim_lsp_signature_help' }
        use "hrsh7th/nvim-cmp" -- 补全引擎

        use "hrsh7th/cmp-vsnip"
        use {"hrsh7th/vim-vsnip", requires = {{'rafamadriz/friendly-snippets', after = 'vim-vsnip'}}} -- Snippet 引擎

        -- LSP Icons 显示代码提示图标
        use 'onsails/lspkind-nvim'

        -- LSP pretty show diagnostics, references, telescope results, quickfix and location lists
        -- use {'folke/trouble.nvim', requires = {'nvim-tree/nvim-web-devicons'}}

        use({"jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim"})

        use {"jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim"}

        -- use({
        --     'ray-x/navigator.lua',
        --     requires = {
        --         {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        --         {'neovim/nvim-lspconfig'}
        --     }
        -- })
        use 'simrat39/symbols-outline.nvim'
        -- use "mfussenegger/nvim-jdtls"
        if install_plugins then require('packer').sync() end
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
-- pcall(vim.cmd, [[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
--   ]])
