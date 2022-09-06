
" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" fzf
" let fzf_path = system('which fzf')
" set rtp+=fzf_path
set rtp+=/usr/bin/fzf

" 取得本文件所在的目录
let g:vim_init_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.g:vim_init_home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.g:vim_init_home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim

" 加载基础配置
LoadScript init/init-basic.vim

" 插件加载
LoadScript init/init-plugins.vim

" 插件配置
LoadScript plugin/vim-commentary.vim
LoadScript plugin/coc-nvim.vim
LoadScript plugin/coc-explorer.vim

" 界面样式
LoadScript init/init-style.vim

" 自定义按键
LoadScript init/init-keymaps.vim
