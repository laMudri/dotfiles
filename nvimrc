" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

"set shell=/bin/bash

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Set a mapleader
let mapleader='\'
let maplocalleader='\'

" Fix backspace
set backspace=eol,indent,start

" Show line/column numbers
set ruler

" Vundle
set nocompatible
filetype off

set rtp+=~/.nvim/Vundle.vim
set rtp+=~/.nvim/vundle
call vundle#begin('~/.nvim/vundle/')

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'ardagnir/eventloop.vim'
"Plugin 'eagletmt/ghcmod-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'ardagnir/pterosaur'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'dag/vim-fish'
Plugin 'hynek/vim-python-pep8-indent'
"Plugin 'mhinz/vim-startify'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'mutewinter/swap-parameters'
Plugin 'townk/vim-autoclose'
Plugin 'https://gist.github.com/3762227.git'
Plugin 'idris-hackers/idris-vim'
Plugin 'jgdavey/tslime.vim'
"Plugin 'dag/vim2hs'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'laMudri/nextlast'
Plugin 'dogrover/vim-pentadactyl'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'LnL7/vim-nix'
Plugin 'superbrothers/vim-vimperator'
Plugin 'Shougo/neocomplete'
Plugin 'osyo-manga/vim-over'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set autoindent
set smartindent
set softtabstop=-2  " use shiftwidth
set shiftwidth=2
set expandtab

set linebreak

set encoding=utf-8

imap <C-F> <C-O>diw

set langnoremap
" Swap h, j, k & l around
set langmap+=hj;jh
" Swap : with ,
set langmap+=\\,:;:\\,
" lojbo
set langmap+=ʃɛʒə;cehy

" Another Colemak mod
noremap <C-n> <C-y>

" Omni completion
set omnifunc=syntaxcomplete#Complete

" Pathogen
"execute pathogen#infect()

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Shortcuts for paste buffers
map <F8> "+
map <F9> "*
map <F10> "_

" Very magic
cnoremap s/ s/\v
cnoremap g/ g/\v
cnoremap g!/ g!/\v
" Very nomagic
cnoremap s@ s@\V
cnoremap g@ g@\V
cnoremap g!@ g!@\V
nnoremap / /\V
nnoremap ? ?\V

" Breaks vimshell
"set autochdir

let python_highlight_all=1

" Fix Y (no pun intended)
nnoremap Y y$

" Various from http://derekwyatt.org/2009/08/20/the-absolute-bare-minimum.html
set lazyredraw
set showmode
set wildmenu

set relativenumber
set numberwidth=3

" Insert single character
"function! RepeatChar(char, count)
"    return repeat(a:char, a:count)
"endfunction
"nnoremap <space> :<C-U>exec
"            \ "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
"nnoremap <c-space>h :<C-U>exec
"            \ "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <space> i <esc>r
nnoremap <c-space> a <esc>r
"nnoremap <s-space>h :<C-U>exec
"            \ "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <space> i <esc>r
nnoremap <s-space> a <esc>r

let g:haskell_indent_if = 3
let g:haskell_indent_case = 5

let g:haddock_browser = "firefox"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
if has("autocmd")
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
endif

highlight Tab ctermbg=darkgreen guibg=darkgreen
match Tab /\t/

hi clear Conceal

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set whichwrap+=<,>,h,l,[,]

set hlsearch
nnoremap <silent> <CR> :noh<CR>
nnoremap <C-8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" surround.vim
xmap s   <Plug>VSurround
xmap gs  <Plug>VgSurround

let g:ycm_semantic_triggers = {'haskell': ['.']}

" Fixes YCM/vim-autoclose issue
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" Highlighting
au BufNewFile,BufRead *.cml set filetype=sml
au BufNewFile,BufRead *.pro set filetype=prolog

set modeline

" neovim-specific
if has('nvim')
  "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
