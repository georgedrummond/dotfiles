" set t_Co=256
set nocompatible              " be iMproved, required
set hidden
" set background=dark

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'dracula/vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mru.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mxw/vim-jsx'
Plugin 'reedes/vim-pencil'
Plugin 'rhysd/vim-crystal'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

"
" Stripe whitespace on save
"
autocmd BufWritePre * :%s/\s\+$//e

augroup pencil
  autocmd!
  autocmd FileType markdown,md call pencil#init({'wrap': 'hard', 'autoformat': 1})
augroup END

set guifont=Menlo\ Regular:h15
set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2
set number
set cursorline
set fillchars+=vert:\ " comment after to preserve whitespace
set hlsearch
set lazyredraw
set wildignore+=*/tmp/*,*./git*,*/node_modules/*
set conceallevel=0

color dracula

syntax enable

highlight CursorLine ctermbg=235
highlight CursorLineNR ctermbg=235
highlight Normal guibg=NONE ctermbg=NONE

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

let g:airline#extensions#tabline#enabled = 1
let g:gitgutter_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_char = '.'
let g:ctrlp_custom_ignore = 'node_modules\|plugins\|platforms\|www\/lib\|www\/dist\|vim\/bundle\|coverage\|db\/migrate'
let mapleader = "\<Space>"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$', 'coverage', 'dist', 'vendor', '\.git$']

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>

map ` :MRU<cr>
map \ :GitGutterToggle<cr>
map bd :bd<cr>
map bn :bn<cr>
map bp :bp<cr>
map bq :bufdo bd<cr>
map br :CtrlPClearCache<cr>
map tt :NERDTreeToggle<cr>
map df :Goyo<cr>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


