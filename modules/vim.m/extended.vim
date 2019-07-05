""""""""""""""""""""""""""""""""""""""""
" Filename:
"   extended.vim
"   This file contains the extended configuration of Vim.
"       
" Maintainer:
"   Fang Xiaoliang - fangxlmr <fangxlmr@foxmail.com>
"
" Sections:
"   => General
"   => VIM user interface
"   => Text, tab and indentation related
"   => Visual mode related
"   => Moving between windows
"   => Spell checking
"   => Helper functions
"   => Misc
"
"   => Souce other vim scripts
"   => Extended key mappings list
"   => All key mappings list
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
" Enable buffers hidden
set hidden


""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""
" Highlight current line
set cursorline

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Disable cursor blinking
" Also need to disable cursor blink of console
set gcr=a:block-blinkon0

" Always show the status line
set laststatus=2

" Color scheme is defined in .plugin.vim
set background=dark


""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""
"C style indentation
set cindent


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
" => Helper funcitons
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
" => Misc
""""""""""""""""""""""""""""""""""""""""
" Find tag files up to root recursively 
set tags=tags;/

" Cscope config
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
" => Souce other vim scripts
""""""""""""""""""""""""""""""""""""""""
" Source .plugins.vim if it exists.
let s:plugins_vim = "/$HOME/.vim/.plugins.vim"
if !empty(glob(s:plugins_vim))
    execute "source" s:plugins_vim
endif


""""""""""""""""""""""""""""""""""""""""
" => Extended key mappings list
""""""""""""""""""""""""""""""""""""""""
" Bash like keys for the command line
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>

" Map Ctrl+[ to default Ctrl-t shortcus of tags
nnoremap <C-[> <C-T>


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
" " Map Ctrl+[ to default Ctrl-t shortcus of tags
" nnoremap <C-[> <C-T>
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
