function! GitLog()
  execute "!git log"
endfunction

function! DockerTestNearest()
  let command = "docker-compose run --rm app bundle exec rspec " . expand('%:~:.') . ":" . line(".")
  call ClearEchoAndExecute(command)
endfunction

function! DockerTestFile()
  let command = "docker-compose run --rm app bundle exec rspec ". expand('%:~:.')
  call ClearEchoAndExecute(command)
endfunction

function! RubocopFixCs(path, vim_command)
  let l:rubocop = "bundle exec rubocop -a " . a:path

  if filereadable(".run_with_compose")
    if getcwd() =~# '^\' . expand('$FACTORIAL_PATH')
      " factorial custom docker compose
      let current_path = fnamemodify(getcwd(), ':t')
      let l:command = "docker-compose -f " . expand('$FACTORIAL_PATH') . "/docker-compose.yml --project-directory " . expand('$FACTORIAL_PATH') . " run --rm " . fnamemodify(getcwd(), ':t') . " " . l:rubocop
    else
      let l:command =  "docker-compose run --rm " . fnamemodify(getcwd(), ':t') . " " . l:rubocop
    endif
  endif
  exec a:vim_command . l:command
endfunction

function! EslintFix()
  execute "AsyncRun ./node_modules/.bin/eslint --fix %"
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

" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("fd -E node_modules/ -E db/ -E tmp/ -E vendor/ -E .git/ | alt -f - " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

function! OnFCSDelete()
    if v:fcs_reason == 'deleted'
        echohl Error
        echo "File '" . expand('<afile>') . "' no longer available"
        set modified
    else
        let v:fcs_choice = 'ask'
    endif
endfunction

" Transform shell commands to use docker-compose if applicable
function! TransformCommandToUseDockerCompose(cmd) abort
  if filereadable(".run_with_compose")
    if getcwd() =~# '^\' . expand('$FACTORIAL_PATH')
      " factorial custom docker compose
      let current_path = fnamemodify(getcwd(), ':t')
      return "docker-compose -f " . expand('$FACTORIAL_PATH') . "/docker-compose.yml --project-directory " . expand('$FACTORIAL_PATH') . " run --rm " . fnamemodify(getcwd(), ':t') . " " . a:cmd
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

  if &buftype ==# 'quickfix'
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
