let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:vimspector_enable_mappings = 'HUMAN'
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 15
let g:neoterm_autoinsert = 1
let g:airline_inactive_collapse=0
let g:airline_focuslost_inactive = 1
let g:airline_theme='onehalfdark'
let g:chromatica#libclang_path='/usr/lib/x86_64-linux-gnu/libclang-11.so.1'

set number relativenumber mouse=a nowrap cursorline
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

syntax on
set termguicolors

colorscheme onehalfdark

autocmd BufNewFile,BufRead *.c call s:cpp_mode()
autocmd BufNewFile,BufRead *.cpp call s:cpp_mode()
autocmd BufNewFile,BufRead *.h call s:cpp_mode()
autocmd BufNewFile,BufRead *.hpp call s:cpp_mode()
autocmd BufNewFile,BufRead *.vim call s:viml_mode()
autocmd BufNewFile,BufRead *.vimrc call s:viml_mode()
autocmd BufNewFile,BufRead *CMakeLists.txt call s:cmake_mode()
autocmd BufNewFile,BufRead *.cmake call s:cmake_mode()
autocmd BufNewFile,BufRead *.json call s:json_mode()
autocmd User RooterChDir call s:check_project_config()
autocmd User AirlineAfterInit let g:airline_section_a = "%#__accent_bold#%{winnr()} - " . g:airline_section_a

function s:cpp_mode() abort
  setlocal sw=4
endfunction

function s:cmake_mode() abort
  setlocal sw=4
endfunction

function s:viml_mode() abort
  setlocal sw=2
endfunction

function s:json_mode() abort
  setlocal sw=2
endfunction

function s:go_to_buffer_nr(num) abort
  let l:possible_buffers = range(1, bufnr('$'))
  let l:listed_buffers = filter(l:possible_buffers, 'buflisted(v:val)')
  execute 'b' . l:listed_buffers[a:num-1]
endfunction

function s:check_project_config() abort
  call cmake#init()
  if filereadable(getcwd() . '/' . g:project_local_config)
    execute 'source ' . getcwd() . '/' . g:project_local_config
  endif
endfunction

nnoremap Q :q<cr>

nnoremap <c-j> jzz
nnoremap <c-k> kzz

nnoremap <silent><leader>1 :call <SID>go_to_buffer_nr(1)<cr>
nnoremap <silent><leader>2 :call <SID>go_to_buffer_nr(2)<cr>
nnoremap <silent><leader>3 :call <SID>go_to_buffer_nr(3)<cr>
nnoremap <silent><leader>4 :call <SID>go_to_buffer_nr(4)<cr>
nnoremap <silent><leader>5 :call <SID>go_to_buffer_nr(5)<cr>
nnoremap <silent><leader>6 :call <SID>go_to_buffer_nr(6)<cr>
nnoremap <silent><leader>7 :call <SID>go_to_buffer_nr(7)<cr>
nnoremap <silent><leader>8 :call <SID>go_to_buffer_nr(8)<cr>
nnoremap <silent><leader>9 :call <SID>go_to_buffer_nr(9)<cr>
nnoremap <silent><leader>bd :bdelete<cr>

nnoremap <silent><F2> :TagbarToggle<CR>
nnoremap <silent><F3> :NERDTreeToggle<CR>
" nnoremap <F3> :VimFilerExplorer<CR>

nnoremap <silent><leader>t :Topen<CR>
tnoremap <esc> <c-\><c-n>

nnoremap <silent><space>1 :silent exe 1 . 'wincmd w'<cr>
nnoremap <silent><space>2 :silent exe 2 . 'wincmd w'<cr>
nnoremap <silent><space>3 :silent exe 3 . 'wincmd w'<cr>
nnoremap <silent><space>4 :silent exe 4 . 'wincmd w'<cr>
nnoremap <silent><space>5 :silent exe 5 . 'wincmd w'<cr>
nnoremap <silent><space>6 :silent exe 6 . 'wincmd w'<cr>
nnoremap <silent><space>7 :silent exe 7 . 'wincmd w'<cr>
nnoremap <silent><space>8 :silent exe 8 . 'wincmd w'<cr>
nnoremap <silent><space>9 :silent exe 9 . 'wincmd w'<cr>

nnoremap <space>w <c-w>

nnoremap <silent><space>r :exec 'source ' . g:vim_home . '/init.vim'<cr>

map <c-_> gcc
nnoremap <silent><c-s> :wa<cr>

nnoremap <silent><leader>db :call debug#ToggleBreakPoint()<cr>
nnoremap <silent><F16> :call debug#Launch()<cr>
nnoremap <silent><F5> :call debug#StepOver()<cr>
nnoremap <silent><F6> :call debug#StepInto()<cr>
nnoremap <silent><F7> :call debug#StepOut()<cr>
nnoremap <silent><F8> :call debug#RunToCursor()<cr>
nnoremap <silent><F9> :call debug#Continue()<cr>
nnoremap <silent><F10> :call debug#Stop()<cr>

vnoremap > >gv
vnoremap < <gv

nnoremap <silent><leader>p :MarkdownPreview<cr>
nnoremap <silent><leader>P :MarkdownPreviewStop<cr>

call s:check_project_config()
