set nocompatible "Not vi compativle (Vim is king)

"""""""""""""
" NeoBundle "
"""""""""""""
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
"
" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" To start with:
NeoBundle 'tpope/vim-sensible'

" Github repos
NeoBundle 'Shougo/unite.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'ervandew/supertab'
NeoBundle 'godlygeek/tabular'

" Coding
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/argtextobj.vim'
NeoBundle 'tpope/vim-surround'

" Programming languages
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'klen/python-mode'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-rails'
NeoBundle 'bitc/vim-hdevtools'
NeoBundle 'vim-scripts/wikipedia.vim'
NeoBundle 'dag/vim2hs'

"filetype off
filetype plugin indent on   " required for vundle

" Disable ex mode
map Q <Nop>

"""""""""""""""""""""
" Syntax and indent "
"""""""""""""""""""""
syntax enable " Turn on syntax highligthing
set background=dark
colorscheme solarized
"let g:solarized_termcolors=16
if &diff
  " incase i want different things for vimdiff
  set background=dark
endif

set showmatch  "Show matching bracets when text indicator is over them

" tabbing:
set expandtab
set shiftwidth=2
set softtabstop=2

" folding:
set nofoldenable            " don't fold when opening new buffers

set undodir^=~/.vim/undo " For vim-sensible, keep all the undo files in the same place
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

"""""""""""
" Plugins "
"""""""""""

" For airline
let g:airline_theme='luna'
let g:airline_left_sep=''
let g:airline_right_sep=''

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Fix for funny characters
"let g:NERDTreeDirArrows=0
" Open automatically if no files specified:
"autocmd vimenter * if !argc() | NERDTree | endif

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'a'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'haskell'],
      \ 'passive_filetypes': ['scala', 'java', 'python'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scala_checkers = ['scalac']

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

" let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()
let g:syntastic_haskell_hdevtools_args = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()

" Haskell: hdevtools (cabal install hdevtools)
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" Make sure firefox is on your path
let g:haddock_browser="firefox"

" Custom command for :Ack
" Make sure ack is on your path
let g:ackprg="~/bin/ack -H --nocolor --nogroup --column"

" Tagbar
nmap <F8> :TagbarToggle<CR>

