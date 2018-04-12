" #################### Plug Settings ###########################################

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" FZF Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Airline status bar
Plug 'vim-airline/vim-airline'
" Vim theme
Plug 'dikiaap/minimalist'
" Better scrolling
Plug 'yuttie/comfortable-motion.vim'
" Better syntax hilighting
Plug 'sheerun/vim-polyglot'

call plug#end()

" #################### VIM settings ############################################

inoremap jj <Esc>
nnoremap ; :

set noswapfile
set backspace=indent,eol,start
set buftype: " "
set number
set wrap!
set mouse =a
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set clipboard=unnamed
set nocompatible
set noshowmode

filetype plugin on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" #################### Extra commands ##########################################

nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>G :!git add %
vnoremap // y/<C-R>"<CR>

command Gitgui execute "!git gui"

" #################### Basic Code editor settings ##############################

syntax on

highlight ColorColumn ctermbg=3

set tabstop =4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

nnoremap <leader>p :setf php<cr>

" #################### Theme settings ##########################################

set guifont=Hack\ Regular:h8
set colorcolumn=80,120

try
    colorscheme minimalist
catch
endtry

:if has('gui_running')
    set transparency=10
:endif

" #################### Wild Menu ###############################################

set wildmode=longest:full,list
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set omnifunc=syntaxcomplete#Complete

" #################### Status Bar ##############################################

let g:TerminusFocusReporting=0

try
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:airline_theme='minimalist'

catch
endtry

" #################### Resize tab keyboard shortcuts ###########################

nnoremap <leader>k :res +10<cr>
nnoremap <leader>j :res -10<cr>
nnoremap <leader>l :vertical resize +5<cr>
nnoremap <leader>h :vertical resize -5<cr>

" #################### FZF Settings ############################################

let g:fzf_launcher = "~/.vim/iterm %s"

map <leader>t :FZF<cr>
map <leader>f :Files<cr>

" #################### Importing extra files ###################################

try
    source $HOME/.vimrcExtra
catch
endtry