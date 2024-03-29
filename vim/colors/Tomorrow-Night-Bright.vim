"Tomorrow Night Bright - Full Colour and 256 Colour
" http://chriskempson.com
"
" Hex colour conversion functions borrowed from the theme "Desert256""

" Default GUI Colours
let s:foreground = "d0d0d0"
let s:background = ""
let s:selection = "424242"
let s:line = "2a2a2a"
let s:comment = "767876"
let s:red_old = "df6566"
let s:red = 'e06c75'
let s:orange = "ed9e56"
let s:yellow = "ecce58"
let s:green = "c5d15c"
let s:aqua = "81cabf"
let s:blue = "8cb6e1"
let s:purple = "cfabe0"
let s:window = "4d5057"
let s:diffbg = "232323"
let s:ice = "d6e9ff"
let s:light_yellow = "c8ae9d"
let s:petrol = "55606D"
let s:grey = "abb2bf"

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

hi clear
syntax reset

let g:colors_name = "Tomorrow-Night-Bright"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun <SID>grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun <SID>grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun <SID>grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun <SID>rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun <SID>rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun <SID>rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun <SID>colour(r, g, b)
		" Get the closest grey
		let l:gx = <SID>grey_number(a:r)
		let l:gy = <SID>grey_number(a:g)
		let l:gz = <SID>grey_number(a:b)

		" Get the closest colour
		let l:x = <SID>rgb_number(a:r)
		let l:y = <SID>rgb_number(a:g)
		let l:z = <SID>rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = <SID>grey_level(l:gx) - a:r
			let l:dgg = <SID>grey_level(l:gy) - a:g
			let l:dgb = <SID>grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = <SID>rgb_level(l:gx) - a:r
			let l:dg = <SID>rgb_level(l:gy) - a:g
			let l:db = <SID>rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return <SID>grey_colour(l:gx)
			else
				" Use the colour
				return <SID>rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return <SID>rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

	" Vim Highlighting
	call <SID>X("Normal", s:foreground, "1d1e1f", "")
	call <SID>X("LineNr", s:comment, "202325", "none")
	call <SID>X("CursorLineNr", s:yellow, "202325", "none")
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:background, s:yellow, "")
	call <SID>X("TabLine", s:line, s:foreground, "reverse")
	call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
	call <SID>X("TabLineSel", s:foreground, s:background, "reverse")
	call <SID>X("StatusLine", s:window, s:yellow, "reverse")
	call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
	call <SID>X("VertSplit", "202325", "202325", "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", "aaaaaa", "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:red, "", "")
	call <SID>X("MatchParen", "", s:selection, "")
	call <SID>X("Folded", s:comment, '202325', "")
	call <SID>X("FoldColumn", "", "202325", "")
	call <SID>X("SignColumn", s:comment, "202325", "none")
	call <SID>X("ExtraWhitespace", "", s:red, "")
	if version >= 700
		call <SID>X("CursorLine", "", s:line, "none")
		call <SID>X("CursorColumn", "", s:line, "none")
		call <SID>X("PMenu", s:foreground, s:selection, "none")
		call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", s:line, "none")
	end

	" Standard Highlighting
	call <SID>X("Constant", s:orange, "", "")
	call <SID>X("String", s:green, "", "")

	call <SID>X("Comment", s:comment, "", "italic")
	call <SID>X("SpecialComment", s:comment, "", "italic")
	call <SID>X("Todo", s:foreground, "", "bold")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:blue, "", "none")
	call <SID>X("Statement", s:purple, "", "")
	call <SID>X("Conditional", s:purple, "", "")
	call <SID>X("Repeat", s:purple, "", "")
	call <SID>X("Function", s:blue, "", "")
	call <SID>X("Operator", s:aqua, "", "none")

	call <SID>X("Type", s:purple, "", "none")
	call <SID>X("StorageClass", s:purple, "", "none")
	call <SID>X("Structure", s:purple, "", "")
	call <SID>X("Typedef", s:purple, "", "")
	call <SID>X("Keyword", s:purple, "", "")

	call <SID>X("Special", s:red, "", "")
	call <SID>X("SpecialChar", s:red, "", "")
	call <SID>X("Tag", s:red, "", "")
	call <SID>X("Delimiter", s:aqua, "", "")
	call <SID>X("Debug", s:red, "", "")

	call <SID>X("PreProc", s:red, "", "none")
	call <SID>X("Define", s:orange, "", "none")
	call <SID>X("Include", s:orange, "", "")
	call <SID>X("Macro", s:red, "", "")
	call <SID>X("PreCondit", s:orange, "", "")
	call <SID>X("EndOfBuffer", "1d1e1f", "1d1e1f", "")
	"call <SID>X("Ignore", "666666", "", "")

	" Vim Highlighting
	" call <SID>X("vimCommand", s:red, "", "none")

	" C Highlighting
	call <SID>X("cType", s:yellow, "", "")
	call <SID>X("cStorageClass", s:purple, "", "")
	call <SID>X("cConditional", s:purple, "", "")
	call <SID>X("cRepeat", s:purple, "", "")

	" PHP Highlighting
	call <SID>X("phpVarSelector", s:red, "", "")
	call <SID>X("phpKeyword", s:purple, "", "")
	call <SID>X("phpRepeat", s:purple, "", "")
	call <SID>X("phpConditional", s:purple, "", "")
	call <SID>X("phpStatement", s:purple, "", "")
	call <SID>X("phpMemberSelector", s:foreground, "", "")

	" Ruby Highlighting
	call <SID>X("rubySymbol", s:red, "", "")
	call <SID>X("rubyMacro", s:purple, "", "")
	call <SID>X("rubyEntities", s:purple, "", "")
	call <SID>X("rubyConstant", s:orange, "", "")
	call <SID>X("rubyAccess", s:yellow, "", "")
	call <SID>X("rubyAttribute", s:blue, "", "")
	call <SID>X("rubyInclude", s:blue, "", "")
	call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("rubyCurlyBlock", s:foreground, "", "")
	call <SID>X("rubyStringDelimiter", s:green, "", "")
	call <SID>X("rubyConditional", s:purple, "", "")
	call <SID>X("rubyRepeat", s:purple, "", "")
	call <SID>X("rubyControl", s:purple, "", "")
	call <SID>X("rubyException", s:purple, "", "")
	call <SID>X("rubyDefine", s:purple, "", "")
	call <SID>X("rubyClass", s:purple, "", "")
	call <SID>X("rubyClassDeclaration", s:orange, "", "")
	call <SID>X("rubyArrayDelimiter", s:aqua, "", "")
	call <SID>X("rubyInterpolationDelimiter", s:aqua, "", "")
	call <SID>X("rubyCurlyBlockDelimiter", s:aqua, "", "")
	call <SID>X("rubyTodo", s:comment, "", "bold")

	" Python Highlighting
	call <SID>X("pythonInclude", s:purple, "", "")
	call <SID>X("pythonStatement", s:purple, "", "")
	call <SID>X("pythonConditional", s:purple, "", "")
	call <SID>X("pythonRepeat", s:purple, "", "")
	call <SID>X("pythonException", s:purple, "", "")
	call <SID>X("pythonFunction", s:blue, "", "")
	call <SID>X("pythonPreCondit", s:purple, "", "")
	call <SID>X("pythonRepeat", s:aqua, "", "")
	call <SID>X("pythonExClass", s:orange, "", "")

	" JavaScript Highlighting
	call <SID>X("javaScriptBraces", s:foreground, "", "")
	call <SID>X("javaScriptFunction", s:purple, "", "")
	call <SID>X("javaScriptConditional", s:purple, "", "")
	call <SID>X("javaScriptRepeat", s:purple, "", "")
	call <SID>X("javaScriptNumber", s:orange, "", "")
	call <SID>X("javaScriptMember", s:orange, "", "")
  call <SID>X("javascriptNull", s:orange, "", "")
  call <SID>X("javascriptGlobal", s:blue, "", "")
  call <SID>X("javascriptStatement", s:red, "", "")

  call <SID>X("jsCommentTodo", s:foreground, "", "bold")
  call <SID>X("jsDecorator", s:comment, "", "bold")
  call <SID>X("jsDecoratorFunction", s:comment, "", "")

  call <SID>X('jsThis', s:red, "", "")
  " call <SID>X('jsStorageClass', s:light_yellow, "", "")
  " call <SID>X('jsGlobalObjects', 'indiankhaki')
  " call <SID>X('jsSuper', 'dress')
  " call <SID>X('jsDot', 'gravel')
  " call <SID>X('jsTemplateString', 'snow', '', 'italic')
  " call <SID>X('jsTemplateExpression', 'lightgravel')
  "
  " call <SID>X('jsClassProperty', 'taffy')
  " call <SID>X('jsClassDefinition', 'tuliptree')
  " call <SID>X('jsCatch', 'tuliptree')
  " call <SID>X('jsTry', 'tuliptree')
  "
  " " function(Map =>)
  " call <SID>X('jsFuncArgs', 'zinnwaldite')
  " call <SID>X('jsArrowFuncArgs', 'dress')
  " call <SID>X('jsArrowFunction', 'dress')
  "
  " call <SID>X('jsClassFuncName', 'tuliptree', '', 'none')
  " call <SID>X('jsFuncName', 'ronchi')
  " call <SID>X('jsFuncCall', 'ronchi')
  " call <SID>X('jsObjectFuncName', 'taffy')
  " call <SID>X('jsObjectValue', 'plain')
  " call <SID>X('jsObjectProp', 'plain')
  "
  " call <SID>X('jsExportDefault', 'tuliptree')
  "
  "
  " call <SID>X('jsFuncArgExpression', 'saltwatertaffy')
  " call <SID>X('jsArguments', 'saltwatertaffy')
  " call <SID>X('jsOperator', 'gravel')
  "
  " call <SID>X('jsClassKeyword', 'taffy')
  " call <SID>X('jsClassMethodType', 'taffy')
  " call <SID>X('jsAsyncKeyword', 'taffy')
  "
  " call <SID>X('jsObjectKeyComputed', 'lightgravel')
  " call <SID>X('jsBooleanTrue', 'tacao')
  " call <SID>X('jsBooleanFalse', 'tacao')
  " call <SID>X('jsNumber', 'tacao')
  " call <SID>X('jsFloat', 'tacao')
  "
  " call <SID>X('jsReturn', 'flamingo')

  " #dcdfe4
  " Flow Array<Type>
  call <SID>X('jsFlowReturnGroup', s:ice, "", "")
  call <SID>X('jsFlowType', s:light_yellow, "", "")
  call <SID>X('jsFlowObject', s:ice, "", "")
  " Array<Type>
  call <SID>X('jsFlowTypeCustom', s:ice, "", "")
  call <SID>X('jsFlowTypeStatement', s:ice, "", "")
  call <SID>X('jsFlowDefinition', s:ice, "", "")
  call <SID>X('jsFlowClassGroup', s:ice, "", "")
  " the class definition inside the main class
  call <SID>X('jsflowclassdef', s:ice, "", "")

  "
  " call <SID>X('jsFlowTypeValue', 'dress')
  " call <SID>X('jsFlowObjectGeneric', 'ronchi')
  " call <SID>X('jsFlowTypeKeyword', 'dress')

  call <SID>X('jsFlowWildcardReturn', s:comment, "", "")
  call <SID>X('jsFlowReturnMaybe', s:comment, "", "")
  "
  " JSX
  "
  "
  " hi! link jsxOpenPunct Comment
  " hi! link jsxPunct Comment
  " hi! link jsxClosePunct Comment
  "
  call <SID>X('jsxCloseString', s:grey, "", "")
  call <SID>X('jsxPunct', s:comment, "", "")
  call <SID>X('jsxOpenPunct', s:grey, "", "")
  call <SID>X('jsxAttrib', s:light_yellow, "", "")
  call <SID>X('jsxTag', s:blue, "", "")


	" HTML Highlighting
	call <SID>X("htmlTag", s:red, "", "")
	call <SID>X("htmlTagName", s:red, "", "")
	call <SID>X("htmlArg", s:red, "", "")
	call <SID>X("htmlScriptTag", s:red, "", "")

	" Diff Highlighting
	call <SID>X("diffAdded", s:green, "", "")
	call <SID>X("diffRemoved", s:red, "", "")
	call <SID>X("diffSubname", s:foreground, "", "")
	call <SID>X("DiffDelete", s:red, s:diffbg, "")
	call <SID>X("DiffAdd", s:green, s:diffbg, "")
	call <SID>X("DiffText", s:blue, s:diffbg, "")
	call <SID>X("DiffChange", s:yellow, s:diffbg, "")
	call <SID>X("DiffNewFile", s:green, s:diffbg, "")
	call <SID>X("DiffAdded", s:green, s:diffbg, "")

	" Lua Highlighting
	call <SID>X("luaStatement", s:purple, "", "")
	call <SID>X("luaRepeat", s:purple, "", "")
	call <SID>X("luaCondStart", s:purple, "", "")
	call <SID>X("luaCondElseif", s:purple, "", "")
	call <SID>X("luaCond", s:purple, "", "")
	call <SID>X("luaCondEnd", s:purple, "", "")

	" Cucumber Highlighting
	call <SID>X("cucumberGiven", s:blue, "", "")
	call <SID>X("cucumberGivenAnd", s:blue, "", "")

	" Go Highlighting
	call <SID>X("goDirective", s:purple, "", "")
	call <SID>X("goDeclaration", s:purple, "", "")
	call <SID>X("goStatement", s:purple, "", "")
	call <SID>X("goConditional", s:purple, "", "")
	call <SID>X("goConstants", s:orange, "", "")
	call <SID>X("goTodo", s:yellow, "", "")
	call <SID>X("goDeclType", s:blue, "", "")
	call <SID>X("goBuiltins", s:purple, "", "")

  " Rust highlighting
	call <SID>X("rustSigil", s:aqua, "", "")
	call <SID>X("rustAssert", s:red, "", "")
	call <SID>X("rustLifetime", s:red, "", "italic")
	call <SID>X("rustSelf", s:purple, "", "")
	call <SID>X("rustModPathSep", s:orange, "", "")
	call <SID>X("rustTodo", s:yellow, "", "bold")

    call <SID>X("SpellBad", "", "", "underline")

	call <SID>X("yamlKeyValueDelimiter", s:aqua, "", "")
	call <SID>X("yamlTodo", s:yellow, "", "bold")

	" Git Highlighting
	call <SID>X("gitcommitSelectedType", s:green, "", "")
	call <SID>X("gitcommitSelectedFile", s:foreground, "", "")
	call <SID>X("gitcommitDiscardedType", s:red, "", "")
	call <SID>X("gitcommitDiscardedFile", s:foreground, "", "")
	call <SID>X("gitcommitHeader", s:yellow, "", "")
	call <SID>X("gitcommitBranch", s:blue, "", "")
	call <SID>X("gitcommitSummary", s:purple, "", "bold")
	call <SID>X("gitcommitUntrackedFile", s:comment, "", "")

	call <SID>X("mkdCode", s:purple, "", "")
	call <SID>X("mkdListItem", s:aqua, "", "")
	call <SID>X("mkdLink", s:blue, "", "")
	call <SID>X("mkdURL", s:comment, "", "")
	call <SID>X("htmlH1", s:red, "", "")
	call <SID>X("htmlH2", s:orange, "", "")
	call <SID>X("htmlH3", s:orange, "", "")
	call <SID>X("htmlH4", s:orange, "", "")
	call <SID>X("htmlH5", s:orange, "", "")
	call <SID>X("htmlH6", s:orange, "", "")

	" Delete Functions
	delf <SID>X
	delf <SID>rgb
	delf <SID>colour
	delf <SID>rgb_colour
	delf <SID>rgb_level
	delf <SID>rgb_number
	delf <SID>grey_colour
	delf <SID>grey_level
	delf <SID>grey_number
endif

set background=dark
