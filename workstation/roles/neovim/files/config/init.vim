call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasr/molokai'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" coc extentions
let g:coc_global_extensions = [
  \ 'coc-diagnostic',
  \ 'coc-git', 
  \ 'coc-go',
  \ 'coc-json', 
  \ 'coc-pyright',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
\]


filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8

syntax on          " syntax highlighting
set nocompatible   " turn of vi compatability 
set hlsearch       " hilight search results
set laststatus=2   " always show status line
set number         " line numbers
set mouse=a        " enable mouse
set mousehide      " hide mouse when typing
set colorcolumn=80 " add a column at 80 columns

set showmatch                  " Briefly jump to a paren once it's balanced
set matchpairs+=\<:\>

" theme
let g:rehash256 = 1
colorscheme molokai
hi MatchParen      ctermfg=208  ctermbg=233 cterm=bold


" Keys
let mapleader = ","
nnoremap ; :
map <C-a> <Home>  " Emacs style.  dont' hate
map <C-e> <End>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-b> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-b> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i

" python
" disable python 2 entirely
let g:loaded_python_provider = 0
" set python3 to a nvim specific virtualenv
let g:python3_host_prog = stdpath('data') . '/py3venv/bin/python3'



set hidden         " allow hidden buffers (needed for coc)
set cmdheight=2    " double height command window
set updatetime=300  
set shortmess+=c   " shortened compeltion messages
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
                      
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" go
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" facebook
if filereadable("/etc/fbwhoami")
	" Facebook file types written in python
	autocmd BufNewFile,BufRead *.tw,*.cinc,*.cconf,*.thrift-cvalidator,*.ctest,TARGETS set filetype=python
endif

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? GoAddTags :CocCommand go.tags.add


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'