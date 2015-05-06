" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

set shell=/bin/bash

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Set a mapleader
let mapleader='\'
let maplocalleader='\'

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/Vundle.vim
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-surround'
Plugin 'ardagnir/eventloop.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'ardagnir/pterosaur'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'dag/vim-fish'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mhinz/vim-startify'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'mutewinter/swap-parameters'
Plugin 'townk/vim-autoclose'
Plugin 'https://gist.github.com/3762227.git'
Plugin 'idris-hackers/idris-vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'dag/vim2hs'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'laMudri/nextlast'
Plugin 'dogrover/vim-pentadactyl'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'superbrothers/vim-vimperator'

"call vundle#end()

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

if has("filetype")
    filetype plugin indent on
else
    set smartindent
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

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
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab

set linebreak

set encoding=utf-8

imap <C-F> <C-O>diw

" Swap h, j, k & l around
set langmap=hjk;khj
" lojbo + above
set langmap+=ʃɛʒə;cehy

" Another Colemak mod
noremap <C-n> <C-y>

" Swap : and ;
nnoremap , :
nnoremap : ,
vnoremap , :
vnoremap : ,

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

let g:haddock_browser = "/usr/bin/firefox"

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
if has("autocmd")
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endif

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
