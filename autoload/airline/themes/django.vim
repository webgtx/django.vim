" =============================================================================
" Django colorscheme for vim-airline
" Palette: Windows Terminal Django Theme
" License: MIT
" =============================================================================

scriptencoding utf-8

" -----------------------------------------------------------------------------
" Color Definitions [GUI, cterm]
" -----------------------------------------------------------------------------
let s:bg          = [ '#0b2f20', 235 ]
let s:bg_dark     = [ '#072016', 234 ]
let s:bg_light    = [ '#133d2b', 236 ]
let s:selection   = [ '#245032', 237 ]
let s:cursor      = [ '#336442', 239 ]

let s:fg          = [ '#f8f8f8', 231 ]
let s:fg_dim      = [ '#585858', 240 ]
let s:gutter      = [ '#568264', 65  ]

let s:green       = [ '#41a83e', 71  ]
let s:green_bright= [ '#73da70', 120 ]
let s:yellow      = [ '#ffe862', 221 ]
let s:yellow_bright= [ '#ffff94', 228 ]
let s:orange      = [ '#ff943b', 209 ]
let s:red         = [ '#fd6209', 202 ]
let s:mint        = [ '#9df39f', 157 ]
let s:mint_bright = [ '#cfffd1', 194 ]
let s:white       = [ '#ffffff', 231 ]

" Diagnostics & Term
let s:warning = [ s:bg[0], s:yellow[0], s:bg[1], s:yellow[1] ]
let s:error   = [ s:white[0], s:red[0], s:white[1], s:red[1], 'bold' ]
let s:term    = [ s:mint[0], s:bg_light[0], s:mint[1], s:bg_light[1] ]

" -----------------------------------------------------------------------------
" Palette Assembly
" -----------------------------------------------------------------------------
let g:airline#themes#django#palette = {}

" Accents
let g:airline#themes#django#palette.accents = {
      \ 'red':    [ s:red[0], '', s:red[1], '' ],
      \ 'orange': [ s:orange[0], '', s:orange[1], '' ],
      \ 'yellow': [ s:yellow[0], '', s:yellow[1], '' ],
      \ 'green':  [ s:green_bright[0], '', s:green_bright[1], '' ],
      \ }

" Normal Mode
let s:N1 = [ s:bg[0], s:green_bright[0], s:bg[1], s:green_bright[1], 'bold' ]
let s:N2 = [ s:fg[0], s:selection[0], s:fg[1], s:selection[1] ]
let s:N3 = [ s:mint[0], s:bg_light[0], s:mint[1], s:bg_light[1] ]
let g:airline#themes#django#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#django#palette.normal_modified = deepcopy(g:airline#themes#django#palette.normal)
let g:airline#themes#django#palette.normal_modified.airline_c = [ s:yellow[0], s:bg_light[0], s:yellow[1], s:bg_light[1], 'bold' ]

" Insert Mode
let s:I1 = [ s:bg[0], s:yellow[0], s:bg[1], s:yellow[1], 'bold' ]
let s:I2 = [ s:fg[0], s:selection[0], s:fg[1], s:selection[1] ]
let s:I3 = [ s:fg[0], s:bg_light[0], s:fg[1], s:bg_light[1] ]
let g:airline#themes#django#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#django#palette.insert_modified = deepcopy(g:airline#themes#django#palette.insert)
let g:airline#themes#django#palette.insert_modified.airline_c = [ s:yellow_bright[0], s:bg_light[0], s:yellow_bright[1], s:bg_light[1], 'bold' ]
let g:airline#themes#django#palette.insert_paste = {
      \ 'airline_a': [ s:bg[0], s:orange[0], s:bg[1], s:orange[1], 'bold' ]
      \ }

" Visual Mode
let s:V1 = [ s:bg[0], s:orange[0], s:bg[1], s:orange[1], 'bold' ]
let s:V2 = [ s:fg[0], s:selection[0], s:fg[1], s:selection[1] ]
let s:V3 = [ s:fg[0], s:bg_light[0], s:fg[1], s:bg_light[1] ]
let g:airline#themes#django#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#django#palette.visual_modified = deepcopy(g:airline#themes#django#palette.visual)
let g:airline#themes#django#palette.visual_modified.airline_c = [ s:yellow[0], s:bg_light[0], s:yellow[1], s:bg_light[1], 'bold' ]

" Replace Mode
let s:R1 = [ s:white[0], s:red[0], s:white[1], s:red[1], 'bold' ]
let s:R2 = [ s:fg[0], s:selection[0], s:fg[1], s:selection[1] ]
let s:R3 = [ s:fg[0], s:bg_light[0], s:fg[1], s:bg_light[1] ]
let g:airline#themes#django#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#django#palette.replace_modified = deepcopy(g:airline#themes#django#palette.replace)
let g:airline#themes#django#palette.replace_modified.airline_c = [ s:yellow[0], s:bg_light[0], s:yellow[1], s:bg_light[1], 'bold' ]

" Commandline Mode
let s:C1 = [ s:bg[0], s:mint[0], s:bg[1], s:mint[1], 'bold' ]
let s:C2 = [ s:fg[0], s:selection[0], s:fg[1], s:selection[1] ]
let s:C3 = [ s:fg[0], s:bg_light[0], s:fg[1], s:bg_light[1] ]
let g:airline#themes#django#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
let g:airline#themes#django#palette.commandline_modified = deepcopy(g:airline#themes#django#palette.commandline)
let g:airline#themes#django#palette.commandline_modified.airline_c = [ s:yellow[0], s:bg_light[0], s:yellow[1], s:bg_light[1], 'bold' ]

" Inactive Windows
let s:IA1 = [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ]
let s:IA2 = [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ]
let s:IA3 = [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ]
let g:airline#themes#django#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#django#palette.inactive_modified = deepcopy(g:airline#themes#django#palette.inactive)
let g:airline#themes#django#palette.inactive_modified.airline_c = [ s:yellow[0], s:bg_dark[0], s:yellow[1], s:bg_dark[1] ]

" Terminal
let g:airline#themes#django#palette.terminal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" TabLine
let g:airline#themes#django#palette.tabline = {
      \ 'airline_tab':          [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ],
      \ 'airline_tab_right':    [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ],
      \ 'airline_tabsel':       [ s:fg[0], s:selection[0], s:fg[1], s:selection[1], 'bold' ],
      \ 'airline_tabsel_right': [ s:fg[0], s:selection[0], s:fg[1], s:selection[1], 'bold' ],
      \ 'airline_tabfill':      [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ],
      \ 'airline_tabmod':       [ s:yellow[0], s:selection[0], s:yellow[1], s:selection[1], 'bold' ],
      \ 'airline_tabmod_right': [ s:yellow[0], s:selection[0], s:yellow[1], s:selection[1], 'bold' ],
      \ 'airline_tabtype':      [ s:bg[0], s:green_bright[0], s:bg[1], s:green_bright[1], 'bold' ],
      \ 'airline_tablabel':     [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ],
      \ 'airline_tablabel_right': [ s:gutter[0], s:bg_dark[0], s:gutter[1], s:bg_dark[1] ],
      \ 'airline_tabhid':       s:IA1,
      \ }

" Diagnostics & Term attachments
for s:mode in ['normal', 'normal_modified', 'insert', 'insert_modified', 'visual', 'visual_modified', 'replace', 'replace_modified', 'commandline', 'commandline_modified', 'inactive', 'inactive_modified', 'terminal']
  if has_key(g:airline#themes#django#palette, s:mode)
    let g:airline#themes#django#palette[s:mode]['airline_warning'] = s:warning
    let g:airline#themes#django#palette[s:mode]['airline_error']   = s:error
    let g:airline#themes#django#palette[s:mode]['airline_term']    = s:term
  endif
endfor
