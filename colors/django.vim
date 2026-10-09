" ==============================================================================
" Name:        Django
" Description: Dark green color scheme based on the Windows Terminal Django palette
" Maintainer:  Alex Zolotarov <alex@zolotarov.email>
" License:     MIT
" ==============================================================================

highlight clear
if exists("syntax_on")
  syntax reset
endif

let s:save_cpo = &cpo
set cpo&vim

let g:colors_name = "django"
set background=dark

" ------------------------------------------------------------------------------
" Windows Terminal Django Palette:
"   Background:          #0b2f20 (Classic Django deep forest green)
"   SelectionBackground: #245032 (Deep pine / selection)
"   CursorColor:         #336442 (Muted forest cursor)
"   Foreground:          #f8f8f8 (Crisp off-white)
"
" Normal Colors:
"   Black:   #000000  |  Red:     #fd6209  |  Green:   #41a83e  |  Yellow:  #ffe862
"   Blue:    #315d3f  |  Purple:  #f8f8f8  |  Cyan:    #9df39f  |  White:   #ffffff
"
" Bright Colors:
"   Black:   #585858  |  Red:     #ff943b  |  Green:   #73da70  |  Yellow:  #ffff94
"   Blue:    #568264  |  Purple:  #ffffff  |  Cyan:    #cfffd1  |  White:   #ffffff
" ------------------------------------------------------------------------------

let g:terminal_ansi_colors = [
      \ '#000000', '#fd6209', '#41a83e', '#ffe862',
      \ '#315d3f', '#f8f8f8', '#9df39f', '#ffffff',
      \ '#585858', '#ff943b', '#73da70', '#ffff94',
      \ '#568264', '#ffffff', '#cfffd1', '#ffffff'
      \ ]

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#fd6209'
let g:terminal_color_2  = '#41a83e'
let g:terminal_color_3  = '#ffe862'
let g:terminal_color_4  = '#315d3f'
let g:terminal_color_5  = '#f8f8f8'
let g:terminal_color_6  = '#9df39f'
let g:terminal_color_7  = '#ffffff'
let g:terminal_color_8  = '#585858'
let g:terminal_color_9  = '#ff943b'
let g:terminal_color_10 = '#73da70'
let g:terminal_color_11 = '#ffff94'
let g:terminal_color_12 = '#568264'
let g:terminal_color_13 = '#ffffff'
let g:terminal_color_14 = '#cfffd1'
let g:terminal_color_15 = '#ffffff'

" ------------------------------------------------------------------------------
" User Options
" ------------------------------------------------------------------------------
let s:italic_comments = get(g:, 'django_italic_comments', 1)
let s:bold_keywords = get(g:, 'django_bold_keywords', 1)
let s:bold_functions = get(g:, 'django_bold_functions', 0)
let s:transparent_bg = get(g:, 'django_transparent_background', 0)

" ------------------------------------------------------------------------------
" Palette Definition
" ------------------------------------------------------------------------------
" Backgrounds
let s:bg          = s:transparent_bg ? 'NONE' : '#0b2f20'
let s:bg_dark     = s:transparent_bg ? 'NONE' : '#072016'
let s:bg_light    = '#133d2b'
let s:bg_panel    = '#103727'
let s:selection   = '#245032'
let s:selection_hi = '#336442'

" Foregrounds
let s:fg          = '#f8f8f8'
let s:fg_dim      = '#585858'
let s:gutter_fg   = '#568264'

" Accent / Syntax Colors (directly mapped from Windows Terminal Django scheme)
let s:comment     = '#568264'
let s:string      = '#9df39f'
let s:string_hi   = '#cfffd1'
let s:keyword     = '#ffe862'
let s:func        = '#ffff94'
let s:type        = '#73da70'
let s:constant    = '#41a83e'
let s:number      = '#ffff94'
let s:preproc     = '#fd6209'
let s:orange      = '#ff943b'
let s:cursor      = '#336442'
let s:white       = '#ffffff'

" Diagnostics & Diffs
let s:err_fg      = '#fd6209'
let s:err_bg      = '#4a1719'
let s:warn_fg     = '#ffe862'
let s:warn_bg     = '#3a3818'
let s:info_fg     = '#9df39f'
let s:info_bg     = '#103727'
let s:hint_fg     = '#cfffd1'
let s:hint_bg     = '#12442b'

let s:diff_add_fg = '#73da70'
let s:diff_add_bg = '#12442b'
let s:diff_del_fg = '#fd6209'
let s:diff_del_bg = '#4a1719'
let s:diff_chg_fg = '#ffe862'
let s:diff_chg_bg = '#3a3818'

" ------------------------------------------------------------------------------
" Highlighting Helper Function
" ------------------------------------------------------------------------------
function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  let l:cmd = 'highlight ' . a:group
  if a:guifg !=# ''
    let l:cmd .= ' guifg=' . a:guifg
  endif
  if a:guibg !=# ''
    let l:cmd .= ' guibg=' . a:guibg
  endif
  if a:ctermfg !=# ''
    let l:cmd .= ' ctermfg=' . a:ctermfg
  endif
  if a:ctermbg !=# ''
    let l:cmd .= ' ctermbg=' . a:ctermbg
  endif
  if a:attr !=# ''
    let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr
  else
    let l:cmd .= ' gui=NONE cterm=NONE'
  endif
  execute l:cmd
endfunction

" ------------------------------------------------------------------------------
" Editor UI
" ------------------------------------------------------------------------------
let s:cterm_bg = s:transparent_bg ? 'NONE' : '235'
let s:cterm_bg_dark = s:transparent_bg ? 'NONE' : '234'

call s:hi('Normal',       s:fg,          s:bg,          '15',   s:cterm_bg, '')
call s:hi('NormalNC',     s:fg_dim,      s:bg,          '240',  s:cterm_bg, '')
call s:hi('Visual',       '',            s:selection,   '',     '237',      '')
call s:hi('VisualNOS',    '',            s:selection,   '',     '237',      '')
call s:hi('Cursor',       s:fg,          s:cursor,      '15',   '239',      '')
call s:hi('lCursor',      s:fg,          s:cursor,      '15',   '239',      '')
call s:hi('CursorIM',     s:fg,          s:cursor,      '15',   '239',      '')
call s:hi('CursorLine',   '',            s:bg_light,    '',     '236',      '')
call s:hi('CursorColumn', '',            s:bg_light,    '',     '236',      '')
call s:hi('ColorColumn',  '',            s:bg_light,    '',     '236',      '')

call s:hi('LineNr',       s:gutter_fg,   s:bg,          '65',   s:cterm_bg, '')
call s:hi('CursorLineNr', s:keyword,     s:bg_light,    '221',  '236',      'bold')
call s:hi('SignColumn',   '',            s:bg,          '',     s:cterm_bg, '')
call s:hi('FoldColumn',   s:gutter_fg,   s:bg,          '65',   s:cterm_bg, '')
call s:hi('Folded',       s:string,      s:bg_light,    '157',  '236',      '')

call s:hi('VertSplit',    s:selection,   s:bg,          '237',  s:cterm_bg, '')
call s:hi('WinSeparator', s:selection,   s:bg,          '237',  s:cterm_bg, '')

call s:hi('StatusLine',   s:fg,          s:selection,   '15',   '237',      'bold')
call s:hi('StatusLineNC', s:fg_dim,      s:bg_dark,     '240',  s:cterm_bg_dark, '')
call s:hi('WildMenu',     s:bg,          s:keyword,     '235',  '221',      'bold')

call s:hi('TabLine',      s:fg_dim,      s:bg_dark,     '240',  s:cterm_bg_dark, '')
call s:hi('TabLineFill',  '',            s:bg_dark,     '',     s:cterm_bg_dark, '')
call s:hi('TabLineSel',   s:white,       s:selection,   '231',  '237',      'bold')

call s:hi('Search',       s:bg,          s:keyword,     '235',  '221',      '')
call s:hi('IncSearch',    s:bg,          s:string,      '235',  '157',      'bold')
call s:hi('CurSearch',    s:bg,          s:string,      '235',  '157',      'bold')
call s:hi('MatchParen',   s:white,       s:selection_hi, '231', '239',      'bold')

call s:hi('Pmenu',        s:fg,          s:bg_panel,    '15',   '236',      '')
call s:hi('PmenuSel',     s:bg,          s:string,      '235',  '157',      'bold')
call s:hi('PmenuSbar',    '',            s:bg_dark,     '',     s:cterm_bg_dark, '')
call s:hi('PmenuThumb',   '',            s:selection,   '',     '237',      '')

call s:hi('EndOfBuffer',  s:bg,          s:bg,          s:cterm_bg, s:cterm_bg, '')
call s:hi('NonText',      s:selection,   '',            '237',  '',         '')
call s:hi('SpecialKey',   s:selection,   '',            '237',  '',         '')
call s:hi('Directory',    s:func,        '',            '228',  '',         'bold')
call s:hi('Title',        s:white,       '',            '231',  '',         'bold')

call s:hi('ModeMsg',      s:string,      '',            '157',  '',         'bold')
call s:hi('MoreMsg',      s:string,      '',            '157',  '',         '')
call s:hi('Question',     s:func,        '',            '228',  '',         'bold')
call s:hi('WarningMsg',   s:keyword,     '',            '221',  '',         'bold')
call s:hi('ErrorMsg',     s:err_fg,      s:err_bg,      '202',  '235',      'bold')
call s:hi('Conceal',      s:comment,     '',            '65',   '',         '')

" ------------------------------------------------------------------------------
" Diffs
" ------------------------------------------------------------------------------
call s:hi('DiffAdd',      s:diff_add_fg, s:diff_add_bg, '77',   '236',      '')
call s:hi('DiffChange',   s:diff_chg_fg, s:diff_chg_bg, '221',  '236',      '')
call s:hi('DiffDelete',   s:diff_del_fg, s:diff_del_bg, '202',  '235',      'bold')
call s:hi('DiffText',     s:white,       s:selection_hi, '231', '239',      'bold')

call s:hi('diffAdded',    s:diff_add_fg, '',            '77',   '',         '')
call s:hi('diffRemoved',  s:diff_del_fg, '',            '202',  '',         '')
call s:hi('diffChanged',  s:diff_chg_fg, '',            '221',  '',         '')
call s:hi('diffFile',     s:func,        '',            '228',  '',         'bold')
call s:hi('diffLine',     s:comment,     '',            '65',   '',         '')
call s:hi('diffIndexLine', s:preproc,    '',            '202',  '',         '')

" ------------------------------------------------------------------------------
" Spell Checking
" ------------------------------------------------------------------------------
call s:hi('SpellBad',     s:err_fg,      '',            '202',  '',         'undercurl')
call s:hi('SpellCap',     s:func,        '',            '228',  '',         'undercurl')
call s:hi('SpellLocal',   s:string,      '',            '157',  '',         'undercurl')
call s:hi('SpellRare',    s:orange,      '',            '209',  '',         'undercurl')

" ------------------------------------------------------------------------------
" Standard Syntax Highlighting
" ------------------------------------------------------------------------------
let s:comment_attr = s:italic_comments ? 'italic' : ''
let s:keyword_attr = s:bold_keywords ? 'bold' : ''
let s:func_attr = s:bold_functions ? 'bold' : ''

call s:hi('Comment',        s:comment,     '',            '65',   '',         s:comment_attr)

call s:hi('Constant',       s:constant,    '',            '71',   '',         '')
call s:hi('String',         s:string,      '',            '157',  '',         '')
call s:hi('Character',      s:string,      '',            '157',  '',         '')
call s:hi('Number',         s:number,      '',            '228',  '',         'bold')
call s:hi('Boolean',        s:keyword,     '',            '221',  '',         'bold')
call s:hi('Float',          s:number,      '',            '228',  '',         'bold')

call s:hi('Identifier',     s:fg,          '',            '15',   '',         '')
call s:hi('Function',       s:func,        '',            '228',  '',         s:func_attr)

call s:hi('Statement',      s:keyword,     '',            '221',  '',         s:keyword_attr)
call s:hi('Conditional',    s:keyword,     '',            '221',  '',         s:keyword_attr)
call s:hi('Repeat',         s:keyword,     '',            '221',  '',         s:keyword_attr)
call s:hi('Label',          s:keyword,     '',            '221',  '',         s:keyword_attr)
call s:hi('Operator',       s:fg,          '',            '15',   '',         '')
call s:hi('Keyword',        s:keyword,     '',            '221',  '',         s:keyword_attr)
call s:hi('Exception',      s:orange,      '',            '209',  '',         'bold')

call s:hi('PreProc',        s:preproc,     '',            '202',  '',         'bold')
call s:hi('Include',        s:preproc,     '',            '202',  '',         'bold')
call s:hi('Define',         s:preproc,     '',            '202',  '',         'bold')
call s:hi('Macro',          s:preproc,     '',            '202',  '',         'bold')
call s:hi('PreCondit',      s:preproc,     '',            '202',  '',         'bold')

call s:hi('Type',           s:type,        '',            '77',   '',         'bold')
call s:hi('StorageClass',   s:keyword,     '',            '221',  '',         s:keyword_attr)
call s:hi('Structure',      s:type,        '',            '77',   '',         'bold')
call s:hi('Typedef',        s:type,        '',            '77',   '',         'bold')

call s:hi('Special',        s:orange,      '',            '209',  '',         '')
call s:hi('SpecialChar',    s:string_hi,   '',            '194',  '',         '')
call s:hi('Tag',            s:constant,    '',            '71',   '',         '')
call s:hi('Delimiter',      s:fg,          '',            '15',   '',         '')
call s:hi('SpecialComment', s:fg_dim,      '',            '240',  '',         s:comment_attr)
call s:hi('Debug',          s:orange,      '',            '209',  '',         '')

call s:hi('Underlined',     '',            '',            '',     '',         'underline')
call s:hi('Ignore',         s:bg,          '',            s:cterm_bg, '',     '')
call s:hi('Error',          s:white,       s:preproc,     '231',  '202',      'bold')
call s:hi('Todo',           s:white,       s:preproc,     '231',  '202',      'bold')

" ------------------------------------------------------------------------------
" Python & Django Specific Highlights
" ------------------------------------------------------------------------------
call s:hi('pythonBuiltin',       s:func,     '', '228', '', '')
call s:hi('pythonBuiltinObj',    s:func,     '', '228', '', '')
call s:hi('pythonBuiltinFunc',   s:func,     '', '228', '', '')
call s:hi('pythonFunction',      s:func,     '', '228', '', s:func_attr)
call s:hi('pythonDecorator',     s:preproc,  '', '202', '', 'bold')
call s:hi('pythonDecoratorName', s:preproc,  '', '202', '', 'bold')
call s:hi('pythonExceptions',    s:orange,   '', '209', '', 'bold')
call s:hi('pythonClass',         s:type,     '', '77',  '', 'bold')
call s:hi('pythonClassVar',      s:orange,   '', '209', '', '')
call s:hi('pythonDocstring',     s:comment,  '', '65',  '', s:comment_attr)

call s:hi('djangoTag',           s:constant, '', '71',  '', 'bold')
call s:hi('djangoVarBlock',      s:string_hi,'', '194', '', '')
call s:hi('djangoArgument',      s:orange,   '', '209', '', '')
call s:hi('djangoFilter',        s:func,     '', '228', '', '')
call s:hi('djangoStatement',     s:keyword,  '', '221', '', s:keyword_attr)

" ------------------------------------------------------------------------------
" Web & Markup (HTML, CSS, JSON, Markdown, YAML)
" ------------------------------------------------------------------------------
call s:hi('htmlTag',             s:constant, '', '71',  '', '')
call s:hi('htmlEndTag',          s:constant, '', '71',  '', '')
call s:hi('htmlTagName',         s:preproc,  '', '202', '', 'bold')
call s:hi('htmlArg',             s:func,     '', '228', '', '')
call s:hi('htmlSpecialTagName',  s:preproc,  '', '202', '', 'bold')

call s:hi('cssTagName',          s:preproc,  '', '202', '', 'bold')
call s:hi('cssClassName',        s:type,     '', '77',  '', 'bold')
call s:hi('cssIdentifier',       s:func,     '', '228', '', 'bold')
call s:hi('cssProp',             s:type,     '', '77',  '', '')
call s:hi('cssAttr',             s:keyword,  '', '221', '', '')
call s:hi('cssColor',            s:keyword,  '', '221', '', '')

call s:hi('jsonKeyword',         s:func,     '', '228', '', '')
call s:hi('jsonString',          s:string,   '', '157', '', '')
call s:hi('jsonNumber',          s:number,   '', '228', '', 'bold')
call s:hi('jsonBoolean',         s:keyword,  '', '221', '', 'bold')

call s:hi('markdownHeadingDelimiter', s:type, '', '77', '', 'bold')
call s:hi('markdownH1',          s:white,    '', '231', '', 'bold')
call s:hi('markdownH2',          s:func,     '', '228', '', 'bold')
call s:hi('markdownH3',          s:keyword,  '', '221', '', 'bold')
call s:hi('markdownH4',          s:type,     '', '77',  '', 'bold')
call s:hi('markdownCode',        s:string,   '', '157', '', '')
call s:hi('markdownCodeBlock',   s:string,   '', '157', '', '')
call s:hi('markdownUrl',         s:string_hi,'', '194', '', 'underline')
call s:hi('markdownLinkText',    s:func,     '', '228', '', '')

call s:hi('yamlBlockMappingKey', s:func,     '', '228', '', '')
call s:hi('yamlPlainScalar',     s:fg,       '', '15',  '', '')
call s:hi('yamlKeyValueDelimiter', s:fg_dim, '', '240', '', '')

" ------------------------------------------------------------------------------
" Neovim LSP Diagnostics
" ------------------------------------------------------------------------------
call s:hi('DiagnosticError',          s:err_fg,      '', '202', '', '')
call s:hi('DiagnosticWarn',           s:warn_fg,     '', '221', '', '')
call s:hi('DiagnosticInfo',           s:info_fg,     '', '157', '', '')
call s:hi('DiagnosticHint',           s:hint_fg,     '', '194', '', '')
call s:hi('DiagnosticUnderlineError', '',            '', '',    '', 'undercurl')
call s:hi('DiagnosticUnderlineWarn',  '',            '', '',    '', 'undercurl')
call s:hi('DiagnosticUnderlineInfo',  '',            '', '',    '', 'undercurl')
call s:hi('DiagnosticUnderlineHint',  '',            '', '',    '', 'undercurl')

" ------------------------------------------------------------------------------
" Neovim Tree-sitter Groups (only defined in Neovim)
" ------------------------------------------------------------------------------
if has('nvim')
  call s:hi('@comment',                 s:comment,     '', '65',  '', s:comment_attr)
  call s:hi('@string',                  s:string,      '', '157', '', '')
  call s:hi('@string.regex',            s:orange,      '', '209', '', '')
  call s:hi('@string.escape',           s:string_hi,   '', '194', '', '')
  call s:hi('@character',               s:string,      '', '157', '', '')
  call s:hi('@number',                  s:number,      '', '228', '', 'bold')
  call s:hi('@boolean',                 s:keyword,     '', '221', '', 'bold')
  call s:hi('@float',                   s:number,      '', '228', '', 'bold')

  call s:hi('@function',                s:func,        '', '228', '', s:func_attr)
  call s:hi('@function.builtin',        s:func,        '', '228', '', s:func_attr)
  call s:hi('@function.call',           s:func,        '', '228', '', s:func_attr)
  call s:hi('@function.macro',          s:preproc,     '', '202', '', 'bold')
  call s:hi('@method',                  s:func,        '', '228', '', s:func_attr)
  call s:hi('@method.call',             s:func,        '', '228', '', s:func_attr)
  call s:hi('@constructor',             s:type,        '', '77',  '', 'bold')

  call s:hi('@keyword',                 s:keyword,     '', '221', '', s:keyword_attr)
  call s:hi('@keyword.function',        s:keyword,     '', '221', '', s:keyword_attr)
  call s:hi('@keyword.operator',        s:keyword,     '', '221', '', s:keyword_attr)
  call s:hi('@keyword.return',          s:keyword,     '', '221', '', s:keyword_attr)
  call s:hi('@conditional',             s:keyword,     '', '221', '', s:keyword_attr)
  call s:hi('@repeat',                  s:keyword,     '', '221', '', s:keyword_attr)
  call s:hi('@exception',               s:orange,      '', '209', '', 'bold')

  call s:hi('@type',                    s:type,        '', '77',  '', 'bold')
  call s:hi('@type.builtin',            s:type,        '', '77',  '', 'bold')
  call s:hi('@structure',               s:type,        '', '77',  '', 'bold')
  call s:hi('@storageclass',            s:keyword,     '', '221', '', s:keyword_attr)

  call s:hi('@variable',                s:fg,          '', '15',  '', '')
  call s:hi('@variable.builtin',        s:orange,      '', '209', '', '')
  call s:hi('@variable.parameter',      s:fg,          '', '15',  '', '')
  call s:hi('@constant',                s:constant,    '', '71',  '', '')
  call s:hi('@constant.builtin',        s:keyword,     '', '221', '', 'bold')
  call s:hi('@constant.macro',          s:preproc,     '', '202', '', 'bold')

  call s:hi('@operator',                s:fg,          '', '15',  '', '')
  call s:hi('@punctuation.delimiter',   s:fg,          '', '15',  '', '')
  call s:hi('@punctuation.bracket',     s:fg,          '', '15',  '', '')
  call s:hi('@punctuation.special',     s:orange,      '', '209', '', '')

  call s:hi('@tag',                     s:preproc,     '', '202', '', 'bold')
  call s:hi('@tag.attribute',           s:func,        '', '228', '', '')
  call s:hi('@tag.delimiter',           s:constant,    '', '71',  '', '')
endif

" ------------------------------------------------------------------------------
" Git Plugins (GitGutter, Gitsigns, Signify)
" ------------------------------------------------------------------------------
call s:hi('GitGutterAdd',             s:diff_add_fg, s:bg, '77',  s:cterm_bg, '')
call s:hi('GitGutterChange',          s:diff_chg_fg, s:bg, '221', s:cterm_bg, '')
call s:hi('GitGutterDelete',          s:diff_del_fg, s:bg, '202', s:cterm_bg, '')
call s:hi('GitGutterChangeDelete',    s:orange,      s:bg, '209', s:cterm_bg, '')

call s:hi('GitSignsAdd',              s:diff_add_fg, s:bg, '77',  s:cterm_bg, '')
call s:hi('GitSignsChange',           s:diff_chg_fg, s:bg, '221', s:cterm_bg, '')
call s:hi('GitSignsDelete',           s:diff_del_fg, s:bg, '202', s:cterm_bg, '')

" ------------------------------------------------------------------------------
" File Trees (NERDTree, nvim-tree)
" ------------------------------------------------------------------------------
call s:hi('NERDTreeDir',              s:func,        '',   '228', '',         'bold')
call s:hi('NERDTreeDirSlash',         s:gutter_fg,   '',   '65',  '',         '')
call s:hi('NERDTreeOpenable',         s:type,        '',   '77',  '',         '')
call s:hi('NERDTreeClosable',         s:orange,      '',   '209', '',         '')
call s:hi('NERDTreeFile',             s:fg,          '',   '15',  '',         '')
call s:hi('NERDTreeExecFile',         s:type,        '',   '77',  '',         'bold')
call s:hi('NERDTreeUp',               s:gutter_fg,   '',   '65',  '',         '')

call s:hi('NvimTreeFolderIcon',       s:func,        '',   '228', '',         '')
call s:hi('NvimTreeFolderName',       s:func,        '',   '228', '',         'bold')
call s:hi('NvimTreeOpenedFolderName', s:func,        '',   '228', '',         'bold')
call s:hi('NvimTreeEmptyFolderName',  s:gutter_fg,   '',   '65',  '',         '')
call s:hi('NvimTreeIndentMarker',     s:selection,   '',   '237', '',         '')

" ------------------------------------------------------------------------------
" Telescope & fzf
" ------------------------------------------------------------------------------
call s:hi('TelescopeNormal',          s:fg,          s:bg_panel,    '15',  '236', '')
call s:hi('TelescopeBorder',          s:selection,   s:bg_panel,    '237', '236', '')
call s:hi('TelescopePromptNormal',    s:fg,          s:bg_light,    '15',  '236', '')
call s:hi('TelescopePromptBorder',    s:selection_hi,s:bg_light,    '239', '236', '')
call s:hi('TelescopePromptPrefix',    s:keyword,     s:bg_light,    '221', '236', 'bold')
call s:hi('TelescopeSelection',       s:white,       s:selection,   '231', '237', 'bold')
call s:hi('TelescopeMatching',        s:string_hi,   '',            '194', '',    'bold')

" Clean up helper
delfunction s:hi

let &cpo = s:save_cpo
unlet s:save_cpo
