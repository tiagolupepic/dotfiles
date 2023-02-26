function! GitLog()
  execute "!git log"
endfunction

function! RubocopFixCs(path, vim_command)
  let l:rubocop = "bundle exec rubocop -A " . a:path

  if filereadable(".run_with_compose")
    if getcwd() =~# '^\' . expand('$FACTORIAL_PATH')
      let l:command = "fc-docker-exec " . l:rubocop
    else
      let l:command =  "docker-compose run --rm " . fnamemodify(getcwd(), ':t') . " " . l:rubocop
    endif
  endif

  if has('nvim')
    let term_position = get(g:, 'test#neovim#term_position', 'botright')
    execute term_position . ' new'
    call termopen(l:command)
    au BufDelete <buffer> wincmd p " switch back to last window
    startinsert
  else
    exec a:vim_command . l:command
  endif

endfunction

function! SorbetFixCurrentBuffer(path, vim_command)
  let l:sorbet = "tc --color always -P --file " . a:path

  if filereadable(".run_with_compose")
    if getcwd() =~# '^\' . expand('$FACTORIAL_PATH')
      let l:command = "fc-docker-sorbet " . l:sorbet
    else
      let l:command =  "docker-compose run --rm " . fnamemodify(getcwd(), ':t') . " " . l:sorbet
    endif
  endif

  exec a:vim_command . l:command
endfunction

function! EslintFix(path)
  execute "AsyncRun ./node_modules/.bin/eslint --fix " . a:path
endfunction

function! ClearEchoAndExecute(command)
  if has('nvim')
    -tabnew
    call termopen(a:command)
    startinsert
    return
  endif

  let message = '.editor/project.vim => ' . a:command
  let command = "echo -e '" . message . "' && " . a:command
  echo command

  if has('nvim')
    -tabnew
    call termopen(command)
    startinsert
    return
  endif

  let command = '! clear && ' . command
  execute command
endfunction

function! SearchForDeclarationCursor()
  let searchTerm = expand("<cword>")
  call SearchForDeclaration(searchTerm)
endfunction

function! SearchForDeclaration(term)
  let definition = 'def ' . a:term
  cexpr system('ag -w ' . shellescape(definition))
endfunction

function! Search(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction

function! RipGrep(string)
  execute 'Rg' a:string
endfunction

" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("fd --ignore-file ~/.fd_ignore -t f | alt -f - " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Transform shell commands to use docker-compose if applicable
function! TransformCommandToUseDockerCompose(cmd) abort
  if filereadable(".run_with_compose")
    if getcwd() =~# '^\' . expand('$FACTORIAL_PATH')
      return "fc-docker-exec-test-env " . a:cmd
    endif

    return "docker-compose run --rm " . fnamemodify(getcwd(), ':t') . " " . a:cmd
  else
    return a:cmd
  endif
endfunction

function! AddTyped()
  let l:typed = "# typed: true"
  let l:filename = expand("%")

  if filename =~# "\.rb$"
    call append(0, typed)
    call append(1, "")
  endif
endfunction

function! AddFrozenStringLiteral()
  let l:literal = "# frozen_string_literal: true"
  let l:filename = expand("%")

  if filename =~# "\.rb$"
    call append(0, literal)
    call append(1, "")
  endif
endfunction

function! DeleteBuffer()
  let btarget = bufnr('%')

  if &buftype ==# 'terminal'
    execute 'bdelete! '.btarget
  elseif &buftype ==# 'quickfix'
    let btotal = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    if btotal == 1
      execute 'bdelete '.btarget
    else
      echo "Can't close this buffer!"
    endif
  else
    execute 'bprevious'
    if &buftype ==# 'quickfix'
      execute 'bprevious'
    endif
    execute 'bdelete '.btarget

    " when have only the quickfix and we should delete too
    let qf = filter(getwininfo(), 'v:val.quickfix && !v:val.loclist')
    let btotal = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    if !empty(qf) && btotal == 1
      execute 'bdelete'
    end
  endif
endfunction

function! NextBuffer()
  if &buftype ==# 'quickfix'
    echo "Can't move to the next buffer!"
  else
    execute 'bnext'
    if &buftype ==# 'quickfix'
      execute 'bnext'
    endif
  endif
endfunction

function! PreviousBuffer()
  if &buftype ==# 'quickfix'
    echo "Can't move to the previous buffer!"
  else
    execute 'bprevious'
    if &buftype ==# 'quickfix'
      execute 'bprevious'
    endif
  endif
endfunction
