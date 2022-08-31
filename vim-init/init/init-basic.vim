" 光标
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set clipboard=unnamed
set vb t_vb=

"高亮显示鼠标当前所在行'
set cursorline " 简写 set cul

"可高亮显示鼠标当前所在列
set cursorcolumn " 简写 set cuc

"关闭行列高亮，属性前面添加 no 即可

"光标颜色
"主题配置中可能会对光标有设置，需要讲配置放到主题配置后面，后面的会覆盖前面的
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
