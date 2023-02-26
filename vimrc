source ~/.vim/plugins.vim
source ~/.vim/functions.vim

let mapleader=" "

set exrc

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

set undofile

set shellpipe=>
set shellcmdflag=-lc
set shell=/bin/zsh

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
let &t_ut=''

set hidden
set linespace=1

set hlsearch
filetype plugin indent on
set cc=80
" set switchbuf=useopen
set backupcopy=yes

set ttimeout
set ttimeoutlen=50
set title
set showmatch
" set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set noswapfile
set autoread
set autowrite

syntax on
" syntax sync fromstart
" syntax sync minlines=256

set synmaxcol=9999
set lazyredraw
set regexpengine=1

set cmdheight=1
set numberwidth=4

set shortmess=aoOtsI
" set shortmess=at
" show search match X of total [1/N]
set shortmess-=SF
set noshowcmd

set clipboard=unnamed,unnamedplus

" status line and tab line configs
set laststatus=2
set noshowmode

set number
set relativenumber
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set smartindent
set sidescroll=8

" set listchars=trail:~,tab:\|-,eol:¬
set listchars=tab:\|-,eol:¬
set list

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" set complete=.,w,b,u
" set iskeyword+=?
" set iskeyword+=!

set complete-=t
set complete+=k
set complete+=kspell
set completeopt=menu,menuone,longest
set complete=.,w,b,i,k,U,u,s


if has('nvim')
    set completeopt-=preview
    let g:float_preview#docked=0
endif

let g:nvcode_termcolors=256

let g:gruvbox_contrast_dark = 'hard'
colorscheme badwolf

set foldcolumn=1
" set updatetime=750
set mouse=a

" mappings

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


if !has("nvim")
  " " fix meta keys
  execute "set <M-j>=\ej"
  execute "set <M-k>=\ek"
  execute "set <M-n>=\en"
  execute "set <M-e>=\ee"
  execute "set <M-p>=\ep"
  execute "set <M-b>=\eb"
  execute "set <M-t>=\et"
  execute "set <M-a>=\ea"
  execute "set <M-g>=\eg"
endif

nnoremap <M-k> :m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==
vnoremap <M-k> :m '<-2<CR>gv=gv
vnoremap <M-j> :m '>+1<CR>gv=gv

nnoremap <leader>f <ESC>/
nnoremap <leader>* <ESC>:find<space>

" Substitute
nnoremap <leader>s :%s//<left>

nnoremap <silent> <leader>F :nohlsearch<CR>

" Search with ripgrep the word under the cursor
nnoremap <M-a> :Rg<space>
nnoremap <leader>A :Rg<space>
" Search with ripgrep the word under the cursor
nnoremap \\ :Rg <c-r><c-w><cr>

map <leader>cd :call SearchForDeclarationCursor()<CR>

nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" git fugitive
nnoremap <M-g> :Git<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
let g:fugitive_pty = 1

" nnoremap <C-p> :Files<CR>
nnoremap <C-p> :lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>


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

" let g:fzf_layout = { 'down': '~65%' }
let g:fzf_preview_window = ['up:60%']

let g:fzf_layout = { 'up': '60%', 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'rounded' } }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --colors "path:fg:170,170,170" --colors "match:fg:246,63,81" --colors "line:fg:246,63,81" --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({ 'options': '--color hl:123,hl+:222 --preview-window up:60%' }), <bang>0)

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

" escape alias
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
" Keep the cursor in same line when join lines
nnoremap J mzJ`z

" new tab
nnoremap <c-w>t :tabnew<cr>

" map keys
nnoremap <silent> <leader>t :w<BAR>:TestFile<CR>
nnoremap <silent> <leader>T :w<BAR>:TestNearest<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
" nnoremap <silent> <leader>g :TestVisit<CR>

nmap <silent> <leader>o :<c-u>call append(line("."),  repeat([""], v:count1))<cr>
nmap <silent> <leader>O :<c-u>call append(line(".")-1, repeat([""], v:count1))<cr>

nmap <silent> gb <plug>(cokeline-focus-next)
nmap <silent> gB <plug>(cokeline-focus-prev)
nnoremap <silent> <leader>bq :call DeleteBuffer()<CR>

" nnoremap <leader>lb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>lb :Buffers<CR>

" list git files"
" nnoremap <leader>lg <cmd>Telescope git_status<cr>

nnoremap <leader>lg :GFiles?<cr>
nnoremap <leader>gd :SignifyHunkDiff<cr>
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" list tags
" nnoremap <silent> <leader>lt <cmd>Telescope tags<CR>
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

let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 0
let g:signify_cursorhold_insert = 0
let g:signify_cursorhold_normal = 0
let g:signify_update_on_bufenter = 0
let g:signify_update_on_focusgained = 1

highlight SignColumn        ctermfg=NONE ctermbg=235 guibg=#1d1e1f guifg=NONE
highlight SignifySignAdd    ctermfg=148 ctermbg=235 guibg=#1d1e1f guifg=#59BB43
highlight SignifySignChange ctermfg=186 ctermbg=235 guibg=#1d1e1f guifg=#FAC863
highlight SignifySignDelete ctermfg=197 ctermbg=235 guibg=#1d1e1f guifg=#EC5F67
highlight SignifySignChangeDelete ctermfg=208 ctermbg=235 guibg=#1d1e1f guifg=#CB7622


let g:ackprg = 'ag -p ~/.ignore --vimgrep'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" ruby
let g:ruby_operators = 1
let g:ruby_pseudo_operators = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  " autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
  " autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
  autocmd FileType ruby nnoremap <buffer> <leader>cr  :call RubocopFixCs(expand('%'), '!')<cr>
  autocmd FileType ruby nnoremap <buffer> <leader>cb  :call SorbetFixCurrentBuffer(expand('%'), '!')<cr>
augroup END

" autocmd BufNewFile *.rb call AddFrozenStringLiteral()
autocmd BufNewFile *.rb call AddTyped()

augroup vimrc-go
  autocmd!
  autocmd FileType go nnoremap <leader>gr :GoRun<CR>
augroup END

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_functions_parameters = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Tags file
set tags=.tags
let g:fzf_tags_command = 'ctags -R -f .tags .'
let g:autotagCtagsCmd = 'ctags'
let g:autotagTagsFile = ".tags"
let g:autotagStartMethod = 'fork'

let test#ruby#spec_framework = "rspec"
let test#ruby#rspec#executable = 'bin/rspec'

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

let g:lexima_enable_endwise_rules = 1

let g:test#custom_transformations = {'docker_compose': function('TransformCommandToUseDockerCompose')}
let g:test#transformation = 'docker_compose'

let g:go_term_enabled = 1
let g:go_term_mode = "silent keepalt rightbelow 15 split"
let g:go_def_reuse_buffer = 1

let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:true
let bufferline.icon_custom_colors = v:true
let bufferline.maximum_padding = 1
let bufferline.closable = v:true
let bufferline.auto_hide = v:true
"
" hi BufferCurrent guifg=#c4c4c4 guibg=#1d1e1f
" hi BufferCurrentIndex guibg=#1d1e1f
" hi BufferCurrentMod guibg=#1d1e1f
" hi BufferCurrentSign guifg=#0a9dff guibg=#1d1e1f
" hi BufferCurrentTarget guibg=#1d1e1f
hi BufferInactive guifg=#666666

" Run checktime in buffers, but avoiding the 'Command Line' (q:) window
au CursorHold,CursorHoldI * if getcmdwintype() == '' | checktime | endif

" strip trailing witespaces
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.cjs,*.mjs :EslintFixAll
