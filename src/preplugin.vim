" runs before plug#begin

set encoding=UTF-8
set timeoutlen=5000
set number 
set relativenumber 
set mouse=a 
set nowrap 
set cursorline 
set cmdheight=1
set tabstop=4 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab
set scrolloff=10
set nohlsearch

let g:project_local_config = '.config.vim'

let g:root_patterns = [
  \ '.git',
  \ g:project_local_config
  \ ]
