let g:vim_home = '~/.vimconfig'
if has('nvim')

  " Install vim-plug if not found
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif
else

  " Install vim-plug if not found
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif

endif

exec 'source ' . g:vim_home . '/plugins.vim'
exec 'source ' . g:vim_home . '/coc_config.vim'

let g:airline#extensions#tabline#enabled = 1
let g:vimspector_enable_mappings = 'HUMAN'

set number relativenumber mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

autocmd BufNewFile,BufRead *.c call s:hyt_cpp_mode()
autocmd BufNewFile,BufRead *.cpp call s:hyt_cpp_mode()
autocmd BufNewFile,BufRead *.h call s:hyt_cpp_mode()
autocmd BufNewFile,BufRead *.hpp call s:hyt_cpp_mode()
autocmd BufNewFile,BufRead *.vim call s:hyt_viml_mode()
autocmd BufNewFile,BufRead *.vimrc call s:hyt_viml_mode()
autocmd BufNewFile,BufRead *CMakeLists.txt call s:hyt_viml_mode()
autocmd BufNewFile,BufRead *.vim call s:hyt_cmake_mode()
autocmd BufNewFile,BufRead *.json call s:hyt_json_mode()

function s:hyt_cpp_mode() abort
  setlocal sw=4
endfunction

function s:hyt_cmake_mode() abort
  setlocal sw=4
endfunction

function s:hyt_viml_mode() abort
  setlocal sw=2
endfunction

function s:hyt_json_mode() abort
  setlocal sw=2
endfunction

exec 'intro'
