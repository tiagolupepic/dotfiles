source ~/.vim/plugins.vim
source ~/.vim/functions.vim

set t_Co=256
" set term=screen-256color
set wildmenu " cmd line completion a-la zsh
set wildmode=longest:full,full
set wildignore+=node_modules                     " node_modules dir
set wildignore+=.ropeproject                     " py rope cache dir
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files

set ttimeout
set ttimeoutlen=50
set title
set shellpipe=>
set shell=/bin/zsh
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

set hidden
set linespace=1
set guioptions=

let mapleader=" "
set hlsearch
filetype plugin indent on
set cc=80
set antialias
" set switchbuf=useopen
set backupcopy=yes

set showmatch
set nocompatible              " be iMproved, required
set noswapfile
set autoread
au CursorHold,CursorHoldI * if getcmdwintype() == '' | checktime | endif

" strip trailing witespaces
autocmd BufWritePre * :%s/\s\+$//e

syntax on
syntax sync fromstart
syntax sync minlines=256
set synmaxcol=9999
set lazyredraw
set re=1
set ttyfast
set regexpengine=1

set cmdheight=1
set numberwidth=4

nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>


" let test#ruby#spec_framework = "minitest"
let test#ruby#spec_framework = "rspec"

" escape alias
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
" Keep the cursor in same line when join lines
nnoremap J mzJ`z

" new tab
nnoremap <c-w>t :tabnew<cr>

" normal mode
nnoremap <tab> %
" visual mode
vnoremap <tab> %

"Keep search matches in the middle of the window and pulse the line when moving
"to them.
nnoremap n nzzzv
nnoremap N Nzzzv

let g:gist_clip_command = 'pbcopy'

set clipboard=unnamed

" Performance improvments
if has("mac")
  set norelativenumber

  set foldlevel=0
  set foldmethod=manual
endif

nnoremap <leader>f <ESC>/
nnoremap <leader>* <ESC>:find<space>

" Substitute
nnoremap <leader>s :%s//<left>

nnoremap <silent> <leader>F :nohlsearch<CR>

nnoremap <leader>A :call Search("")<Left><Left>
map <leader>cd :call SearchForDeclarationCursor()<CR>

nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" fzf
nnoremap <C-p> :Files<CR>

" Expand to directory of current file - http://vimcasts.org/e/14
cnoremap $$ <C-R>=expand('%:h').'/'<cr>
" Expand to full path (directory + file)
" ":echo expand('%:p')    /abc/def/my.txt  full path
cnoremap $% <C-R>=expand('%:p')<cr>
" Expand to name of file
" :echo expand('%:t')     my.txt            name of file ('tail')
cnoremap %% <C-R>=expand('%:t')<cr>
" Expands to directory name (from the opened folder, not the full path)
" :echo expand('%:p:h')   /abc/def          directory containing file ('head')
cnoremap %$ <C-R>=expand('%:p:h').'/'<cr>

" status line and tab line configs
set laststatus=2
set showtabline=2
set noshowmode

let g:Powerline_symbols='unicode'

set number
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set macmeta

let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 2
" let g:molokai_original = 1
" set notermguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
set termguicolors
set t_ut=

colorscheme Tomorrow-Night-Bright

set foldcolumn=1
set updatetime=750

let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0
let g:signify_cursorhold_insert = 0
let g:signify_cursorhold_normal = 0
let g:signify_update_on_bufenter = 0
let g:signify_update_on_focusgained = 1
" hybrid_reverse 1D1F21
" molokai 1c1d1e
" badwolf 141413
" tender 1e1e1e
" candid 21252B
" plastic 21252b
" happy_hacking 202324
" aurora 232526
" atom-dark-256 232525
" edge 2D2E32
" monokai-tasty 1d1f21
highlight SignColumn        ctermfg=NONE ctermbg=235 guibg=#202325 guifg=NONE
highlight SignifySignAdd    ctermfg=148 ctermbg=235 guibg=#202325 guifg=#59BB43
highlight SignifySignChange ctermfg=186 ctermbg=235 guibg=#202325 guifg=#FAC863
highlight SignifySignDelete ctermfg=197 ctermbg=235 guibg=#202325 guifg=#EC5F67
highlight SignifySignChangeDelete ctermfg=208 ctermbg=235 guibg=#202325 guifg=#CB7622
" highlight! link SignifySignAdd GitGutterAdd
" highlight! link SignifySignChange GitGutterChange
" highlight! link SignifySignDelete GitGutterDelete
" highlight! link SignifySignChangeDelete GitGutterChangeDelete
" highlight! link SignifySignDeleteFirstLine SignifySignDelete

set mouse=a
if !has('dgd nvim')
  set ttymouse=xterm2
endif

let g:ackprg = 'ag -p ~/.ignore --vimgrep'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
  autocmd FileType ruby nnoremap <buffer> <leader>cs  :call RubocopFixCs(expand('%'), '!')<cr>
augroup END

" autocmd BufNewFile *.rb call AddFrozenStringLiteral()
autocmd BufNewFile *.rb call AddTyped()

" Tags file
set tags=.tags
let g:fzf_tags_command = 'ctags -R -f .tags .'
let g:autotagCtagsCmd = 'ctags'
let g:autotagTagsFile = ".tags"

" map keys
nnoremap <silent> <leader>t :w<BAR>:TestFile<CR>
nnoremap <silent> <leader>T :w<BAR>:TestNearest<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
" nnoremap <silent> <leader>g :TestVisit<CR>

nmap <silent> <leader>o :<c-u>call append(line("."),  repeat([""], v:count1))<cr>
nmap <silent> <leader>O :<c-u>call append(line(".")-1, repeat([""], v:count1))<cr>

" config for buffers
nnoremap <silent> gb :call NextBuffer()<CR>
nnoremap <silent> gB :call PreviousBuffer()<CR>
nnoremap <silent> <leader>bq :call DeleteBuffer()<CR>
nnoremap <silent> <leader>lb :Buffers<CR>
"
" list tags
nnoremap <silent> <leader>lt :Tags<CR>

" delete and dont replace the buffer
nnoremap <leader>d "_d

" call the git shortlog with the current file
" from Mastering Vim Quickly #33
map <F2> :!git shortlog -s -n %<cr>

"O" Vim repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Argument rewrap
nnoremap <leader>wa :call argumentrewrap#RewrapArguments()<CR>

" CursorLine {{{
set cursorline
hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=#232526 guifg=NONE gui=NONE
" hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#F2D974 gui=NONE
" Only show cursorline in the current window and in normal mode

augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

let g:fzf_buffers_jump = 1
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:lightline = {
      \   'colorscheme': 'default',
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'filepath' ] ],
      \     'right': [ [ 'linter_errors', 'linter_warnings', 'lineinfo' ], [ 'fileinfo', 'percent' ] ],
      \   },
      \   'inactive': {
      \     'left': [ [ 'filename' ] ],
      \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ] ],
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \     'right': [ [ 'close' ] ],
      \   },
      \   'separator': { 'left': '', 'right': '' },
      \   'subseparator': { 'left': '', 'right': '' },
      \   'component': {
      \     'lineinfo': '%l:%-v',
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \   },
      \   'component_function': {
      \     'filepath': 'LightlineFilePath',
      \     'fileinfo': 'LightlineFileinfo',
      \     'gitbranch': 'FugitiveHead'
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \   },
      \ }

function! LightlineFilePath()
  let filename = expand('%t') !=# '' ? expand('%t') : ''
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFileinfo()
  if winwidth(0) < 90
    return ''
  endif

  let encoding = &fenc !=# "" ? &fenc : &enc
  let format = &ff
  let type = &ft !=# "" ? &ft : "no ft"
  return type . ' | ' . format . ' | ' . encoding
endfunction

"""" Lightline ALE
let g:lightline#ale#indicator_warnings = ' '
let g:lightline#ale#indicator_errors = ' '

"""" Lightline bufferline
let g:lightline#bufferline#filename_modifier = ':.'
let g:lightline#bufferline#modified = ' '
let g:lightline#bufferline#read_only = ''
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#shorten_path = 1

let g:ale_sign_column_always = 0
let g:ale_set_signs = 0
let g:ale_set_highlights = 0
let g:ale_sign_error = "\uf00d"
let g:ale_sign_warning = "\uf529"
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_echo_msg_error_str = "\uf00d"
let g:ale_echo_msg_warning_str = "\uf529"
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1

let g:ale_linters = {'javascript.jsx': ['prettier', 'eslint']}
let b:ale_fixers = {'javascript': ['eslint']}
let b:ale_linters = {'javascript': ['eslint']}

let g:AutoPairsShortcutToggle = ''
autocmd FileChangedShell * call OnFCSDelete()

let g:test#custom_transformations = {'docker_compose': function('TransformCommandToUseDockerCompose')}
let g:test#transformation = 'docker_compose'

" hi MatchParen      guifg=#5F5F87 guibg=#1d1f21 gui=NONE
" molokai
" hi MatchParen      guifg=#FD971F guibg=#000000 gui=bold
hi MatchParen ctermfg=NONE ctermbg=39 guifg=#FAFF69 guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
