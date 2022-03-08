call plug#begin()

"
" Aesthetics
"
Plug 'ayu-theme/ayu-vim'
"Plug 'rakr/vim-two-firewatch'

"
" IDE
"
Plug 'pechorin/any-jump.vim'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-go',
  \ 'coc-solargraph',
  \ ]
"  \ 'coc-graphql',
" Plug 'preservim/nerdtree'

"
"IDE > Language servers
"
Plug 'jparise/vim-graphql'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "Before coc

"
"IDE > Front
"
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'kien/ctrlp.vim'

"
"VCS
"
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
"set background=dark " or light if you prefer the light version
" let g:two_firewatch_italics=1
" colo two-firewatch
let ayucolor="mirage" " light, mirage, dark
colo ayu

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
" nnoremap <leader>n :NERDTreeFocus<CR>
" let NERDTreeShowHidden=1

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
"
if has('nvim')
  " Escape mode in terminal
  tnoremap <esc> <c-\><c-n>
  tnoremap <c-v><esc> <esc>
endif

"----------------------------------------------------------------------------------
"------------------------------          COC          -----------------------------
"----------------------------------------------------------------------------------
"
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
"nmap <silent> gy :call CocAction('jumpTypeDefinition', 'vsplit')<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"----------------------------------------------------------------------------------
"------------------------------      COC-EXPLORER     -----------------------------
"----------------------------------------------------------------------------------
:nmap <leader>n <Cmd>CocCommand explorer<CR>
