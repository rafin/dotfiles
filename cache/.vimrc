" VUNDLE -----------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'

call vundle#end()            " required
filetype plugin indent on    " required


" ALE --------
let g:ale_lint_on_enter = 1
let g:ale_linters = {'cpp': ['g++']}
let g:ale_completion_enabled = 1

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚡︎'

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

highlight ALEError guibg=none guifg=underline ctermbg=none cterm=underline
highlight ALEWarning guibg=none guifg=underline ctermbg=none cterm=underline

" CUSTOM ------------------------------------------------------------

set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=%=                           " right align
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

hi Search guibg=Yellow guifg=Black ctermbg=Yellow ctermfg=Black

filetype plugin indent on
syntax enable

set hlsearch
set incsearch

set softtabstop=4
set shiftwidth=4
set expandtab

set number
