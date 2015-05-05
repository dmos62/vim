set background=dark

hi clear

let colors_name = "volvo"

hi Normal       ctermfg=247   ctermbg=233
hi TabLine      cterm=NONE   
hi TabLineSel   cterm=NONE   
hi Statement    ctermfg=180
hi Identifier   ctermfg=117 cterm=NONE
hi PreProc      ctermfg=110
hi Constant     ctermfg=168
hi Type         ctermfg=181
hi Special      ctermfg=211
hi Comment      ctermfg=239
hi Todo         ctermfg=0     ctermbg=180
hi Error        ctermfg=7     ctermbg=88
hi WildMenu     ctermfg=242   ctermbg=117
hi Visual       ctermfg=NONE  ctermbg=238
hi StatusLine   ctermfg=234   ctermbg=241 cterm=NONE
hi StatusLineNC ctermfg=238   ctermbg=236
hi Pmenu        ctermfg=237   ctermbg=249
hi PmenuSel     ctermfg=234   ctermbg=33 
hi vimHiTerm    ctermfg=146
hi Ignore       ctermfg=237

hi! link SpellBad Error
hi! link VertSplit StatusLine
