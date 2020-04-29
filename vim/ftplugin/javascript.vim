let b:ale_fixers = ['eslint']
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1
nnoremap <buffer> <leader>jfl :call EslintFix()<cr>
let g:ale_fix_on_save = 1
hi! link jsxOpenPunct Comment
hi! link jsxPunct Comment
hi! link jsxClosePunct Comment
" hi! link Identifier Comment

if g:colors_name == 'aurora'
  autocmd BufEnter *.{js,ts,jsx,tsx} hi! Identifier guifg=#999999
  autocmd BufLeave * hi! Identifier guifg=#AB9FF0 gui=bold
endif

if g:colors_name == 'Tomorrow-Night-Bright'
  autocmd BufEnter *.{js,ts,jsx,tsx} hi! Identifier guifg=#808080
  autocmd BufLeave * hi! Identifier guifg=#8cb6e1 gui=bold
end

if g:colors_name == 'badwolf'
  autocmd BufEnter *.{js,ts,jsx,tsx} hi! Identifier guifg=#998B53 gui=bold
  autocmd BufLeave * hi! Identifier guifg=#ffa724 gui=bold
end
" autocmd Filetype javascript hi! link jsxTagName Constant
" autocmd Filetype javascript hi! link jsxTag Constant
" autocmd FileType javascript hi! link Identifier guifg=#666666
