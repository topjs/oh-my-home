# env-autoconf

This repo contains scripts for auto-configuring personal development environment,
including `Vim, Tmux`.

## Dependencies

### Host OS

Only Ubuntu is supported for now.

### Vim

Vim version should be 8.0 or higher.

### Shell

`bash` is the defaul shell to run shell scripts.


## How to install?

You may want to update package information before installation by doing
`sudo apt-get update`.

To install, simply run the following shell commands in your terminal:
```bash
git clone https://github.com/fangxlmr/autoconf ~
~/autoconf/install.sh
```

This may take a while if you install it first time becuase there are a number
of plugins to be download and installed.


## Included plugins in Vim

I recommand reading documentations of these plugins for better understanding.
Each plugin extends Vim in one way or another. You can even try to make your 
own config to fit yourself.

- Auto completion
	* [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
	* [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)
	* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
	* [honza/vim-snippets](https://github.com/honza/vim-snippets)

- Work with git
	* [tpope/vim-fugitive](https://github.com/honza/vim-snippets)

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


## Key mappings list in Vim

Some critical and often used key mappings are listed here. You can check
`vimrc` for more details on key mappings.
```
" Map kj to ESC
inoremap kj <ESC>

" Map E to the end of current line
noremap E $
" Map B to the begin of current line
noremap B ^

" Bash like keys for the command line
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>

let mapleader=","
<C-]>       : Jump to the tag underneath cursor
<C-[>       : Jump back
<C-T>       : Jump back

" Move between windows rapidly
<C-J>       : Move to downside window
<C-K>       : Move to upside window
<C-H>       : Move to right side window
<C-L>       : Move to left side window

" YouCompleteMe
j           : Go forwards through list
J           : Go backwards through list

" UltiSnips
<TAB>       : Expend snips
<SHIFT-TAB> : Jump backward

" NERDTree
<leader>n   : NERDTree toggle

" Tagbar
<leader>t   : Tagbar toggle

" CtrlSF
<leaderl>g  : 'grep' text globally
<leaderl>s  : Search current word globally
M in result window : Siwitch result window between normal view and compact view.

" Leaderf
<leaderl>f  : Find file fuzzily and globally

" Multi cursor select
kj          : quit multiple cursor select
<C-N>       : Select start word under cursor
<C-N>       : Select next word under cursor
<C-A>       : Select all matched word under cursor
<C-P>       : Select previous matched word under cursor
<C-X>       : Skip a matched word under cursor

" NERDCommenter
<C-/>       : Comment
<c-\>       : Uncomment
```


## How to uninstall?

Just do the follwing:
```bash
# cd to the directory and run:
./uninstall.sh
```
NOTE: uninstall.sh doesn't remove all configuration installed above. It will
leave plugins in `$HOME/.vim/` without cleanning up.
You can uninstall them manualy using [Vundle](https://github.com/VundleVim/Vundle.vim).


## Inspired by

- [amix/vimrc](https://github.com/amix/vimrc)
- [yangyangwithgnu/use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)
