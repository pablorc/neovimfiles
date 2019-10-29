call plug#begin()

"Aesthetics
" Plug 'rakr/vim-two-firewatch'
Plug 'arcticicestudio/nord-vim'

"IDE
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Other features

call plug#end()

"----------------------------------------------------------------------------------
"---------------------------     BASE CONFIGURATION     ---------------------------
"----------------------------------------------------------------------------------
let mapleader = "ñ"
set number

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

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

set mouse=a

" Regexps
noremap <Leader>r :%s:::g<Left><Left><Left>

" Colorscheme
colorscheme nord

"----------------------------------------------------------------------------------
"---------------------------    PLUGIN CONFIGURATION    ---------------------------
"----------------------------------------------------------------------------------

"-------------------------------------- FZF --------------------------------------
set rtp+=~/.fzf " Add fzf
nnoremap <leader>f :FZF<CR>
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"----------------------------------------------------------------------------------
"---------------------------            RUBY            ---------------------------
"----------------------------------------------------------------------------------

" Run rubocop on save .rb file
autocmd BufWritePost *.rb silent execute "!rubocop -a %"

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

