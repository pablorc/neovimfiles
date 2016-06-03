call plug#begin()

"Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'freeo/vim-kalisi'

"Features
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'

call plug#end()

"Airline
let g:airline_powerline_fonts= 1
let g:airline_theme='kalisi'
let g:airline#extensions#tabline#enabled = 1

"Colorscheme
colorscheme kalisi
set background=dark

"CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "Exclude files from .gitignore
let g:ctrlp_map = '<c-p>'


