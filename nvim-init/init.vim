" An IDE layer for Neovim with sane defaults. Completely free and community driven.
" https://github.com/LunarVim/LunarVim

" A Neovim config designed from scratch to be understandable
" https://github.com/LunarVim/Neovim-from-scratch
" https://www.youtube.com/watch?v=SpexCBrZ1pQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=15

" 取得本文件所在的目录
let g:nvim_init_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.g:vim_init_home.'/'.'<args>'

" 将 nvim-init 目录加入 runtimepath
exec 'set rtp+='.g:nvim_init_home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
" set rtp+=~/.vim

lua require('basic')

lua require('style')

lua require('keymaps')

lua require('plugins')
lua require("plugin-config.nvim-autopairs")
lua require("plugin-config.nvim-tree")
lua require("plugin-config.comment")
lua require("plugin-config.bufferline")
lua require("plugin-config.lualine")
lua require("plugin-config.telescope")
lua require("plugin-config.nvim-treesitter")
lua require("plugin-config.mason")
lua require("plugin-config.mason-lspconfig")

" LSP
lua require("lsp.cmp")
lua require("lsp.null-ls")

lua require("lsp.config.lua")
lua require("lsp.config.pyright")