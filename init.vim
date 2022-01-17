call plug#begin()

"Aesthetics
Plug 'rakr/vim-two-firewatch'

"IDE
Plug 'preservim/nerdtree'
Plug 'pechorin/any-jump.vim'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mileszs/ack.vim'
"Plug 'kien/ctrlp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

"VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

"----------------------------------------------------------------------------------
"---------------------------     BASE CONFIGURATION     ---------------------------
"----------------------------------------------------------------------------------
let mapleader = "ñ"

" Remove whitespaces after save
autocmd BufWritePre * :%s/\s\+$//e

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai                    " Auto indent
set si                    " Smart indent
set wrap                  " Wrap lines
set mouse=a               " Mouse
set number relativenumber " Hybrid relative line numbers

" Regexps
noremap <Leader>r :%s:::g<Left><Left><Left>

" Colorscheme
set termguicolors
set background=dark " or light if you prefer the light version
let g:two_firewatch_italics=1
colo two-firewatch

set diffopt=vertical

"----------------------------------------------------------------------------------
"---------------------------    PLUGIN CONFIGURATION    ---------------------------
"----------------------------------------------------------------------------------

"-------------------------------------- FZF --------------------------------------
set rtp+=~/.fzf " Add fzf
nnoremap <leader>f :FZF<CR>
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }


"------------------------------------ NERDTREE ------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>

"-------------------------------------- ACK ---------------------------------------
let g:ackprg = 'ag --nogroup --nocolor --column'

"----------------------------------------------------------------------------------
"---------------------------            RUBY            ---------------------------
"----------------------------------------------------------------------------------

" Run rubocop on save .rb file
" autocmd BufWritePost *.rb silent execute "!rubocop -a %"

"----------------------------------------------------------------------------------
"---------------------------           DOCKER           ---------------------------
"----------------------------------------------------------------------------------

" Execute rspec on current file
nnoremap <leader>c :tabnew % \| te docker-compose run web bash<cr>

"----------------------------------------------------------------------------------
"---------------------------          TERMINAL          ---------------------------
"----------------------------------------------------------------------------------

if has('nvim')
  " Escape mode in terminal
  tnoremap <esc> <c-\><c-n>
  tnoremap <c-v><esc> <esc>
endif

