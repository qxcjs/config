" Use <Space-E> to open explorer
nmap <leader>e :CocCommand explorer<CR>

" Close Coc-explorer if it is the only window
autocmd BufEnter * if (&ft == 'coc-explorer' && winnr("$") == 1) | q | endif
