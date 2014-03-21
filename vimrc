" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
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

imap <C-F> <C-O>diw

" Full height
if has("gui_running")
    set lines=999
endif

" Swap h, j, k & l around
set langmap=hk,jh,kj

" Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Swap : and ;
nnoremap , :
nnoremap : ,
vnoremap , :
vnoremap : ,

" Pathogen
execute pathogen#infect()
filetype plugin indent on

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

set autochdir

let python_highlight_all=1

" Fix Y (no pun intended)
nnoremap Y y$

" Various from http://derekwyatt.org/2009/08/20/the-absolute-bare-minimum.html
set lazyredraw
set showmode
set wildmenu

" Insert single character
function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction
nnoremap <space> :<C-U>exec
            \ "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <s-space> :<C-U>exec
            \ "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
