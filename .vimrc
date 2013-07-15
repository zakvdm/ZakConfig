set nocompatible "Not vi compativle (Vim is king)

""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

" To start with:
Bundle 'tpope/vim-sensible'

" Github repos
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-eunuch'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'

" Coding
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'tpope/vim-surround'

" Programming languages
Bundle 'derekwyatt/vim-scala'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-markdown'

filetype off
filetype plugin indent on   " required for vundle

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

set expandtab
set shiftwidth=2
set softtabstop=2


"""""""""""
" Plugins "
"""""""""""

" For vim-sensible, keep all the undo files in the same place
set undodir^=~/.vim/undo

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Fix for funny characters
"let g:NERDTreeDirArrows=0

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'a'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['python', 'ruby'],
            \ 'passive_filetypes': ['scala', 'java'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_scala_checkers = ['scalac']
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '/home/zakv/dev/software/checkstyle/checkstyle-5.6-all.jar'
let g:syntastic_java_checkstyle_conf_file = '/home/zakv/dev/software/checkstyle/sun_checks.xml'

" Custom command for :Ack
let g:ackprg="/home/zakv/dev/software/ack-2.04-single-file -H --nocolor --nogroup --column"

" Tagbar
nmap <F8> :TagbarToggle<CR>

