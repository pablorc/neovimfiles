call plug#begin()
Plug 'tpope/vim-sensible'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kien/ctrlp.vim'
call plug#end()

let g:airline_powerline_fonts= 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

"CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "Exclude files from .gitignore
let g:ctrlp_map = '<c-p>'
