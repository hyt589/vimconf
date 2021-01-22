call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

if ! has('nvim')
    Plug 'puremourning/vimspector'
else
    Plug 'idanarye/vim-vebugger'
endif

Plug 'preservim/nerdtree'

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

Plug 'kassio/neoterm'

Plug 'tpope/vim-commentary'

Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'Shougo/unite.vim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'ryanoasis/vim-devicons'

call plug#end()
