" general
let mapleader = ","
set encoding=utf-8
set showcmd
set cursorline
set colorcolumn=80
set relativenumber  " generally, use relative line numbers
set number  " for current row, use absolute line number
set timeoutlen=400
set ignorecase
set title
set titlestring=%F
set nowrap

" prefer spaces over tabs, four spaces per indentation
set tabstop=2
set shiftwidth=2
set et

" color theme config
colorscheme solarized
set background=dark

" hidden characters config
set listchars=tab:▸\ ,eol:¬
set nolist

" set more natural splits
set splitbelow
set splitright

" abbreviations
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

" set proper formatting to JSON file comments
autocmd FileType json syntax match Comment +\/\/.\+$+
