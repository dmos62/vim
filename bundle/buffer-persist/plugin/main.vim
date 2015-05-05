" Default buffer file
let g:BufferFile = ".buffers.vim"

function StartBufferPersistSession()
  function s:persist(...)
    let s:listedBuffersPred =
          \'buflisted(v:val)>0'
    if exists('a:1')
      let s:bufferBeingDeleted = a:1
      let s:listedBuffersPred =
            \s:listedBuffersPred . ' && v:val != s:bufferBeingDeleted'
    endif
    let s:bufferNames =
          \filter(
            \map(
              \filter(range(1, bufnr('$')),
                \s:listedBuffersPred),
              \'bufname(v:val)'),
            \'v:val != ""')
    call writefile(s:bufferNames, g:BufferFile)
  endfunction
  call s:persist()
  augroup sessionPersist
    autocmd!
    autocmd BufAdd * call s:persist()
    autocmd BufDelete * call s:persist(expand('<abuf>'))
  augroup END
endfunction

function s:tryContinueSession()
  if filereadable(g:BufferFile)
    for name in readfile(g:BufferFile)
      execute 'badd ' . resolve(name)
    endfor
    call StartBufferPersistSession()
  endif
endfunction

autocmd VimEnter * call s:tryContinueSession()
