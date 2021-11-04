"██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
"██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
"██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
"██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
"██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
"𝕓𝕪 Raju
"https://github.com/raulhuamani/nvim-window
"---------------------------------vim config---------------------------- 

" Configurando <leader> shortcut
let mapleader = " "

" Configuraciones Basicas
syntax on 
set number 
set mouse=a
set noerrorbells
set sw=2
set expandtab
set smartindent
set relativenumber
set numberwidth=1
set nowrap
set noswapfile
set nobackup
set incsearch
set ignorecase
set clipboard=unnamed
set encoding=UTF-8
set cursorline
set termguicolors
set ruler

set colorcolumn=160
highlight ColoColumn ctermbg=0 guibg=lightgrey

" Display option
set showcmd
set showmatch

set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=L

" Valida el tipo de fuente dependiendo el SO:
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\12
  elseif has("gui_macvim")
    set guifont=menlo\ Regular_h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Valida si tiene instalado Vim-Plug para utilizar plugins:
"if ! filereadable(expand('~/AppData/Local/nvim/autoload/plug.vim'))
"	echo "Downloading junegunn/vim-plug to manage plugins..."
	" mkdir -p ~/AppData/Local/nvim/autoload/
	"New-Item -ItemType Directory -Force -Path ~/AppData/Local/nvim/autoload/
	"silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/AppData/Local/nvim/autoload/plug.vim
"endif

"-------------------------------Sources-------------------------------
source ~/AppData/Local/nvim/plugins/plugins.vim
source ~/AppData/Local/nvim/plugins/plug-config.vim
source ~/AppData/Local/nvim/themes/onedark.vim
"--------------------------------Plugins Config--------------------------------------------

"Actualizar fuente
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>


" Funcionalidades Practicas:

"Salir de modo insertar
" imap jk <Esc>
"imap <C-c> <Esc>l

" Mueve bloques de codigo en modo visual o V-Line (Hacia abajo J y arriba K)
xnoremap J :move '>+1<CR>gv-gv 
xnoremap K :move '<-2<CR>gv-gv

" Better indenting
" Mejor Indentación (como TAB: > - derecha y < - izquierda)
vnoremap < <gv
vnoremap > >gv

"disable the arrow keys to navigate. This is very useful when you want to
"adapt to 'hjkl'
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"With the arrow keys you can resize your splits
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

"save file
nmap <leader>w :w <CR>
nmap <leader>wq :wq <CR>
"close current  window
nmap <C-w> :q! <CR>
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>

"search commands 
nmap <leader>gs  :CocSearch
nmap <leader>fs :FZF<CR>
nmap <leader>rg :Rg<CR>

"configuracion de tabs
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude=["nerdtree"]

"open nerdtree
nmap <Leader>e :NERDTree<CR>
let NERDTreeQuitOnOpen=1

"open cocExplorer 
"Buscar dos carácteres con easymotion
"Search for two chars with easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" TAB in general mode will move to text buffer
" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" SHIFT-TAB va para atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"close buffer
"cerrar buffer
nmap <leader>bd :bdelete<CR>


" Navegando con guias
inoremap ;gui <++>
inoremap <leader><leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader><leader> <Esc>/<++><Enter>"_c4l
nnoremap <leader><leader><leader> <Esc>/<++><Enter>"_c4l"


" Autocompletar parentesis, llaves, corchetes, etc
" inoremap ( ()<Esc>i
" inoremap { {}<Esc>i
" inoremap {<CR> {<CR>}<Esc>O
" inoremap [ []<Esc>i
" inoremap < <><Esc>i 
" inoremap ' ''<Esc>i 
" inoremap " ""<Esc>i 

" Disables automatic commenting on newline:
" Deshabilita la continuacion de comentarios en la linea siguiente:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Configuración de Temas:

"--onedark config--
"colorscheme onedark

"--gruvbox config--
colorscheme gruvbox 
let g:gruvbox_contrast_dark = "medium"

set cmdheight=1
"--tokyonight config--
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 0
"colorscheme tokyonight

" monokai config --
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1
" colorscheme monokai

"Close tags automatically
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
"-----------------------------------------------------------------


" comandos personalizados personalizadas:
noremap Q !!$SHELL<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

nnoremap <leader>U <Esc>/D3134357<Enter>
" Seleccionar todo
nnoremap <C-a> <esc>ggVG<CR>

" copy or paste from X11 clipboard 
" http://vim.wikia.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
vmap <C-y> :!xclip -f -sel clip<CR>
map <C-p> mz:-1r !xclip -o -sel clip<CR>`z

