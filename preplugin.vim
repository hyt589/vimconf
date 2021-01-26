" runs before plug#begin

set encoding=UTF-8
set timeoutlen=2000

let g:project_local_config = '.config.vim'

let g:root_patterns = [
  \ '.git',
  \ g:project_local_config
  \ ]
