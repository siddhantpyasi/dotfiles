" Here's a vimrc file for the system vim located at /usr/bin/vim
" Let's hope it works.
" Author: Siddhant Pyasi
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " Let Vundle manage itself
    Plugin 'gmarik/Vundle.vim'
    " Easy alignment
    Plugin 'junegunn/vim-easy-align'
    " Clangd
    "    Plugin 'Chilledheart/vim-clangd'
    " Completion
    Plugin 'maralla/completor.vim'
    " Minimap
    Plugin 'severin-lemaignan/vim-minimap'
    " Nerdtree
    Plugin 'scrooloose/nerdtree'
    " Wakatime
    Plugin 'wakatime/vim-wakatime'
    " Airline theme
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    " Autopair 
    Plugin 'jiangmiao/auto-pairs' 
    " Python Syntax
    Plugin 'hdima/python-syntax'
    " C Syntax
    Plugin 'NLKNguyen/c-syntax.vim'
    " Markdown highlighting
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
call vundle#end()

" Minimap 
"let g:minimap_highlight='markdownLinkText'

"autocmd! VimEnter * Minimap

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

set errorbells

set bs=indent,eol,start		" Allow backspacing over all these in insert mode
set viminfo='20,"80		" read/write a .viminfo file, no more than 80 registers
set history=80		" keep 80 lines of command line history

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set t_Co=256

let g:PaperColor_Theme_Options = {
            \   'theme': {
            \     'default.dark': { 
            \       'override' : {
            \         'color00' : ['#011827', ''],
            \         'linenumber_bg' : ['#011827', '']
            \       }
            \     }
            \   },
            \   'language': {
            \     'python': {
            \       'highlight_builtins' : 1
            \     },
            \     'cpp': {
            \       'highlight_standard_library': 1
            \     },
            \     'c': {
            \       'highlight_builtins' : 1
            \     }
            \   }
            \ }

" Colour scheme settings
set background=dark
if has("gui_running")
    color PaperColor
else 
    color PaperColor
endif

" Handling long text
set wrap

" Search settings
set nohlsearch
set incsearch
set smartcase

" Change font
set guifont=Input:h12

" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Cursor settings
set ruler				" Shows the cursor position all the time

" Automatically indent
set autoindent

" Show line numbers
set number

" Set syntax highlighting on
syntax on

" Display incomplete commands
set showcmd

" Highlight strings in C comments
let c_comment_strings=1
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
