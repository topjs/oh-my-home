""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => General
"   => VIM user interface
"   => Colors and Fonts
"   => Files and backups
"   => Text, tab and intend related
"   => Visual mode related
"   => Moving around, tabs and buffers
"   => Status line
"   => vimgrep searching and cope displaying
"   => Spell checking
"   => Misc
"   => Helper functions
"   => Souce extended vim script
"
"   => All key mappings list
"
"
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
" Set how many lines of history VIM has to remember
set history=500

" Define <leader>
let mapleader=","

" Enable filetype indent
filetype indent on


""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""
" Always show current positon
set ruler

" Show line number
set number

" Highlight current line
set cursorline
" set cursorcolumn

" Highlight search results
set hlsearch

" Ignore case when search
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Disable curson blinking
" Also need to disable cursor blink of console
set gcr=a:block-blinkon0


""""""""""""""""""""""""""""""""""""""""
" => Color and Fonts
""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

" Color scheme is defined in .plugin.vim
set background=dark


""""""""""""""""""""""""""""""""""""""""
" => Files and backups
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

set autoindent "Auto indent 
set smartindent "Smart indent
set cindent "C indent

set softtabstop=4
set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabls, windows and buffers
""""""""""""""""""""""""""""""""""""""""
" Smart ways to move between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" The following is also workable
"map <C-H> :wincmd h<CR>
"map <C-J> :wincmd j<CR>
"map <C-K> :wincmd k<CR>
"map <C-L> :wincmd l<CR>

" TODO config for vim tags
" Map Ctrl+[ to default Ctrl-t shortcus of tags
nnoremap <C-[> <C-T>

" Find tag files recursively to root
set tags+=tags;/

""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => Helper funciton
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => Souce extended vim script
""""""""""""""""""""""""""""""""""""""""
" Source conf for vim plugins
source /$HOME/.vim/.plugins.vim


""""""""""""""""""""""""""""""""""""""""
" => All key mappings list
"
" Key mappings in plugins are listed
" here in comments line for checking.
""""""""""""""""""""""""""""""""""""""""
" Map kj to ESC
inoremap kj <ESC>

" Map E to the end of current line
noremap E $
" Map B to the begin of current line
noremap B ^

inoremap <leader>sq ''<ESC>i
inoremap <leader>q ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>O
"inoremap if  if (){<CR>}<ESC>O
"inoremap { {}<ESC>i

" Bash like keys for the command line
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
"cnoremap <C-K> <C-U>

" ==== Key bindings inside VIM ===
" -> <C-]>       : Jump to definition
" -> <C-[>       : Jump back
" -> <C-T>       : Jump back
" -> <C-J>       : Move to downside window
" -> <C-K>       : Move to upside window
" -> <C-H>       : Move to right side window
" -> <C-L>       : Move to left side window
"
" 
" === Key bindings in plugins ====
" => YCM
"   -> j           : Go forwards through list
"   -> J           : Go backwards through list
"
" => UltiSnips
"   -> <TAB>       : Expend snips
"   -> <SHIFT-TAB> : Jump backward 
"
" => NERDTree
"   -> <leader>n   : NERDTree toggle 
"
" => Tagbar
"   -> <leader>t   : Tagbar toggle
"
" => Multi cursor select
"   -> kj          : quit multiple cursor select
"   -> <C-N>       : Select start word under cursor
"   -> <C-N>       : Select next word under cursor
"   -> <C-A>       : Select all matched word under cursor
"   -> <C-P>       : Select previous matched word under cursor
"   -> <C-X>       : Skip a matched word under cursor
"
" => Leaderf
"   -> <leaderl>f  : Find file fuzzily and globally
"
" => CtrlSF
"   -> <leaderl>g  : 'grep' text globally
"   -> <leaderl>s  : Search current word globally
"   -> M in result window : Siwitch result window between normal view and compact view.
"
