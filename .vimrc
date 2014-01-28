execute pathogen#infect()
Helptags
runtime! plugin/sensible.vim

set wildmenu
syntax on
filetype plugin indent on

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

set encoding=utf-8
set fileencoding=utf-8

let g:EclimScalaValidate = 0
map <F1> <Esc>:w<CR>
map <F2> <Esc>:w<CR>:Validate<CR>
map <F4> <Esc>:tabnew<CR>
nmap <F9> <Esc>:source ~/.vimrc<CR>
nmap <F10> <Esc>:tabnew ~/.vimrc<CR>
nmap <F6> :FufTag<CR>
nmap <F7> :FufCoverageFile<CR>
nmap <F8> :FufCoverageFileChange scala<CR>

" kad rastu tagus
set tags=./tags,./../tags,./../../tags

" naudoja fuzzyfinder vietoj paprasto C-]
noremap <silent> <C-]> :FufTagWithCursorWord!<CR>

" pazymi kur per ilgos linijos kerta riba
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType scala,java
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 79
  let pattern = 
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType scala,java
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

" kad scaloj newrapintu keistai
augroup scala_fixai
  autocmd!
  autocmd FileType scala set fo-=t fo-=r
augroup END
