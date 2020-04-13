" File:       aurora.vim
" Maintainer: Rafal Bromirski
" URL:        https://github.com/paranoida/vim-aurora
" Modified:   Sun Sep 27 20:20:42 CEST 2015
" License:    MIT

" ----------------------------------------------------------------------------
" Description:
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Requirements And Recommendations:
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Initialisation:
" ----------------------------------------------------------------------------

" if !has("gui_running") && &t_Co < 256
"   finish
" endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "aurora"

" ----------------------------------------------------------------------------
" GUI And Cterm Palettes:
" ----------------------------------------------------------------------------

  let s:vmode      = "gui"
  let s:background = "#1B1B24"
  let s:foreground = "#CFCFDD"
  let s:selection  = "#3A3A47"
  let s:line       = "#262631"
  let s:comment    = "#69697C"
  let s:red        = "#FF5F40"
  " let s:orange     = "#FF9326"
  let s:orange     = "#fc9867"
  " let s:yellow     = "#FFCB65"
  " let s:yellow     = "#E5C07B"
  " let s:yellow     = "#E5C66B"
  let s:yellow     = "#F2D974"
  let s:green      = "#AADB7B"
  " let s:green      = "#9CEB4F"
  " above is from reseif
  " let s:green      = "#A2CC66"
  let s:aqua       = "#18FFE0"
  let s:blue       = "#31D1FF"
  let s:purple     = "#AB9FF0"
  let s:window     = "#262631"

  " TODO
  let s:darkcolumn = "#1c1c1c"
  let s:addbg      = "#5F875F"
  let s:addfg      = "#d7ffaf"
  let s:changebg   = "#5F5F87"
  let s:changefg   = "#d7d7ff"
  let s:darkblue   = "#00005f"
  let s:darkcyan   = "#005f5f"
  let s:darkred    = "#5f0000"
  let s:darkpurple = "#5f005f"

  let s:fdcolumn = "#232526"

" ----------------------------------------------------------------------------
" Formatting Options:
" ----------------------------------------------------------------------------

let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

" ----------------------------------------------------------------------------
" Highlighting Primitives:
" ----------------------------------------------------------------------------

exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_foreground = ' ".s:vmode."bg=".s:foreground."'"
exe "let s:bg_background = ' ".s:vmode."bg=".s:background."'"
exe "let s:bg_selection  = ' ".s:vmode."bg=".s:selection ."'"
exe "let s:bg_line       = ' ".s:vmode."bg=".s:line      ."'"
exe "let s:bg_comment    = ' ".s:vmode."bg=".s:comment   ."'"
exe "let s:bg_red        = ' ".s:vmode."bg=".s:red       ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"
exe "let s:bg_yellow     = ' ".s:vmode."bg=".s:yellow    ."'"
exe "let s:bg_green      = ' ".s:vmode."bg=".s:green     ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg=".s:aqua      ."'"
exe "let s:bg_blue       = ' ".s:vmode."bg=".s:blue      ."'"
exe "let s:bg_purple     = ' ".s:vmode."bg=".s:purple    ."'"
exe "let s:bg_window     = ' ".s:vmode."bg=".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg=".s:darkcolumn."'"
exe "let s:bg_fdcolumn   = ' ".s:vmode."bg=".s:fdcolumn  ."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg=".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg=".s:addfg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg=".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg=".s:changefg  ."'"
exe "let s:bg_darkblue   = ' ".s:vmode."bg=".s:darkblue  ."'"
exe "let s:bg_darkcyan   = ' ".s:vmode."bg=".s:darkcyan  ."'"
exe "let s:bg_darkred    = ' ".s:vmode."bg=".s:darkred   ."'"
exe "let s:bg_darkpurple = ' ".s:vmode."bg=".s:darkpurple."'"

exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_foreground = ' ".s:vmode."fg=".s:foreground."'"
exe "let s:fg_background = ' ".s:vmode."fg=".s:background."'"
exe "let s:fg_selection  = ' ".s:vmode."fg=".s:selection ."'"
exe "let s:fg_line       = ' ".s:vmode."fg=".s:line      ."'"
exe "let s:fg_comment    = ' ".s:vmode."fg=".s:comment   ."'"
exe "let s:fg_red        = ' ".s:vmode."fg=".s:red       ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"
exe "let s:fg_yellow     = ' ".s:vmode."fg=".s:yellow    ."'"
exe "let s:fg_green      = ' ".s:vmode."fg=".s:green     ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg=".s:aqua      ."'"
exe "let s:fg_blue       = ' ".s:vmode."fg=".s:blue      ."'"
exe "let s:fg_purple     = ' ".s:vmode."fg=".s:purple    ."'"
exe "let s:fg_window     = ' ".s:vmode."fg=".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg=".s:darkcolumn."'"
exe "let s:fg_fdcolumn   = ' ".s:vmode."fg=".s:fdcolumn  ."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg=".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg=".s:addfg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg=".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg=".s:changefg  ."'"
exe "let s:fg_darkblue   = ' ".s:vmode."fg=".s:darkblue  ."'"
exe "let s:fg_darkcyan   = ' ".s:vmode."fg=".s:darkcyan  ."'"
exe "let s:fg_darkred    = ' ".s:vmode."fg=".s:darkred   ."'"
exe "let s:fg_darkpurple = ' ".s:vmode."fg=".s:darkpurple."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

exe "let s:sp_none       = ' guisp=".s:none      ."'"
exe "let s:sp_foreground = ' guisp=".s:foreground."'"
exe "let s:sp_background = ' guisp=".s:background."'"
exe "let s:sp_selection  = ' guisp=".s:selection ."'"
exe "let s:sp_line       = ' guisp=".s:line      ."'"
exe "let s:sp_comment    = ' guisp=".s:comment   ."'"
exe "let s:sp_red        = ' guisp=".s:red       ."'"
exe "let s:sp_orange     = ' guisp=".s:orange    ."'"
exe "let s:sp_yellow     = ' guisp=".s:yellow    ."'"
exe "let s:sp_green      = ' guisp=".s:green     ."'"
exe "let s:sp_aqua       = ' guisp=".s:aqua      ."'"
exe "let s:sp_blue       = ' guisp=".s:blue      ."'"
exe "let s:sp_purple     = ' guisp=".s:purple    ."'"
exe "let s:sp_window     = ' guisp=".s:window    ."'"
exe "let s:sp_addbg      = ' guisp=".s:addbg     ."'"
exe "let s:sp_addfg      = ' guisp=".s:addfg     ."'"
exe "let s:sp_changebg   = ' guisp=".s:changebg  ."'"
exe "let s:sp_changefg   = ' guisp=".s:changefg  ."'"
exe "let s:sp_darkblue   = ' guisp=".s:darkblue  ."'"
exe "let s:sp_darkcyan   = ' guisp=".s:darkcyan  ."'"
exe "let s:sp_darkred    = ' guisp=".s:darkred   ."'"
exe "let s:sp_darkpurple = ' guisp=".s:darkpurple."'"

" ----------------------------------------------------------------------------
" Vim Highlighting: (see :help highlight-groups)"
" ----------------------------------------------------------------------------

if has('gui_running')
  exe "hi! Normal"        .s:fg_foreground  .s:bg_background  .s:fmt_none
else
  exe "hi! Normal"        .s:fg_foreground  .s:bg_none        .s:fmt_none
endif

exe "hi! ColorColumn"   .s:fg_none        .s:bg_fdcolumn        .s:fmt_none
"   Conceal"
"   Cursor"
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_red         .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_fdcolumn    .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_fdcolumn    .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_fdcolumn    .s:fmt_none
"   Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_fdcolumn    .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue    .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
"   LongLineWarning
"   WildMenu"

" ----------------------------------------------------------------------------
" Generic Syntax Highlighting: (see :help group-name)
" ----------------------------------------------------------------------------

exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none
exe "hi! SpecialComment"  .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_red         .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_green       .s:bg_none        .s:fmt_none
"   Character"
"   Number"
"   Boolean"
"   Float"

exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_blue        .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Keyword"
"   Exception"

exe "hi! PreProc"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_orange      .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_green       .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr

exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

" ----------------------------------------------------------------------------
" Diff Syntax Highlighting:
" ----------------------------------------------------------------------------

" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
hi! link diffRemoved Constant
"   diffChanged
hi! link diffAdded Special
"   diffLine
"   diffSubname
"   diffComment

" ----------------------------------------------------------------------------
" Sass Syntax Highlighting:
" ----------------------------------------------------------------------------

" hi! link sassPlaceholder Constant
" hi! link sassClass Constant


" ----------------------------------------------------------------------------
" Elixir Syntax Highlighting:
" ----------------------------------------------------------------------------

hi! link elixirAlias Directory
hi! link elixirAtom Regexp
hi! link elixirVariable Directory
hi! link elixirInclude Keyword
hi! link elixirStringDelimiter String
hi! link elixirKeyword Keyword
hi! link elixirBlockDefinition Keyword
hi! link elixirDefine Keyword
hi! link elixirStructDefine Directory
hi! link elixirPrivateDefine Keyword
hi! link elixirModuleDefine Keyword
hi! link elixirProtocolDefine Keyword
hi! link elixirImplDefine Directory
hi! link elixirModuleDeclaration Function
hi! link elixirDelegateDeclaration Directory
hi! link elixirDocTest Comment
hi! link elixirOperator Comment

hi! link javaScript Normal
hi! link javaScriptBraces Normal
hi! link javaScriptNumber Number

hi! link jsOperator Function
hi! link jsStatement Structure
hi! link jsReturn Structure
hi! link jsThis Debug
hi! link jsClassDefinition Substitute
hi! link jsFunction Structure
hi! link jsFuncName Function
hi! link jsFuncCall Function
hi! link jsClassFuncName Function
hi! link jsClassMethodType Structure
hi! link jsRegexpString Special
hi! link jsGlobalObjects Substitute
hi! link jsGlobalNodeObjects Substitute
hi! link jsException Substitute
hi! link jsBuiltins Substitute

" ----------------------------------------------------------------------------
" Legal:
" ----------------------------------------------------------------------------

" Copyright (c) 2011 Ethan Schoonover
" Copyright (c) 2009-2012 NanoTech
" Copyright (c) 2012 w0ng
" Copyright (c) 2015 Rafal Bromirski
"
" Permission is hereby granted, free of charge, to any per‐
" son obtaining a copy of this software and associated doc‐
" umentation files (the “Software”), to deal in the Soft‐
" ware without restriction, including without limitation
" the rights to use, copy, modify, merge, publish, distrib‐
" ute, sublicense, and/or sell copies of the Software, and
" to permit persons to whom the Software is furnished to do
" so, subject to the following conditions:
"
" The above copyright notice and this permission notice
" shall be included in all copies or substantial portions
" of the Software.
"
" THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
" THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" LAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
" DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
