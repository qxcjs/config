"vim-commentary
"gcc     注释当前行（普通模式）或者取消注释当前行
"gc      可视模式下，注释当前选中的部分，或者取消当前选中部分的注释
"gcu     撤销上一次注释的部分，可以是一行也可以是多行
"gcgc    撤销注释当前行和邻近的上下两行

"为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,php,go,c,cpp set commentstring=//\ %s
