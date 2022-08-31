"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
" 插件，括号内为插件安装目录
call plug#begin('~/.vim/plugged')
" Plug 实际是 github 的地址
" 格式为 : 作者名/插件名
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
call plug#end()
