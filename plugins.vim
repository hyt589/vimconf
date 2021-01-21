call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'puremourning/vimspector'

Plug 'francoiscabrol/ranger.vim'

if has('nvim')
  Plug 'rbgrouleff/bclose.vim'
endif

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/vimfiler.vim'

Plug 'liuchengxu/vista.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'spolu/dwm.vim'

call plug#end()
