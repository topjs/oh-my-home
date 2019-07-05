# oh-my-home

This repo contains scripts for auto-configuring personal development environment,
including `Vim, Tmux, zsh`, in order to forge a command line feeling like home.

## Dependencies
- Only Ubuntu is supported for now.
- Vim version should be 8.0 or higher.
- `bash` is the defaul shell to run shell scripts.
- `git` should be installed.
- `Zsh` should be installed beforehand. (optional)
- `Tmux` should be installed. (optional)

Ohter packages: vim ack tmux ctags cmake cscope build-essential cmake python3-dev clang
Install them by running:
```bash
sudo apt-get -y install -f vim ack tmux ctags cmake cscope build-essential cmake python3-dev clang
```

## Installation

Fisrt, clone the repo
```bash
git clone https://github.com/fangxlmr/oh-my-home ~
cd ~/oh-my-home
```

There are 3 modules for you to install: vim, tmux and zsh. You can choose to install
one of them or install them all at once.

### Install all modules
To insall them all, just run
```bash
./install.sh --all
```

### Install vim
Vim module has 3 levels which are `basic`, `extended` and `advanced`. The basic level
will contain only basic cofig for vim. The advanced level, of course, will have your
vim configured comprehensively. You can choose one of them to install, but I personally
recommand advanced config becuase it has the best vim for you.

To insall vim, just run
```bash
./install.sh --vim=advanced
```
Replace "advanced" to fit yourself.

### Install tmux and zsh

To install tmux and zsh, just run
```bash
./install.sh --tmux --zsh
```

## Modules

### Vim
#### Included plugins in Vim

I recommand reading documentations of these plugins for better understanding.
Each plugin extends Vim in one way or another. You can even try to make your 
own config to fit yourself.

- Auto completion
	* [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
	* [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
	* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
	* [honza/vim-snippets](https://github.com/honza/vim-snippets)

- Work with git
	* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

- User interface & Color scheme
	* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
	* [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
	* [edkolev/tmuxline.vim](https://github.com/edkolev/tmuxline.vim)
	* [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
	* [tomasr/molokai](https://github.com/tomasr/molokai)
	* [vim-scripts/phd](https://github.com/vim-scripts/phd)

- Navigation in project
	* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
	* [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
	* [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)

- Search, replace and select
	* [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
	* [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim)
	* [yggdroot/LeaderF](https://github.com/yggdroot/LeaderF)
	* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

- Misc
	* [vim-scripts/autoload_cscope.vim](https://github.com/vim-scripts/autoload_cscope.vim)
	* [w0rp/ale](https://github.com/w0rp/ale)
	* [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)


#### Key mappings list in Vim

Check .vimrc for more details.
```
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
```

## How to uninstall?

To uninstall them all, just run
```bash
cd ~/oh-my-home
./uninstall.sh --all
```
or
```bash
cd ~/oh-my-home
./uninstall.sh --module
```
and replace "module" here with "vim", "tmux" or "zsh".

NOTE: uninstall.sh doesn't remove all configuration installed above. It will
leave plugins in `$HOME/.vim/` without cleanning up.
You can uninstall them manualy using [Vundle](https://github.com/VundleVim/Vundle.vim).

## Inspired by

- [amix/vimrc](https://github.com/amix/vimrc)
- [yangyangwithgnu/use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
- [robbyrussell/oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
