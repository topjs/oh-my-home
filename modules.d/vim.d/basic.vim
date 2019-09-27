""""""""""""""""""""""""""""""""""""""""
" Filename:
"   basic.vim
"   This file contains the basic configuration of Vim.
"       
" Maintainer:
"   Fang Xiaoliang - fangxlmr <fangxlmr@foxmail.com>
"
" Sections:
"   => General
"   => VIM user interface
"   => Text, tab and indentation related
"
"   => Souce other vim scripts
"   => Basic key mappings list
"   => All key mappings list
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
" Set how many lines of history VIM has to remember
set history=500

" Define <leader>
let mapleader=","

" Enable filetype plugin and indent
filetype plugin indent on

" Enable mouse operation
set mouse=a


""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

" Always show current positon
set ruler

" Show line number
set number

" Highlight search results
set hlsearch

" Ignore case when search
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Set color when used in Tmux
if &term == "screen"
      set t_Co=256
endif

set background=dark


""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indentation related
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

set softtabstop=4
set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""""
" => Souce other vim scripts
""""""""""""""""""""""""""""""""""""""""
" Source .extended.vim if it exists.
let s:extended_vim = "/$HOME/.vim/.extended.vim"
if !empty(glob(s:extended_vim))
    execute "source" s:extended_vim
endif


""""""""""""""""""""""""""""""""""""""""
" => Basic key mappings list
""""""""""""""""""""""""""""""""""""""""
" Map kj to ESC
inoremap kj <ESC>

" Map E to the end of current line
noremap E $
" Map B to the begin of current line
noremap B ^


""""""""""""""""""""""""""""""""""""""""
" => All key mappings list
""""""""""""""""""""""""""""""""""""""""
" This section collects all key mappings defined in
" basic.vim (i.e. .vimrc), extended.vim and pluings.vim
" to facilitate the inquiry at a later time.
"
" All key mappings are listed in order of files. That is
" to say "Basic key mappings" subsection lists all key
" mappings defined in basic.vim and "Extended key mappings"
" subsection lists all key mappings defined in extended.vim
" while "Advanced key mappings" lists all key mappsing
" defined in plugins.vim.
"
"
" ==> Basic key mappings
"
" " Define <leader>
" let mapleader=","
"
" " Map kj to ESC
" inoremap kj <ESC>
"
" " Map E to the end of current line
" noremap E $
" " Map B to the begin of current line
" noremap B ^
" 
"
" ==> Extended key mappings
"
" " Smart ways to move between windows
" nnoremap <C-J> <C-W>j
" nnoremap <C-K> <C-W>k
" nnoremap <C-H> <C-W>h
" nnoremap <C-L> <C-W>l
"
" " Bash like keys for the command line
" cnoremap <C-A> <HOME>
" cnoremap <C-E> <END>
"
"
" ==> Advanced key mappings
"
" ===> YouCompleteMe
" let g:ycm_key_list_select_completion = ['j', '<Down>']
" let g:ycm_key_list_previous_completion = ['J', '<Up>']
"
" ===> UltiSnips
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"
" ===> NERDTree
" map <leader>n :NERDTreeToggle<CR>
"
" ===> tagbar
" nmap <leader>t :TagbarToggle<CR>
"
" ===> CtrlSF
" " Search word under the cursor globally
" nnoremap <leader>s :CtrlSF<CR>
" " Show command line for 'grep'
" nmap <leader>g <Plug>CtrlSFPrompt
"
" ===> vim multiple cursors
" let g:multi_cursor_start_word_key      = '<C-N>'
" let g:multi_cursor_select_all_word_key = '<C-A>'
" let g:multi_cursor_start_key           = 'g<C-N>'
" let g:multi_cursor_select_all_key      = 'g<C-A>'
" let g:multi_cursor_next_key            = '<C-N>'
" let g:multi_cursor_prev_key            = '<C-P>'
" let g:multi_cursor_skip_key            = '<C-X>'
" let g:multi_cursor_quit_key            = 'kj'
"
" ===> NERDCommenter
" " Use Ctrl+/ to comment and Ctrl-\ to uncomment.
" " Vim registers <C-/> as <C-_> for some reason.
" map <C-_> <plug>NERDCommenterComment
" map <C-\> <plug>NERDCommenterUncomment
