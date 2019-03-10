set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" ultisnips
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

" Search and replace
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'

" VIM marks
Plugin 'kshenoy/vim-signature'

Plugin 'majutsushi/tagbar'

Plugin 'terryma/vim-multiple-cursors'
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

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
" make YCM compatible with UltiSnips (using supertab)
""let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
""let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion = ['j', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" NERDTree
map <leader>n :NERDTreeToggle<CR>

" tarbar
nmap <leader>t :TagbarToggle<CR>

" Color scheme
colorscheme solarized
"colorscheme molokai
"colorscheme phd

" vim-airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
"let g:airline_left_sep=''
"let g:airline_right_sep=''

" vim multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = 'kj'

let g:multi_cursor_normal_maps={'@': 1, 'F': 1, 'T': 1, '[': 1, '\': 1, ']': 1, '!': 1, '"': 1, 'c': 1, 'd': 1, 'f': 1, 'g': 1, 'm': 1, 'q': 1, 'r': 1, 't': 1, 'y': 1, 'z': 1, '<': 1, '=': 1, '>': 1}
let g:multi_cursor_visual_maps={'T': 1, 'a': 1, 't': 1, 'F': 1, 'f': 1, 'i': 1, ',' : 1, 'k' : 1, 'j' : 1, 'd' : 1}


" CtrlSF
nnoremap <leader>s :CtrlSF<CR>
