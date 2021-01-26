function debug#ToggleBreakPoint() abort
  call vimspector#ToggleBreakpoint()
endfunction

function debug#Launch() abort
  call vimspector#Launch()
endfunction

function debug#Stop() abort
  call vimspector#Stop()
  call vimspector#Reset()
endfunction

function debug#StepOver() abort
  call vimspector#StepOver()
endfunction

function debug#StepInto() abort
  call vimspector#StepInto()
endfunction

function debug#StepOut() abort
  call vimspector#StepOut()
endfunction

function debug#RunToCursor() abort
  call vimspector#RunToCursor()
endfunction

function debug#Continue() abort
  call vimspector#Continue()
endfunction
