let g:vim_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &runtimepath .= ',' .g:vim_home 

exec 'source ' . g:vim_home . '/preplugin.vim'
exec 'source ' . g:vim_home . '/plugins.vim'
exec 'source ' . g:vim_home . '/coc_config.vim'
exec 'source ' . g:vim_home . '/postplugin.vim'

if len(expand('%')) == 0
  if has('nvim')
    exec 'intro'
  endif
  call timer_start(200, {-> execute('Ranger')})
endif
