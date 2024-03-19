"      _               _                 _  __
"     | |__   __ _  __| | __      _____ | |/ _|
"     | '_ \ / _` |/ _` | \ \ /\ / / _ \| | |_
"     | |_) | (_| | (_| |  \ V  V / (_) | |  _|
"     |_.__/ \__,_|\__,_|   \_/\_/ \___/|_|_|
"
"      I am the Bad Wolf. I create myself.
"       I take the words. I scatter them in time and space.
"        A message to lead myself here.
"
" A Vim colorscheme pieced together by Steve Losh.
" Available at http://stevelosh.com/projects/badwolf/
"
" Why? {{{
"
" After using Molokai for quite a long time, I started longing for
" a replacement.
"
" I love Molokai's high contrast and gooey, saturated tones, but it can be
" a little inconsistent at times.
"
" Also it's winter here in Rochester, so I wanted a color scheme that's a bit
" warmer.  A little less blue and a bit more red.
"
" And so Bad Wolf was born.  I'm no designer, but designers have been scattering
" beautiful colors through time and space long before I came along.  I took
" advantage of that and reused some of my favorites to lead me to this scheme.
"
" }}}

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "badwolf"

if !exists("g:badwolf_html_link_underline") " {{{
    let g:badwolf_html_link_underline = 1
endif " }}}

if !exists("g:badwolf_css_props_highlight") " {{{
    let g:badwolf_css_props_highlight = 0
endif " }}}

" }}}
" Palette {{{

let s:bwc = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
" let s:bwc.plain = ['f8f6f2', 15]
let s:bwc.plain = ['d0d0d0', 15]

" Pure and simple.
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]

" All of the Gravel colors are based on a brown from Clouds Midnight.
" d0d0d0
let s:bwc.brightgravel   = ['d9cec3', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]
let s:bwc.darkgrey       = ['64645e', 239]
let s:bwc.newblackgravel = ['1a1a1a', 110]
let s:bwc.newblackestgravel = ['1d1e1f', 110]
let s:bwc.directorygray  = ['aaaaaa', 110]
let s:bwc.statuslinebg   = ['8a8a8a', 110]
let s:bwc.tablinebg      = ['303030', 254]
let s:bwc.tablinefg      = ['8a8a8a', 251]

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = ['f6e84f', 221]

" eec27c
" A beautiful tan from Tomorrow Night.
" let s:bwc.dirtyblonde = ['f4cf86', 222]

" let s:bwc.dirtyblonde = ['edd09e', 222]
let s:bwc.dirtyblonde = ['dac887', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
" original
" let s:bwc.taffy = ['eb4452', 196]
let s:bwc.taffy = ['f63f51', 196]
let s:bwc.monotaffy = ['F78A95', 196]
" let s:bwc.taffy = ['ff2c4b', 196]

" Another chewy accent, but use sparingly!
let s:bwc.saltwatertaffy = ['8cffba', 121]

" The star of the show comes straight from Made of Code.
"
" You should almost never use this.  It should be used for things that denote
" 'where the user is', which basically consists of:
"
" * The cursor
" * A REPL prompt
let s:bwc.tardis = ['0a9dff', 39]

let s:bwc.malibu = ['7cc3f6', 39]

" This one's from Mustang, not Florida!
" let s:bwc.orange = ['ffa724', 214]
" let s:bwc.tuliptree = ['f3aa46', 214]

let s:bwc.tuliptree = ['efba35', 214]
" the yellow (orange)
" let s:bwc.ronchi = ['fdba13', 214]
" bright yellow
let s:bwc.ronchi = ['edd351', 214]
" let s:bwc.ronchi = ['f1b846', 214]

" A limier green from Getafe.
"#afd700
" let s:bwc.lime = ['aeee00', 154]
let s:bwc.lime = ['afd700', 154]
let s:bwc.deco = ['d9de92', 154]
let s:bwc.springrain = ['a8cbb7', 154]
let s:bwc.lime_comp = ['9BB381', 154]

let s:bwc.botticelli = ['BED0D4', 154]
let s:bwc.lavendergrey = ['94a8c1', 154]

let s:bwc.barberry = ['c6e11b', 154]
let s:bwc.lightbarberry = ['C3E004', 154]

" 5ab8c8 <= alternative
let s:bwc.oceanblue = ['53cbb6', 155]

let s:bwc.flamingo = ['ed4f2e', 200]

let s:bwc.bubblegum = ['f3c5e0', 200]

" b57190 <= light purple variation
let s:bwc.tanhide = ['f78356', 200]
" light orange variation
let s:bwc.tacao = ['eaa985', 200]
let s:bwc.terracota = ['e48858', 200]
let s:bwc.burntsienna = ['e7885a', 200]

" f984ac
" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = ['ff9eb8', 211]

let s:bwc.zinnwaldite = ['ebafa4', 211]

" Pink and Purple borrowed PaperColor
"eb97f4
let s:bwc.pink = ['d70087', 211]
let s:bwc.thistle = ['d6b3ce', 211]
let s:bwc.purple = ['af87d7', 211]
let s:bwc.portage = ['9c98ed', 211]
let s:bwc.coldpurple = ['b2a1d5', 211]

"  Another play on the brown from Clouds Midnight.  I love that color.
let s:bwc.toffee = ['b88853', 137]
" b19456

" Also based on that Clouds Midnight brown.
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

let s:bwc.coraltree = ['ab7c6e', 95]
let s:bwc.indiankhaki = ['c4aa8f', 150]

let g:terminal_color_0 = "#282c34"
let g:terminal_color_8 = "#282c34"
let g:terminal_color_1 = "#e06c75"
let g:terminal_color_9 = "#e06c75"
let g:terminal_color_2 = "#98c379"
let g:terminal_color_10 = "#98c379"
let g:terminal_color_3 = "#e5c07b"
let g:terminal_color_11 = "#e5c07b"
let g:terminal_color_4 = "#61afef"
let g:terminal_color_12 = "#61afef"
let g:terminal_color_5 = "#c678dd"
let g:terminal_color_13 = "#c678dd"
let g:terminal_color_6 = "#56b6c2"
let g:terminal_color_14 = "#56b6c2"
let g:terminal_color_7 = "#dcdfe4"
let g:terminal_color_15 = "#dcdfe4"

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Configuration Options {{{

" if exists('g:badwolf_darkgutter') && g:badwolf_darkgutter
    let s:gutter = 'newblackestgravel'
" else
"     let s:gutter = 'blackgravel'
" endif

if exists('g:badwolf_tabline')
    if g:badwolf_tabline == 0
        let s:tabline = 'blackestgravel'
    elseif  g:badwolf_tabline == 1
        let s:tabline = 'blackgravel'
    elseif  g:badwolf_tabline == 2
        let s:tabline = 'darkgravel'
    elseif  g:badwolf_tabline == 3
        let s:tabline = 'deepgravel'
    else
        let s:tabline = 'blackestgravel'
    endif
else
    let s:tabline = 'blackgravel'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

call s:HL('Normal', 'plain', 'newblackgravel')

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'newblackgravel', 'bg', 'none')

call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorLineNr',   'dalespale', s:gutter, 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', s:gutter)

call s:HL('TabLine', 'tablinebg', 'tablinebg', 'none')
call s:HL('TabLineFill', 'tablinefg', 'tablinebg', 'none')
call s:HL('TabLineSel', 'blackestgravel', 'statuslinebg', 'bold')

call s:HL('MatchParen', 'dalespale', 'newblackgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'newblackgravel', 'dalespale', 'none')
call s:HL('IncSearch', 'coal', 'tardis',    'none')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'coal', 'tardis', 'bold')
call s:HL('StatusLineNC', 'snow', 'deepgravel', 'bold')

call s:HL('WildMenu', 'coal', 'malibu', 'bold')

call s:HL('Directory', 'directorygray', '', 'bold')
call s:HL('Noise', 'directorygray', '', 'bold')

call s:HL('Title', 'lime')

call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'dalespale',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'dress',       '',   'bold')
call s:HL('EndOfBuffer', 'newblackgravel',   'newblackgravel')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" }}}
" Gutter {{{

call s:HL('LineNr',     'mediumgravel', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'mediumgravel', s:gutter)

" }}}

" GitGutter {{{
    call s:HL("GitGutterAdd", 'lime', s:gutter)
    call s:HL("GitGutterDelete", 'taffy', s:gutter)
    call s:HL("GitGutterChange", 'dalespale', s:gutter)
    call s:HL("GitGutterChangeDelete", 'taffy', s:gutter)
    call s:HL("GitGutterAddLine", 'lime', s:gutter)
    call s:HL("GitGutterDeleteLine", 'taffy', s:gutter)
    call s:HL("GitGutterChangeLine", 'dalespale', s:gutter)
    call s:HL("GitGutterChangeDeleteLine", 'taffy', s:gutter)
" }}}

" Cursor {{{

call s:HL('Cursor',  'coal', 'tardis', 'bold')
call s:HL('vCursor', 'coal', 'tardis', 'bold')
call s:HL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gravel', '', 'italic')
call s:HL('Todo',           'snow', 'bg', 'bold')
call s:HL('SpecialComment', 'snow', 'bg', 'bold')
call s:HL('commentTSConstant', 'gravel', '', 'italic')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'dirtyblonde')
call s:HL('TSString', 'dirtyblonde', '', 'none')

" Control flow stuff is taffy.
call s:HL('Statement',   'taffy', '', 'bold')
call s:HL('TSStatement',   'taffy', '', 'bold')
call s:HL('Keyword',     'taffy', '', 'bold')
call s:HL('TSKeyword',     'taffy', '', 'bold')
call s:HL('Conditional', 'taffy', '', 'bold')
call s:HL('TSConditional', 'taffy', '', 'bold')
call s:HL('Operator',    'taffy', '', 'none')
call s:HL('TSOperator',    'taffy', '', 'none')
call s:HL('Label',       'taffy', '', 'none')
call s:HL('TSLabel',       'taffy', '', 'none')
call s:HL('Repeat',      'taffy', '', 'none')
call s:HL('TSRepeat',      'taffy', '', 'none')
call s:HL('TSProperty',  'indiankhaki', '', 'none')
call s:HL('TSInclude',  'lime', '', 'none')

" Functions and variable declarations are orange, because plain looks weird.
call s:HL('Identifier', 'ronchi', '', 'bold')
call s:HL('TSIdentifier', 'ronchi', '', 'bold')
call s:HL('Function',   'ronchi', '', 'none')
call s:HL('TSFunction',   'ronchi', '', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'lime', '', 'none')
call s:HL('Macro',     'deco', '', 'none')
call s:HL('Define',    'lime', '', 'none')
call s:HL('PreCondit', 'lime', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'toffee', '', 'bold')
call s:HL('Character', 'toffee', '', 'bold')
call s:HL('Boolean',   'toffee', '', 'bold')

call s:HL('Number', 'toffee', '', 'bold')
call s:HL('TSNumber', 'toffee', '', 'bold')
call s:HL('Float',  'toffee', '', 'bold')
call s:HL('TSFloat',  'toffee', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'dress', '', 'bold')

call s:HL('Type', 'dress', '', 'none')
call s:HL('TSType', 'dress', '', 'none')
call s:HL('StorageClass', 'taffy', '', 'none')
call s:HL('TSStorageClass', 'taffy', '', 'none')
call s:HL('Structure', 'taffy', '', 'none')
call s:HL('TSStructure', 'taffy', '', 'none')
call s:HL('Typedef', 'taffy', '', 'bold')
call s:HL('TSTypedef', 'taffy', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'lime', '', 'bold')
call s:HL('TSException', 'lime', '', 'bold')

call s:HL('TSVariable', 'plain', '', '')
call s:HL('TSFunction', 'plain', '', '')
call s:HL('TSKeywordFunction', 'lime', '', '')
call s:HL('TSConstBuiltin', 'saltwatertaffy', '', '')

call s:HL('TSTag', 'lime', '', '')

" Misc
call s:HL('Error',  'snow',   'taffy', 'bold')
call s:HL('Debug',  'snow',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call s:HL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call s:HL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'snow', 'taffy', 'bold')

    " the matched pattern
    call s:HL('CtrlPMatch', 'ronchi', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

    " the prompt’s base
   call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

    " the prompt’s text
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'coal', 'tardis', 'bold')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'coal', 'tardis', 'bold')

    " the scanning status
    call s:HL('CtrlPStats', 'coal', 'tardis', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call s:HL('InterestingWord1', 'coal', 'ronchi')
call s:HL('InterestingWord2', 'coal', 'lime')
call s:HL('InterestingWord3', 'coal', 'saltwatertaffy')
call s:HL('InterestingWord4', 'coal', 'toffee')
call s:HL('InterestingWord5', 'coal', 'dress')
call s:HL('InterestingWord6', 'coal', 'taffy')


" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=coal guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" Rainbow Parentheses {{{

call s:HL('level16c', 'mediumgravel',   '', 'bold')
call s:HL('level15c', 'dalespale',      '', '')
call s:HL('level14c', 'dress',          '', '')
call s:HL('level13c', 'ronchi',         '', '')
call s:HL('level12c', 'tardis',         '', '')
call s:HL('level11c', 'lime',           '', '')
call s:HL('level10c', 'toffee',         '', '')
call s:HL('level9c',  'saltwatertaffy', '', '')
call s:HL('level8c',  'coffee',         '', '')
call s:HL('level7c',  'dalespale',      '', '')
call s:HL('level6c',  'dress',          '', '')
call s:HL('level5c',  'ronchi',         '', '')
call s:HL('level4c',  'tardis',         '', '')
call s:HL('level3c',  'lime',           '', '')
call s:HL('level2c',  'toffee',         '', '')
call s:HL('level1c',  'saltwatertaffy', '', '')

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'tardis', 'blackgravel')
call s:HL('ShowMarksHLu', 'tardis', 'blackgravel')
call s:HL('ShowMarksHLo', 'tardis', 'blackgravel')
call s:HL('ShowMarksHLm', 'tardis', 'blackgravel')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call s:HL('clojureSpecial',  'taffy', '', '')
call s:HL('clojureDefn',     'taffy', '', '')
call s:HL('clojureDefMacro', 'taffy', '', '')
call s:HL('clojureDefine',   'taffy', '', '')
call s:HL('clojureMacro',    'taffy', '', '')
call s:HL('clojureCond',     'taffy', '', '')

call s:HL('clojureKeyword', 'ronchi', '', 'none')

call s:HL('clojureFunc',   'dress', '', 'none')
call s:HL('clojureRepeat', 'dress', '', 'none')

call s:HL('clojureParen0', 'lightgravel', '', 'none')

call s:HL('clojureAnonArg', 'snow', '', 'bold')

" }}}
" Common Lisp {{{

call s:HL('lispFunc',           'lime', '', 'none')
call s:HL('lispVar',            'ronchi', '', 'bold')
call s:HL('lispEscapeSpecial',  'ronchi', '', 'none')

" }}}
" CSS {{{

if g:badwolf_css_props_highlight
    call s:HL('cssColorProp', 'taffy', '', 'none')
    call s:HL('cssBoxProp', 'taffy', '', 'none')
    call s:HL('cssTextProp', 'taffy', '', 'none')
    call s:HL('cssRenderProp', 'taffy', '', 'none')
    call s:HL('cssGeneratedContentProp', 'taffy', '', 'none')
else
    call s:HL('cssColorProp', 'fg', '', 'none')
    call s:HL('cssBoxProp', 'fg', '', 'none')
    call s:HL('cssTextProp', 'fg', '', 'none')
    call s:HL('cssRenderProp', 'fg', '', 'none')
    call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
end

call s:HL('cssValueLength', 'toffee', '', 'bold')
call s:HL('cssColor', 'toffee', '', 'bold')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'ronchi', '', 'bold')
call s:HL('cssClassName', 'ronchi', '', 'none')

" }}}
" Diff {{{

call s:HL('gitDiff', 'lightgravel', '',)

call s:HL('diffRemoved', 'taffy', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'coal', 'taffy', 'bold')
call s:HL('diffNewFile', 'coal', 'taffy', 'bold')

call s:HL('diffLine', 'coal', 'ronchi', 'bold')
call s:HL('diffSubname', 'ronchi', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'dirtyblonde', '',)
call s:HL('djangoTagBlock', 'ronchi', '')
call s:HL('djangoVarBlock', 'ronchi', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
"
" Go {{{
"
call s:HL('goConstants', 'portage')
" after the dot type
" Match a sequence of word characters coming after a '.
call s:HL('goField', 'springrain')
" func name
call s:HL('goDeclaration', 'flamingo')
" struct, interface...
call s:HL('goDeclType', 'ronchi')
" # append, make, len...
call s:HL('goBuiltins', 'tanhide')
call s:HL('goParamName', 'portage')
" function name
call s:HL('goFunction', 'lime')
" operators * = + :=
call s:HL('goOperator', 'lightgravel')
" types, string int64 float64
call s:HL('goType', 'tacao')
call s:HL('goSignedInts', 'tacao')
call s:HL('goUnsignedInts', 'tacao')
call s:HL('goFloats', 'tacao')
call s:HL('goComplexes', 'tacao')
call s:HL('goExtraType', 'tacao')
call s:HL('goReceiverType', 'tacao')
call s:HL('goTypeDecl', 'flamingo')
call s:HL('goTypeName', 'tacao')
" hi! link goDirective GruvboxAqua
" hi! link goConstants GruvboxPurple
" hi! link goDeclaration GruvboxRed
" hi! link goDeclType GruvboxBlue
" hi! link goBuiltins GruvboxOrange
" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'darkroast', 'bg', 'none')
call s:HL('htmlEndTag', 'darkroast', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'coffee', '', 'bold')
call s:HL('htmlSpecialTagName', 'coffee', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')

" Attributes
call s:HL('htmlArg', 'coffee', '', 'none')

" Stuff inside an <a> tag

if g:badwolf_html_link_underline
    call s:HL('htmlLink', 'lightgravel', '', 'underline')
else
    call s:HL('htmlLink', 'lightgravel', '', 'none')
endif

" }}}
" Java {{{

call s:HL('javaClassDecl', 'taffy', '', 'bold')
call s:HL('javaScopeDecl', 'taffy', '', 'bold')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'snow', '', 'none')
call s:HL('javaDocParam', 'dalespale', '', '')

" }}}

" JavaScript {{{
"
call s:HL('javascriptTSVariableBuiltin', 'snow', '', 'italic')
call s:HL('@variable.builtin.tsx', 'snow', '', 'italic')
call s:HL('@variable.builtin.ts', 'snow', '', 'italic')
call s:HL('@variable.builtin.typescript', 'snow', '', 'italic')
call s:HL('@variable.tsx', 'plain', '', '')
call s:HL('@variable.ts', 'plain', '', '')
call s:HL('@property.typescript', 'indiankhaki', '', '')
call s:HL('@variable.typescript', 'plain', '', '')
call s:HL('javascriptTSProperty', 'plain', '', '')
call s:HL('javascriptTSTagDelimiter', 'gravel', '', '')
call s:HL('@tag.delimiter.tsx', 'gravel', '', '')
call s:HL('javascriptTSJsxProp', 'indiankhaki', '', 'none')
call s:HL('@jsx.prop', 'indiankhaki', '', 'none')
call s:HL('javascriptTSJsxElement', 'taffy', '', 'none')
call s:HL('@jsx.element', 'taffy', '', 'none')
call s:HL('javascriptTSJsxCloseElement', 'thistle', '', 'none')
call s:HL('@jsx.close.element', 'thistle', '', 'none')
call s:HL('javascriptTSConstructor', 'lime', '', '')
call s:HL('@constructor.tsx', 'lime', '', '')
call s:HL('javascriptTSReturn', 'flamingo', '', '')
call s:HL('@return.tsx', 'flamingo', '', '')
call s:HL('javascriptTSDot', 'gravel')
call s:HL('@dot.tsx', 'gravel')
call s:HL('javascrtipTSJsxNameSpace', 'lime')
call s:HL('@jsx.namespace.tsx', 'lime')
call s:HL('@namespace.tsx', 'lime')
call s:HL('@include.ts', 'lime')
call s:HL('@include.typescript', 'lime')
call s:HL('jsdocTSKeyword', 'gravel')
call s:HL('@keyword.typescript', 'lime')
call s:HL('typescriptImport', 'lime')
call s:HL('TSObjectPairKey', 'indiankhaki')
call s:HL('@object.pair.key.tsx', 'indiankhaki')
call s:HL('javascriptTSJsxReactHook', 'monotaffy')

" call s:HL('TSPropertyIdentifier', 'dress', '')
" call s:HL('javascriptTSAttribute', 'saltwatertaffy', '')


call s:HL('javascriptTSIdentifier', 'saltwatertaffy', '', 'none')
call s:HL('@identifier.tsx', 'saltwatertaffy', '', 'none')
call s:HL('javascriptTSFunction', 'ronchi', '', 'none')
call s:HL('@function.tsx', 'ronchi', '', 'none')
call s:HL('@function.call.tsx', 'ronchi')

call s:HL('jsThis', 'snow', '', 'italic')
call s:HL('jsStorageClass', 'tanhide')
call s:HL('jsGlobalObjects', 'indiankhaki')
call s:HL('jsSuper', 'dress')
call s:HL('jsDot', 'gravel')
call s:HL('jsTemplateString', 'snow', '', 'italic')
call s:HL('jsTemplateExpression', 'lightgravel')
call s:HL('jsDecorator', 'mediumgravel')
call s:HL('jsDecoratorFunction', 'gravel')

call s:HL('jsClassProperty', 'taffy')
call s:HL('jsClassDefinition', 'tuliptree')
call s:HL('jsCatch', 'tuliptree')
call s:HL('jsTry', 'tuliptree')

" function(Map =>)
call s:HL('jsFuncArgs', 'zinnwaldite')
call s:HL('jsArrowFuncArgs', 'dress')
call s:HL('@variable', 'plain')
call s:HL('@lsp.type.variable', 'plain')
call s:HL('@lsp.type.parameter', 'plain')
call s:HL('@lsp.typemod.parameter', 'ronchi')
call s:HL('@variable.definition', 'plain')
call s:HL('@variable.tsx', 'plain')
call s:HL('@variable.typescript', 'plain')
call s:HL('@variable.typescriptreact', 'plain')

call s:HL('jsClassFuncName', 'tuliptree', '', 'none')
call s:HL('@function.name', 'ronchi')
call s:HL('jsFuncName', 'ronchi')
call s:HL('jsFuncCall', 'ronchi')
call s:HL('TSJsxFunctionCall', 'ronchi')
call s:HL('jsObjectFuncName', 'taffy')
call s:HL('jsObjectValue', 'plain')
call s:HL('jsObjectProp', 'plain')
call s:HL('javascriptTSArrow', 'dress')
call s:HL('javascriptTSExport', 'tuliptree')
"
"
call s:HL('jsFuncArgExpression', 'saltwatertaffy')
call s:HL('jsArguments', 'saltwatertaffy')
call s:HL('jsOperator', 'gravel')

call s:HL('jsClassKeyword', 'taffy')
call s:HL('jsClassMethodType', 'taffy')
call s:HL('jsAsyncKeyword', 'taffy')

call s:HL('jsObjectKeyComputed', 'lightgravel')
call s:HL('jsBooleanTrue', 'tacao')
call s:HL('jsBooleanFalse', 'tacao')
call s:HL('jsNumber', 'tacao')
call s:HL('jsFloat', 'tacao')
call s:HL('@property.tsx', 'plain')

" call s:HL('jsReturn', 'flamingo')

" Flow Array<Type>
call s:HL('jsFlowReturnGroup', 'botticelli')
call s:HL('jsFlowType', 'botticelli')
call s:HL('jsFlowObject', 'botticelli')
" Array<Type>
call s:HL('jsFlowTypeCustom', 'botticelli')
call s:HL('jsFlowTypeStatement', 'botticelli')
call s:HL('jsFlowDefinition', 'botticelli')
call s:HL('jsFlowClassGroup', 'botticelli')
" the class definition inside the main class
call s:HL('jsFlowClassDef', 'botticelli')

"
" call s:HL('jsFlowTypeValue', 'dress')
" call s:HL('jsFlowObjectGeneric', 'ronchi')
" call s:HL('jsFlowTypeKeyword', 'dress')

call s:HL('jsFlowWildcardReturn', 'lightgravel')
call s:HL('jsFlowReturnMaybe', 'lightgravel')

" JSX
"
"
" hi! link jsxOpenPunct Comment
" hi! link jsxPunct Comment
" hi! link jsxClosePunct Comment
call s:HL('jsxCloseString', 'thistle')
call s:HL('jsxPunct', 'gravel')
call s:HL('jsxOpenPunct', 'gravel')
call s:HL('jsxAttrib', 'indiankhaki')
call s:HL('jsxTag', 'taffy')

" }}s
" LaTeX {{{

call s:HL('texStatement', 'tardis', '', 'none')
call s:HL('texMathZoneX', 'ronchi', '', 'none')
call s:HL('texMathZoneA', 'ronchi', '', 'none')
call s:HL('texMathZoneB', 'ronchi', '', 'none')
call s:HL('texMathZoneC', 'ronchi', '', 'none')
call s:HL('texMathZoneD', 'ronchi', '', 'none')
call s:HL('texMathZoneE', 'ronchi', '', 'none')
call s:HL('texMathZoneV', 'ronchi', '', 'none')
call s:HL('texMathZoneX', 'ronchi', '', 'none')
call s:HL('texMath', 'ronchi', '', 'none')
call s:HL('texMathMatcher', 'ronchi', '', 'none')
call s:HL('texRefLabel', 'dirtyblonde', '', 'none')
call s:HL('texRefZone', 'lime', '', 'none')
call s:HL('texComment', 'darkroast', '', 'none')
call s:HL('texDelimiter', 'ronchi', '', 'none')
call s:HL('texZone', 'brightgravel', '', 'none')

augroup badwolf_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'lime', '', 'none')

" }}}
" Lispyscript {{{

call s:HL('lispyscriptDefMacro', 'lime', '', '')
call s:HL('lispyscriptRepeat', 'dress', '', 'none')

" }}}
" REPLs {{{
" This isn't a specific plugin, but just useful highlight classes for anything
" that might want to use them.

call s:HL('replPrompt', 'tardis', '', 'bold')

" }}}
" Mail {{{

call s:HL('mailSubject', 'ronchi', '', 'bold')
call s:HL('mailHeader', 'lightgravel', '', '')
call s:HL('mailHeaderKey', 'lightgravel', '', '')
call s:HL('mailHeaderEmail', 'snow', '', '')
call s:HL('mailURL', 'toffee', '', 'underline')
call s:HL('mailSignature', 'gravel', '', 'none')

call s:HL('mailQuoted1', 'gravel', '', 'none')
call s:HL('mailQuoted2', 'dress', '', 'none')
call s:HL('mailQuoted3', 'dirtyblonde', '', 'none')
call s:HL('mailQuoted4', 'ronchi', '', 'none')
call s:HL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'snow', '', 'bold')
call s:HL('markdownBold', 'snow', '', 'bold')
call s:HL('markdownH1', 'ronchi', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'toffee', '', 'underline')
call s:HL('markdownIdDeclaration', 'toffee')
call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
call s:HL('markdownUrl', 'toffee', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call s:HL('markdownCode', 'dirtyblonde', '', 'none')
call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'dress', '', 'bold')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'dress')
call s:HL('pythonBuiltinObj',  'dress')
call s:HL('pythonBuiltinFunc', 'dress')
call s:HL('pythonEscape',      'dress')
call s:HL('pythonException',   'lime', '', 'bold')
call s:HL('pythonExceptions',  'lime', '', 'none')
call s:HL('pythonPrecondit',   'lime', '', 'none')
call s:HL('pythonDecorator',   'taffy', '', 'none')
call s:HL('pythonRun',         'gravel', '', 'bold')
call s:HL('pythonCoding',      'gravel', '', 'bold')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gravel')
call s:HL('hlLevel1', 'ronchi')
call s:HL('hlLevel2', 'saltwatertaffy')
call s:HL('hlLevel3', 'dress')
call s:HL('hlLevel4', 'coffee')
call s:HL('hlLevel5', 'dirtyblonde')
call s:HL('hlLevel6', 'ronchi')
call s:HL('hlLevel7', 'saltwatertaffy')
call s:HL('hlLevel8', 'dress')
call s:HL('hlLevel9', 'coffee')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')

call s:HL('VimMapMod',    'dress', '', 'none')
call s:HL('VimMapModKey', 'dress', '', 'none')
call s:HL('VimNotation', 'dress', '', 'none')
call s:HL('VimBracket', 'dress', '', 'none')

" }}}

" Ruby and Ruby on Rails {{{
"
call s:HL('rubyInterpolationDelimiter', 'snow', '', 'none')
call s:HL('rubyCurlyBlockDelimiter', 'gravel', '', 'none')
call s:HL('rubyStringDelimiter', 'tanhide', '', 'none')
call s:HL('rubyBoolean', 'tacao', '', 'none')
call s:HL('rubyLambdaOperator', 'springrain', '', 'none')
call s:HL('rubyProcOperator', 'springrain', '', 'none')
call s:HL('rubyArithmeticOperator', 'taffy', '', 'none')
call s:HL('rubyPercentStringDelimiter', 'tanhide', '', 'none')
call s:HL('rubyArrayDelimiter', 'gravel', '', 'none')
call s:HL('rubyCurlyBlockDelimiter', 'gravel', '', 'none')
call s:HL('rubyInstanceVariable', 'tacao', '', 'bold')
call s:HL('rubyKeyword', 'taffy', '', 'none')
call s:HL('rubyHelper', 'ronchi', '', 'none')

call s:HL('rubySquareBracketEscape', 'gravel', '', 'none')
call s:HL('rubyNestedSquareBrackets', 'gravel', '', 'none')
call s:HL('rubyOperator', 'gravel', '', 'none')
call s:HL('rubyPseudoOperator', 'plain', '', 'none')
call s:HL('rubySuperClassOperator', 'tacao', '', 'none')
call s:HL('rubyScopeOperator', 'plain', '', 'none')
call s:HL('rubyBooleanOperator', 'taffy', '', 'none')
call s:HL('rubyAssignmentOperator', 'lightgravel', '', 'none')
call s:HL('rubyRangeOperator', 'taffy', '', 'none')
call s:HL('rubySymbol', 'coffee', '', 'none')
call s:HL('rspecMatchers', 'ronchi', '', 'none')

call s:HL('@symbol.ruby', 'coffee', '', 'none')
call s:HL('@conditional.ruby', 'taffy', '', 'none')
call s:HL('@constant.builtin.ruby', 'coffee', '', 'none')
call s:HL('@variable.ruby', 'plain', '', 'none')
call s:HL('@parameter.ruby', 'coffee', '', 'none')
call s:HL('@instance_variable.ruby', 'tacao', '', 'none')
call s:HL('@sorbet.signature.ruby', 'plain', '', 'none')
call s:HL('@operator.ruby', 'gravel', '', 'none')
call s:HL('@function.ruby', 'ronchi', '', 'none')
call s:HL('@define.ruby', 'lime', '', '')
call s:HL('@keyword.ruby', 'lime', '', '')
call s:HL('@ruby.module', 'taffy', '', '')
call s:HL('@punctuation.bracket.ruby', 'gravel', '', 'none')
call s:HL('@extends.ruby', 'deco', '', 'none')
call s:HL('@ruby.entity.ruby', 'deco', '', 'none')
call s:HL('@ruby.end.ruby', 'taffy', '', 'none')
call s:HL('@ruby.return.ruby', 'taffy', '', 'none')
call s:HL('rubyTSBlockParameterList', 'indiankhaki', '', 'none')
call s:HL('@rspec.keyword.ruby', 'taffy', '', 'none')
call s:HL('@rspec.test.macro.ruby', 'taffy', '', 'bold')
call s:HL('@rspec.before.and.after.ruby', 'dalespale', '', 'none')
call s:HL('@rspec.keyword.ruby', 'taffy', '', 'bold')
call s:HL('@rspec.matchers.ruby', 'dalespale', '', 'none')
call s:HL('@ruby.accessor.ruby', 'deco', '', 'none')
call s:HL('rubyTSPunctSpecial', 'tanhide', '', 'none')
call s:HL('rubyTSPunctDelimiter', 'tanhide', '', 'none')
call s:HL('rubyTSVariableBuiltin', 'toffee', '', 'none')
call s:HL('@none.ruby', 'plain', 'newblackgravel')
call s:HL('@ruby.include.ruby', 'lime', '', 'none')
call s:HL('@ruby.method.end.ruby', 'taffy', '', 'none')
call s:HL('@ruby.method.def.ruby', 'lime', '', 'none')
call s:HL('@string.special.symbol.ruby', 'coffee', '', 'none')


" highlight! link rubyTSSymbol GreenBold
" highlight! link rubyTSRubyMacro RedItalic
" highlight! link rubyTSModuleName Purple
" highlight! link rubyTSAttribute Yellow
" highlight! link rubyTSBlockParameterList Blue
" highlight! link rubyTSInstanceVariable Blue
" highlight! link rubyTSParameter Blue
" highlight! link rubyTSMacro RedItalic
" highlight! link rubyTSSorbetSignature Normal
" highlight! link rubyTSSorbetSignature Normal
" highlight! link rubyTSExtends RedItalic

" }}}

" }}}
