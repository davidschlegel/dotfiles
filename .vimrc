" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Many of the python relted configurations are described in
" https://realpython.com/vim-and-python-a-match-made-in-heaven/





" Handle vundle plugins:
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'vim-latex/vim-latex'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required







" set utf8 encoding
set encoding=utf-8

" Nice for python
set modeline
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

" Enable Folding, also nice for python
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" SimpylFold view docstring in folded code
let g:SimpylFold_docstring_preview=1

" proper PEP 8 indentation for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Mark extra whitespace in python and c red
:highlight ExtraWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/

" Python CompleteMe -ensures that the auto-complete window goes away when done
" Add shortcut for gotoDefenition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Key combinations to move between split windows
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" Eneble syntax
syntax enable

" Choose colorscheme
"colorscheme solarized
" Make background transparent
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE


" Set line numbering
"set nu

" Enable filetype plugins and indentation
filetype plugin on
filetype plugin indent on



" These parameters are added to support vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"


" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:




"
" Set Latex compiler flags
"

" Not sure what this exactly does
au BufEnter *.tex set autowrite

let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p out && lualatex -output-directory=out -interaction=nonstopmode $* && mv out/$*.pdf .'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince'

" enable powerline font
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols ='fancy'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = " " 
" https://github.com/vim-airline/vim-airline/issues/1397
let g:airline_symbols.whitespace = " "
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
