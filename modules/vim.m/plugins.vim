""""""""""""""""""""""""""""""""""""""""
" Filename:
"   plugins.vim
"   This file contains the Vim plugins and their configuration.
"       
" Maintainer:
"   Fang Xiaoliang - fangxlmr <fangxlmr@foxmail.com>
"
" Sections:
"   => Auto completion
"   => Work with git
"   => User interface & Color scheme
"   => Navigation in project
"   => Search, replace and multi-select
"   => Other
"
"   => Advanced key mappings list
"   => All key mappings list
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" Plugins installed via Vundle are listed below.

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""
" => Auto completion
""""""""""""""""""""""""""""""""""""""""
" Code auto-completion
Plugin 'ycm-core/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'

" Code snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Rust-lang support
Plugin 'rust-lang/rust.vim'


""""""""""""""""""""""""""""""""""""""""
" => Work with git
""""""""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'


""""""""""""""""""""""""""""""""""""""""
" => User interface & Color scheme
""""""""""""""""""""""""""""""""""""""""
" Vim interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Vim color scheme
Plugin 'altercation/vim-colors-solarized'

" Tmux interface
Plugin 'edkolev/tmuxline.vim'


""""""""""""""""""""""""""""""""""""""""
" => Navigation in project
""""""""""""""""""""""""""""""""""""""""
" Side navigation bar
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" VIM marks
Plugin 'kshenoy/vim-signature'


""""""""""""""""""""""""""""""""""""""""
" => Search, replace and multi-select
""""""""""""""""""""""""""""""""""""""""
Plugin 'mileszs/ack.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'yggdroot/LeaderF', { 'do': './install.sh' }
Plugin 'terryma/vim-multiple-cursors'


""""""""""""""""""""""""""""""""""""""""
" => Other
""""""""""""""""""""""""""""""""""""""""
" Autoload cscope
Plugin 'vim-scripts/autoload_cscope.vim'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'

" Easy commenter
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugins installed via Vundle are listed above.
""""""""""""""""""""""""""""""""""""""""


""" Configs for each plugins are listed below.

""""""""""""""""""""""""""""""""""""""""
" => Auto completion
""""""""""""""""""""""""""""""""""""""""
" ==> YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['j', '<Down>']
let g:ycm_key_list_previous_completion = ['J', '<Up>']
let g:ycm_confirm_extra_conf = 1

" ==> UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/ycm-core/YouCompleteMe.
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""
" => Work with git
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
" => User interface & Color scheme
""""""""""""""""""""""""""""""""""""""""
" ==> vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
"let g:airline_solarized_bg='dark'
"let g:airline_left_sep=''
"let g:airline_right_sep=''

"silent! colorscheme solarized


""""""""""""""""""""""""""""""""""""""""
" => Navigation in project
""""""""""""""""""""""""""""""""""""""""
" ==> NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" Start NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ==> tagbar
nmap <leader>t :TagbarToggle<CR>
" Move cursor to tagbar window automatically
let g:tagbar_autofocus=1


""""""""""""""""""""""""""""""""""""""""
" => Search, replace and multi-select
""""""""""""""""""""""""""""""""""""""""
" ==> CtrlSF
" Search word under the cursor globally
nnoremap <leader>s :CtrlSF<CR>
" Show command line for 'grep'
nmap <leader>g <Plug>CtrlSFPrompt
" If want to switch result window between normal view and compact view,
" Press M in result window

" ==> Leaderf for replacing CtrlP
let g:Lf_ShortcutF = '<leader>f'

" Change the highlight of matched string
highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

" ==> vim multiple cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-N>'
let g:multi_cursor_select_all_word_key = '<C-A>'
let g:multi_cursor_start_key           = 'g<C-N>'
let g:multi_cursor_select_all_key      = 'g<C-A>'
let g:multi_cursor_next_key            = '<C-N>'
let g:multi_cursor_prev_key            = '<C-P>'
let g:multi_cursor_skip_key            = '<C-X>'
let g:multi_cursor_quit_key            = 'kj'


""""""""""""""""""""""""""""""""""""""""
" => Other
""""""""""""""""""""""""""""""""""""""""
" ==> ale
let g:airline#extensions#ale#enabled = 1

" ==> NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Use Ctrl+/ to comment and Ctrl-\ to uncomment.
" Vim registers <C-/> as <C-_> for some reason.
map <C-_> <plug>NERDCommenterComment
map <C-\> <plug>NERDCommenterUncomment


""""""""""""""""""""""""""""""""""""""""
" => Advanced mappings list
""""""""""""""""""""""""""""""""""""""""
" This advanced vim script contains all plugins for vim.
" Each plugin has it's own configuration so that no
" key mappings is listed here on purpose.
"
" You can check out "All key mapping list" section below
" for more details.


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
