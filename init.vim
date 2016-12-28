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
Plug 'pablorc/vim-karma'
Plug 'terryma/vim-multiple-cursors'

"Syntax
Plug 'mustache/vim-mustache-handlebars'

"Plug 'Townk/vim-autoclose'
"Plug 'tpope/vim-surround'
"Plug 'jeetsukumaran/vim-buffergator'

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

map <Leader>kt :call RunCurrentSpecFile()<CR>
map <Leader>ks :call RunNearestSpec()<CR>
map <Leader>ka :call RunAllSpecs()<CR>

"Remove whitespaces after save
autocmd BufWritePre * :%s/\s\+$//e

"Use spaces instead of tabs
set expandtab

"Be smart when using tabs
set smarttab

"1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

"Linebreak on 500 characters
set lbr
set tw=500

"Auto indent
set ai

"Smart indent
set si

"Wrap lines
set wrap
