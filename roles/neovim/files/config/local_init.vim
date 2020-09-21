"Facebook'isms
if filereadable("/etc/fbwhoami")
	source $ADMIN_SCRIPTS/master.vimrc
  source /usr/facebook/ops/rc/master.vimrc

	" Facebook file types written in python
	autocmd BufNewFile,BufRead *.tw,*.cinc,*.cconf,*.thrift-cvalidator,*.ctest,TARGETS set filetype=python
endif

" Workaround for https://github.com/neovim/neovim/issues/3496
silent !mkdir -p ~/.local/share/nvim/backup /dev/null 2>&1

" Font (if GUI)
if has("gui_macvim") || has("gui_vimr")
	set guifont=Monaco\ for\ Powerline:h10
endif

" Solarized Color
let g:solarized_termcolors=256
colorscheme solarized

"
set number
set modelines=5

" Mouse
set mouse=a   		"enable mouse
set mousehide 		"hide when characters are typed

" Splits
set splitbelow
set splitright
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Keys
nnoremap ; :
nnoremap <silent> <F5> :set invnumber<cr>

" Heresy
map <C-a> <Home>
map <C-e> <End>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-b> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-b> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i

" deoplete
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
"
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#force_py_version = 3
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"

let g:jedi#completions_enabled = 1

" Ultisnips
let g:UltiSnipsExpandTrigger='<leader>.'
" let g:UltiSnipsJumpForwardTrigger='<leader>r'
" let g:UltiSnipsJumpBackwardTrigger='<leader>w'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

nnoremap <leader>ue :UltiSnipsEdit<CR>

let g:UltiSnipsEditSplit='vertical'
"
" let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style="google"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "vim-snippets"]
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" Golang
let g:go_fmt_command = "goimports"

"Remove trailing whitespace
autocmd BufWritePre * silent! :%s/\s\+$//e

" vim-go
let g:go_fmt_command = "goimports"

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1

" indentLine
let g:indentLine_char = '┆'
let g:indentLine_color_term = 236

" NERDTreeTabs
nnoremap <silent> <F2> :NERDTreeTabsFind<CR>
noremap <F3> :NERDTreeTabsToggle<CR>
