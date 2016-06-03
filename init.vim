call plug#begin()

"Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'freeo/vim-kalisi'

"Features
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-dispatch'

call plug#end()

let mapleader = "ñ"
set number

"Airline
let g:airline_powerline_fonts= 1
let g:airline_theme='kalisi'
let g:airline#extensions#tabline#enabled = 1

"Colorscheme
colorscheme kalisi
set background=dark

"CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "Exclude files from .gitignore
map <leader>t :CtrlP<CR>

"Neomake
autocmd! BufWritePost,BufEnter * Neomake

"Nerdtree & Nerdtree-tabs
silent! nmap <silent> <Leader>p <plug>NERDTreeTabsToggle<CR>
