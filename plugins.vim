call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'puremourning/vimspector'

Plug 'francoiscabrol/ranger.vim'

if has('nvim')
  Plug 'rbgrouleff/bclose.vim'
endif

call plug#end()
