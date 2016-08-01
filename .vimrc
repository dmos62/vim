call plug#begin()
Plug 'https://github.com/dmos62/vim-buffer-persist'
Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/paradigm/TextObjectify'
Plug 'https://github.com/tpope/vim-vinegar'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/wilywampa/vim-ipython'
Plug 'https://github.com/derekwyatt/vim-scala'
Plug 'https://github.com/NLKNguyen/papercolor-theme' "PaperColor sviesi tema"
", { 'on': 'IPython' }
call plug#end()

set wildmenu
syntax on
filetype plugin indent on

"kad veiktu 256 spalvos
let &t_Co=256
let &t_AF="\e[38;5;%dm"
let &t_AB="\e[48;5;%dm"

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

map <F1> <Esc>:w<CR>
map <F4> <Esc>:tabnew<CR>
nmap <F9> <Esc>:source ~/.vimrc<CR>
nmap <F10> <Esc>:tabnew ~/.vimrc<CR>
" naudok fzf geriau
"nmap <F6> :FufTag<CR>
"nmap <F7> :FufCoverageFile<CR>
"nmap <F8> :FufCoverageFileChange scala<CR>

" kad rastu tagus
set tags=./tags,./../tags,./../../tags

" naudoja fuzzyfinder vietoj paprasto C-]
" noremap <silent> <C-]> :FufTagWithCursorWord!<CR>

" pazymi kur per ilgos linijos kerta riba
" augroup collumnLimit
"   autocmd!
"   autocmd BufEnter,WinEnter,FileType scala,java
"         \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
"   let collumnLimit = 79
"   let pattern = 
"         \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
"   autocmd BufEnter,WinEnter,FileType scala,java
"         \ let w:m1=matchadd('CollumnLimit', pattern, -1)
" augroup END

" kad scaloj newrapintu keistai
" augroup scala_fixai
"   autocmd!
"   autocmd FileType scala set fo-=t fo-=r
" augroup END

" fzf : https://github.com/junegunn/fzf
" set rtp+=~/.fzf

" Show syntax highlighting groups for word under cursor
" " geresnis variantas https://github.com/gerw/vim-HiLinkTrace :h hilinks
" nmap <Leader>c :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfun

colorscheme volvo

let g:textobjectify = {
      \'(': {'left': '(', 'right': ')', 'same': 0, 'seek': 1, 'line': 0},
      \')': {'left': '(', 'right': ')', 'same': 0, 'seek': 2, 'line': 0},
      \'{': {'left': '{', 'right': '}', 'same': 0, 'seek': 1, 'line': 0},
      \'}': {'left': '{', 'right': '}', 'same': 0, 'seek': 2, 'line': 0},
      \'[': {'left': '\[', 'right': '\]', 'same': 0, 'seek': 1, 'line': 0},
      \']': {'left': '\[', 'right': '\]', 'same': 0, 'seek': 2, 'line': 0},
      \'<': {'left': '<', 'right': '>', 'same': 0, 'seek': 1, 'line': 0},
      \'>': {'left': '<', 'right': '>', 'same': 0, 'seek': 2, 'line': 0},
      \'"': {'left': '"', 'right': '"', 'same': 1, 'seek': 1, 'line': 0},
      \"'": {'left': "'", 'right': "'", 'same': 1, 'seek': 1, 'line': 0},
      \'`': {'left': '`', 'right': '`', 'same': 1, 'seek': 1, 'line': 0},
      \'V': {'left': '^\s*\(if\|for\|function\|try\|while\)\>',
      \'right': '^\s*end', 'same': 0, 'seek': 1, 'line': 1},
      \"\<cr>": {'left': '\%^', 'right': '\%$', 'same': 0, 'seek': 0, 
      \'line': 0},
      \}

" let g:clojure_align_multiline_strings = 1

" let g:clojure_fuzzy_indent = 0
" let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
" let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']

set breakindent briopt=shift:1

" Kad paspaudus shift-k neismestu is vimo
noremap K <NOP>

" bundle/buffer-persist
" jeigu pradeta sesija issaugo buferius.
" uzsikraunant jei randa buffer faila uzkrauna issaugotus buferius
let g:BufferFile = ".buffers.vim"
command StartSession call StartBufferPersistSession()

au BufRead,BufNewFile *.cljc setfiletype clojure

set modeline
color evening

" sutrumpinimai
iab abdate <c-r>=strftime("%y-%m-%d")<cr>
iab abtime <c-r>=strftime("%R")<cr>
