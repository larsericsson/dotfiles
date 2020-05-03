nmap <leader>l :set list!<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>T :BTags<CR>
nnoremap <leader>s :Rg<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Reload Vim config
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:q<CR>:CocUpdateSync<CR>

" enable "regular" way of returning to NORMAL mode from TERMINAL mode
autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>

" kill fzf using Esc key
autocmd FileType fzf tunmap <buffer> <Esc>
