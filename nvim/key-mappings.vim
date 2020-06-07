""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""

" Save current buffer
nmap <Leader>w :w<CR>

" Quit current buffer
nmap <Leader>q :q<CR>

" Save and quit current buffer
nmap <Leader>x :x<CR>

" Edit file (or re-read current file)
nmap <Leader>e :edit<space>

" Open new empty tab
nmap <Leader>tn :tabnew<CR>

" Open file in a new tab
nmap <Leader>te :tabedit<space>

" Remove search highlighting
nmap <Leader>/ :noh<CR>

" Abbreviations, for sanity
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Show/hide hidden characters
nmap <Leader>l :set list!<CR>
" Reload Vim config
"   1. Source the primary Vim config file
"   2. Install plugins
"   3. Update COC (code intellisense) extensions to the latest version
nnoremap <Leader>r :so $MYVIMRC<CR>:PlugInstall<CR>:q<CR>:PlugClean<CR>:q<CR>:CocUpdateSync<CR>:so $MYVIMRC<CR><C-o>:sleep 1000m<CR>:echo "Vim config reloaded"<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""

" Toggle NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" Reveal current file in NERDTree
nmap <Leader>f :NERDTreeFind<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf - fuzzy finder (`:h fzf` for help)
"""

" Open fuzzy finder, quick-open file
nnoremap <C-p> :Files<CR>

" Use Esc to kill the fzf buffer (https://github.com/junegunn/fzf.vim/issues/544)
" - Disabling this for now since it's clearly not working (getting
"   occasional errors causing fzf to sort-of crash)
"au * tnoremap <buffer> <Esc> <c-\><c-n>
"au FileType fzf tunmap <buffer> <Esc>

" Open fzf's buffer view
nnoremap <Leader>b :Buffers<CR>

" Open fzf's history view
nnoremap <Leader>h :History<CR>
" Open fzf's view of tags in current project

nnoremap <Leader>t :Tags<CR>
" Open fzf's view of tags in buffer
nnoremap <Leader>T :BTags<CR>

" Global search in current project
"nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>s :Rg<space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC (code intellisense)
"""

function! s:showDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add `:Prettier` command to format files
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>showDocumentation()<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <CR> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  " NOTE: Notice the double quotes!
  inoremap <expr> <cr> complete_info()['selected'] != '-1' ? "\<C-y>" : "\<C-g>u\<CR>"
else
  " NOTE: Notice the double quotes!
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code.
" NOTE: Disabled for now since it's interfering with current mapping for NERDTree
"xmap <Leader>f  <Plug>(coc-format-selected)
"nmap <Leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <Leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE:
"   Requires 'textDocument/selectionRange' support from the language server.
"   coc-tsserver, coc-python are the examples of servers that support it.
" NOTE: Disabled for now since it's interfering with default mapping <C-i>
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Disable and re-enable CoC,
" effectively getting rid of some of its lingering floating windows
nmap <Leader>cc :CocDisable<CR>:CocEnable<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
