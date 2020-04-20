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

function! RubocopFixCs()
  let command = "bundle exec rubocop -a " . expand('%')
  call ClearEchoAndExecute(command)
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
