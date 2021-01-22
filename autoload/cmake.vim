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
  let l:command_str .= 'cd ..; ln -s ' . g:cmake#build_dir_rel . '/compile_commands.json compile_commands.json'
  execute 'T ' . l:command_str
endfunction

function cmake#build() abort
  call cmake#configure()
  let l:command_str = 'cd ' . getcwd() . '/' . g:cmake#build_dir_rel . ';'
  l:command_str .= 'make -j8; cd ..;'
  execute 'T ' . l:command_str
endfunction

function cmake#init() abort
  if ! filereadable(getcwd() . '/CMakeLists.txt')
    let s:cmake_list_found = 0
    return
  endif 

  echom 'Cmake project detected'
  let s:cmake_list_found = 1
endfunction
