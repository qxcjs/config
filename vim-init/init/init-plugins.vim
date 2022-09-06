"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
" Plug 实际是 github 的地址
" 格式为 : 作者名/插件名
"----------------------------------------------------------------------
" 插件，括号内为插件安装目录
call plug#begin('~/.vim/plugged')

" vim 中文文档
Plug 'yianwillis/vimcdoc'

" 注释
Plug 'tpope/vim-commentary'

" vim 启动界面
Plug 'mhinz/vim-startify'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Color Schema
" Plug 'altercation/vim-colors-solarized'
" Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

Plug 'skywind3000/vim-terminal-help'

" LSP Client 支持
" Plug 'dense-analysis/ale'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Color Schema
let g:one_allow_italics = 1 " 斜体的评论
let g:airline_theme='one'
colorscheme one

" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:airline_solarized_bg='dark'

" let g:ale_change_sign_column_color=1
" 保持侧边栏可见
" let g:ale_sign_column_always=0

" 改变错误和警告标识符
" let g:ale_sign_error='>>'
" let g:ale_sign_warning='--'

" let g:ale_python_pylsp_executable = 'pylsp'
" let g:ale_python_executable='python3'
" let g:ale_python_flake8_executable='python3'
" let g:ale_fixers={'python': ['yapf','isort']}
" let g:ale_linters={'python': ['flake8']}

" let g:airline#extensions#ale#enabled=1
