""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""

let NERDTreeIgnore=['\.DS_Store', '\.netrwhist']
let NERDTreeShowHidden=1

" Close NERDTree when leaving the tab holding its buffer
autocmd TabLeave NERD_tree* NERDTreeClose


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify (VCS diff indication)
" 
"""

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC and its extensions
" 
" NOTE: Key bindings are in keys.vim
"""

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-python',
  \ 'coc-prettier',
  \ 'coc-svg',
  \ 'coc-snippets'
  \ ]

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
if exists('g:plug_home') && isdirectory(g:plug_home . '/coc.nvim')
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
else
  echom 'WARNING: Can''t use coc.nvim as part of statusline that plugin doesn''t appear to be installed'
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags
"""

let g:gutentags_ctags_executable='/usr/local/bin/ctags'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
