let s:cmake_list_found = 0

let g:cmake#build_type = 'Debug'
let g:cmake#definitions = {}
let g:cmake#build_dir_rel = 'build'

function cmake#configure() abort
  " quit if no CMakeLists.txt file was found
  if ! s:cmake_list_found
    echom "No CMake project found!"
    return
  endif

  " check if the build directory is preset
  if ! isdirectory(getcwd() . '/' . g:cmake#build_dir_rel)
    echom "Create binary directory at " . getcwd() . "/" . g:cmake#build_dir_rel
    call mkdir(getcwd() . '/' . g:cmake#build_dir_rel, 'p')
  endif
  let l:define_build_type = ' -DCMAKE_BUILD_TYPE=' . g:cmake#build_type . ' '
  let l:definition_keys = keys(g:cmake#definitions)
  let l:definition_str = ' -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
  for key in l:definition_keys
    let l:val = g:cmake#definitions[key]
    if len(l:val) == 0
      let l:definition_str .= ' -D' . key
      else
        let l:definition_str .= ' -D' . key . '=' . l:val
    endif
  endfor
  let l:command_str = 'cd ' . getcwd() . '/' . g:cmake#build_dir_rel . ';'
  let l:command_str .= 'cmake ' . l:define_build_type . l:definition_str . ' ..;'
  let l:command_str .= 'cd ..; ln -sf ' . g:cmake#build_dir_rel . '/compile_commands.json compile_commands.json'
  execute 'T ' . l:command_str
endfunction

function cmake#build() abort
  call cmake#configure()
  let l:command_str = 'cd ' . getcwd() . '/' . g:cmake#build_dir_rel . ';'
  let l:command_str .= 'make -j8; cd ..;'
  execute 'T ' . l:command_str
endfunction

function cmake#reconfigure() abort
  if filereadable(getcwd() . '/' . g:cmake#build_dir_rel . '/CMakeCache.txt')
    execute '! rm ' . getcwd() . '/' . g:cmake#build_dir_rel . '/CMakeCache.txt'
  endif
  call cmake#configure()
endfunction

function cmake#clean()
  if isdirectory(getcwd() . '/' . g:cmake#build_dir_rel)
    execute '! rm -rf ' . getcwd() . '/' . g:cmake#build_dir_rel
  endif
endfunction

function cmake#clean_rebuild()
  call cmake#clean()
  call cmake#build()
endfunction

function cmake#init() abort
  if ! filereadable(getcwd() . '/CMakeLists.txt')
    let s:cmake_list_found = 0
    silent! unmap <silent><F17>
    silent! unmap <silent><F24>
    silent! unmap <silent><F19>
    silent! unmap <silent><F18>
    silent! unmap <silent><F20>
    return
  endif

  echo 'Cmake project detected'
  let s:cmake_list_found = 1

  nmap <silent><F17> :call cmake#configure()<cr>
  nmap <silent><F24> :call cmake#clean()<cr>
  nmap <silent><F19> :call cmake#build()<cr>
  nmap <silent><F18> :call cmake#reconfigure()<cr>
  nmap <silent><F20> :call cmake#clean_rebuild()<cr>
endfunction
