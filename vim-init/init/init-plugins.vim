"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
" Plug 实际是 github 的地址
" 格式为 : 作者名/插件名
"----------------------------------------------------------------------
" 插件，括号内为插件安装目录
call plug#begin('~/.vim/plugged')

" vim 中文文档
Plug 'yianwillis/vimcdoc'

" vim 启动界面
Plug 'mhinz/vim-startify'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'altercation/vim-colors-solarized'
" Plug 'mhinz/vim-startify'
" Plug 'morhetz/gruvbox'

" LSP 支持
Plug 'dense-analysis/ale'

call plug#end()

let g:ale_change_sign_column_color=1
let g:ale_sign_column_always=0
let g:ale_sign_error='>>'
let g:ale_sign_warning='--'

let g:ale_python_pylsp_executable = 'pylsp'
let g:ale_python_executable='python3'
let g:ale_python_flake8_executable='python3'
let g:ale_fixers={'python': ['yapf','isort']}
let g:ale_linters={'python': ['flake8']}

let g:airline#extensions#ale#enabled=1
