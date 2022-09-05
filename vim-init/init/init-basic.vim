" 光标
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用vi兼容
set nocompatible

" tabstop, shiftwidth, textwidth
set ts=4 sw=4 tw=78 noet

" 关闭自动换行
set nowrap

" 右下角显示光标位置
set ruler

" yy直接复制到系统剪切板
set clipboard=unnamed
" 共享系统剪切板
set clipboard+=unnamedplus

" 关闭声音
set vb t_vb=

" 自动缩进
set autoindent
" set foldmethod=indent

" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout

" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 状态显示: a是active, h是hidden
" 设置hidden后在切换buffer时, 可以隐藏未保存的buffer, 如果不设置且当前buffer未保存，会在新窗口中打开buffer
set hidden

" 切换buffer时自动保存
" set autowrite

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch

"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8

	" 文件默认编码
	set fileencoding=utf-8

	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')
	syntax enable
	syntax on
endif
