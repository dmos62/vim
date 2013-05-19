call pathogen#infect()
Helptags
"wildmenu = : komandu pabaigimas
set wildmenu
syntax on

"kad veiktu 256 spalvos
let &t_Co=256
let &t_AF="\e[38;5;%dm"
let &t_AB="\e[48;5;%dm"

"solarized. mintty spalvu sureguliavimas https://github.com/mavnn/mintty-colors-solarized
set background=dark
colorscheme solarized

"su f5 keitalioti tarp sviesaus ir tamsaus
call togglebg#map("<F5>")

"kad geriau veiktu kursorius
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"normalus indentas
set expandtab
set shiftwidth=2
set softtabstop=2

"indent vizualizacija https://github.com/nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 50
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=blue
