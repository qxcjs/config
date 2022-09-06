let mapleader = "\<space>"

" 缩写
" quit/close q, 关闭当前
" create c, 创建
" only/other o, 保留当前,关闭其它
" all a, 所有

" autocmd FileType vim setlocal commentstring="\ %s

" 光标移出时解除高亮设置
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
au WinLeave * setlocal nocursorline
au WinLeave * setlocal nocursorcolumn

" 快速打开vim配置项目 config/vim-init
noremap <expr> <leader>ov ':tabnew ' . g:vim_init_home . '/init.vim<CR>'

" 保存文件并刷新 vim 配置, :w<CR> 先保存命令, 使用 <bar> 代替 | 线, 执行 :so %<CR>
noremap <leader>so :w<CR> <bar> :so ~/.vimrc<CR>

au BufNewFile, BufRead *.py 
    \ set tabstop = 4
    \ set softtabstop = 4
    \ set shiftwidth = 4
    \ set textwidth = 79 
    \ set expandtab
    \ set autoindent
    \ set fileformat = unix

" 执行python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" autocmd: command that Vim will execute automatically on {event} (here: if you open a python file)
" [i]map: creates a keyboard shortcut to <F9> in insert/normal mode
" <buffer>: If multiple buffers/files are open: just use the active one
" <esc>: leaving insert mode
" :w<CR>: saves your file
" !: runs the following command in your shell (try :!ls)
" %: is replaced by the filename of your active buffer. But since it can contain things like whitespace and other 'bad' stuff it is better practise not to write :python %, but use:
" shellescape: escape the special characters. The 1 means with a backslash

" 删除当前文件中所有的行尾多余空格
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <c-j> <down>
noremap <c-k> <up>
noremap <c-h> <left>
noremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>

"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <del>

"----------------------------------------------------------------------
" 窗口window
"----------------------------------------------------------------------
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" 将所有分屏垂直放置
noremap srh <C-w>b<C-w>K

" 将所有分屏水平放置
noremap srv <C-w>b<C-w>H

" 上下分屏
noremap sh <C-w>t<C-w>K

" 左右分屏
noremap sv <C-w>t<C-w>H

" 移动
noremap <silent><leader>ww <C-w>w
noremap <silent><leader>wk <C-w>k
noremap <silent><leader>wj <C-w>j
noremap <silent><leader>wh <C-w>h
noremap <silent><leader>wl <C-w>l

" === 关闭 打开
" 关闭当前窗口
noremap <leader>wq <C-w>c

" 关闭其他，保留当前
noremap <leader>wo <C-w>o

" 关闭所有
noremap <leader>wa <C-w>o <bar> :q<CR>

" Resize splits with arrow keys
noremap <C-up> :res +5<CR>
noremap <C-down> :res -5<CR>
noremap <C-left> :vertical resize-5<CR>
noremap <C-right> :vertical resize+5<CR>

"----------------------------------------------------------------------
" 缓存buffer：插件 unimpaired 中定义了 [b, ]b 来切换缓存
"----------------------------------------------------------------------
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>
" 列出 buffer 列表
nnoremap <silent> <leader>bl :ls<cr>

" 打开一个新的buffer
nnoremap <silent> <leader>bc :enew<cr>

" 关闭当前 buffer
nnoremap <silent> <leader>bq :bdelete<cr>

" 重新打开关闭的buffer
" noremap <leader>xr <C-w>o


"----------------------------------------------------------------------
" 切换tab <leader>+数字键 
"----------------------------------------------------------------------
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>


"----------------------------------------------------------------------
" 切换 tab ALT+N  ALT 可以缩写为 <A- 或 <M-
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>

"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>to :tabonly<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>

" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
