" runs before plug#begin

set encoding=UTF-8
set timeoutlen=5000

let g:project_local_config = '.config.vim'

let g:root_patterns = [
  \ '.git',
  \ g:project_local_config
  \ ]
