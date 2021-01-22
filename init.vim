let g:vim_home = '~/.vimconfig'
let &runtimepath .= ',' .g:vim_home 
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

set encoding=UTF-8

exec 'source ' . g:vim_home . '/preplugin.vim'
exec 'source ' . g:vim_home . '/plugins.vim'
exec 'source ' . g:vim_home . '/coc_config.vim'
exec 'source ' . g:vim_home . '/postplugin.vim'

if len(expand('%')) == 0
  exec 'intro'
  call timer_start(200, {-> execute('Ranger')})
endif
