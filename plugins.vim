set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" => YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" => Work with git
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" => Ultisnips and snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Handle tab conflict with YCM
"Plugin 'ervandew/supertab'

" => Color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'

" => VIM user interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" => Navigation tree
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'

" => Tagbar to list all tags
Plugin 'majutsushi/tagbar'

" => Search and replace
Plugin 'mileszs/ack.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'yggdroot/leaderf', { 'do': './install.sh' }

" VIM marks
Plugin 'kshenoy/vim-signature'

" => Multiple line selector
Plugin 'terryma/vim-multiple-cursors'

" Autoload cscope
Plugin 'vim-scripts/autoload_cscope.vim'

" No use plugin so far
" Copy from https://github.com/yangyangwithgnu/use_vim_as_ide#2-%E6%8F%92%E4%BB%B6%E7%AE%A1%E7%90%86
"
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""
" => YCM
""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['j', '<Down>']
let g:ycm_key_list_previous_completion = ['J', '<Up>']
let g:ycm_confirm_extra_conf = 1
" make YCM compatible with UltiSnips (using supertab)
"let g:SuperTabDefaultCompletionType = '<C-N>'


""""""""""""""""""""""""""""""""""""""""
" => nerdtree git plugin
""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✚",
    \ "Staged"    : "✹",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" Start NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""
" => tarbar
""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :TagbarToggle<CR>
" Move cursor to tagbar window automatically
let g:tagbar_autofocus=1


""""""""""""""""""""""""""""""""""""""""
" => Color scheme
""""""""""""""""""""""""""""""""""""""""
silent! colorscheme solarized
"silent! colorscheme molokai
"silent! colorscheme phd


""""""""""""""""""""""""""""""""""""""""
" => vim-airline
""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'
"let g:airline_solarized_bg='dark'
"let g:airline_left_sep=''
"let g:airline_right_sep=''


""""""""""""""""""""""""""""""""""""""""
" => vim multiple cursors
""""""""""""""""""""""""""""""""""""""""
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
" => CtrlSF
""""""""""""""""""""""""""""""""""""""""
" Search word under the cursor globally
nnoremap <leader>s :CtrlSF<CR>
" Show command line for 'grep'
nmap <leader>g <Plug>CtrlSFPrompt
" If want to switch result window between normal view and compact view,
" Press M in result window

""""""""""""""""""""""""""""""""""""""""
" => Leaderf for replacing CtrlP
""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<leader>f'

" Change the highlight of matched string
highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201
