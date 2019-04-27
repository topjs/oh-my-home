""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Fang Xiaoliang - fangxlmr <fangxlmr@foxmail.com>
"
" Sections:
"   => General
"   => VIM user interface
"   => Colors and Fonts
"   => Text, tab and intend related
"   => Visual mode related
"   => Moving between windows
"   => Spell checking
"   => Helper functions
"   => Souce extended vim script
"   => Misc
"
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

" Enable buffers hidden
set hidden


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

" Always show the status line
set laststatus=2


""""""""""""""""""""""""""""""""""""""""
" => Color and Fonts
""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

" Color scheme is defined in .plugin.vim
set background=dark

" Set color when used in Tmux
if &term == "screen"
      set t_Co=256
endif


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
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>"


""""""""""""""""""""""""""""""""""""""""
" => Moving between windows
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


""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""
" There is a Asynchronous Lint Engine plugin


""""""""""""""""""""""""""""""""""""""""
" => Helper funciton
""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
        call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""""""""""""""
" => Souce extended vim script
""""""""""""""""""""""""""""""""""""""""
" ==> Source .plugins.vim for plugins
if !empty(glob("/$HOME/.vim/.plugins.vim"))
    source /$HOME/.vim/.plugins.vim
endif

" TODO
" ==> Source filetypes.vim for language support
" ==> Python3
" Python3 support with virtual env
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Add proper PEP8 indentation support
au BufNewFile,BufRead *.py
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=79 |
            \ set expandtab |
            \ set autoindent |
            \ set fileformat=unix |
            \ set encoding=utf-8 |


""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""
" ==> Cscope config
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif


""""""""""""""""""""""""""""""""""""""""
" => All key mappings list
""""""""""""""""""""""""""""""""""""""""
" Key mappings in plugins are also listed
" here in terms of comments for checking.

" ==> Key mappings inside VIM
" Map kj to ESC
inoremap kj <ESC>

" Map E to the end of current line
noremap E $
" Map B to the begin of current line
noremap B ^

" Bash like keys for the command line
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>

" -> let mapleader=","
" -> <C-]>       : Jump to the tag underneath cursor
" -> <C-[>       : Jump back
" -> <C-T>       : Jump back
"
" -> <C-J>       : Move to downside window
" -> <C-K>       : Move to upside window
" -> <C-H>       : Move to right side window
" -> <C-L>       : Move to left side window

" ==> ctags
" Map Ctrl+[ to default Ctrl-t shortcus of tags
nnoremap <C-[> <C-T>
" Find tag files up to root recursively 
set tags=tags;/

" ==> cscope
" NOTE: cscope find command
" USAGE	:cs find {querytype} {name}
" 
" {querytype} corresponds to the actual cscope line
" interface numbers as well as default nvi commands:
" 
" 0 or s: Find this C symbol
" 1 or g: Find this definition
" 2 or d: Find functions called by this function
" 3 or c: Find functions calling this function
" 4 or t: Find this text string
" 6 or e: Find this egrep pattern
" 7 or f: Find this file
" 8 or i: Find files #including this file
" 9 or a: Find places where this symbol is assigned a value
" 
" For all types, except 4 and 6, leading white space for {name} is
" removed.  For 4 and 6 there is exactly one space between {querytype}
" and {name}.  Further white space is included in {name}.

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>a :scs find a <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-Space><C-Space>s
            \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
            \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
            \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
            \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
            \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
            \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
            \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>a
            \:vert scs find a <C-R>=expand("<cword>")<CR><CR>


" ==> Key mappings for plugins
" ===> YCM
"   -> j           : Go forwards through list
"   -> J           : Go backwards through list
"
" ===> UltiSnips
"   -> <TAB>       : Expend snips
"   -> <SHIFT-TAB> : Jump backward 
"
" ===> NERDTree
"   -> <leader>n   : NERDTree toggle 
"
" ===> Tagbar
"   -> <leader>t   : Tagbar toggle
"
" ===> CtrlSF
"   -> <leaderl>g  : 'grep' text globally
"   -> <leaderl>s  : Search current word globally
"   -> M in result window : Siwitch result window between normal view and compact view.
"
" ===> Leaderf
"   -> <leaderl>f  : Find file fuzzily and globally
"
" ===> Multi cursor select
"   -> kj          : quit multiple cursor select
"   -> <C-N>       : Select start word under cursor
"   -> <C-N>       : Select next word under cursor
"   -> <C-A>       : Select all matched word under cursor
"   -> <C-P>       : Select previous matched word under cursor
"   -> <C-X>       : Skip a matched word under cursor
"
" ===> NERDCommenter
"   -> <C-/>       : Comment
"   -> <c-\>       : Uncomment
