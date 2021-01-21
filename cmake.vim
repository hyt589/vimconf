let s:is_cmake_project = filereadable(getcwd() . '/CMakeLists/txt')

let g:hyt_cmake_build_type = 'Debug'
let g:hyt_cmake_definitions = {}
let g:hyt_cmake_build_dir_rel = 'build'

function s:configure_cmake_project() abort
    if isdirectory(getcwd() . '/' . g:hyt_cmake_build_dir_rel)
        echom "Create binary directorory at " . getcwd() . "/" . g:hyt_cmake_build_dir_rel
        call mkdir(getcwd() . '/' . g:hyt_cmake_build_dir_rel, 'p')
    endif
    
endfunction

function s:load_project_setting() abort
    if filereadable(getcwd() . '/.config.vim')
        execute 'source ' . getcwd() . '/.config.vim'
    endif
endfunction

function s:main() abort
   if ! s:is_cmake_project
       return
   endif 
   call s:load_project_setting()
endfunction

call s:main()
