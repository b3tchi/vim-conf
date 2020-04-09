"init plug install
call plug#begin()

Plug 'mattn/emmet-vim'				"html tags generator support
Plug 'evanleck/vim-svelte'			"support for svelte
Plug 'kmarius/vim-fish'				"support for fish scritpts
"To be investigated Denite 

"Plug 'vim-syntastic/syntastic'		"syntax highlighting Disabled could interfere other plugins

"Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} 			"syntax highlighting

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 	"another autocompletion
Plug 'nvie/vim-flake8'											"Python PEP8 syntax linter
Plug 'psf/black' 												"python formatting fixer
Plug 'vim-scripts/indentpython'									"indentaion for python

"Schemes
Plug 'jnurmine/Zenburn'					"color scheme Zenburn
Plug 'rakr/vim-one'						"color scheme same as atom
Plug 'altercation/vim-colors-solarized'	"color scheme Solarized

Plug 'jeffkreeftmeijer/vim-numbertoggle'		"hybrid/static number toggle when multiple windows 
Plug 'scrooloose/nerdtree'						"tree view
Plug 'tmhedberg/SimpylFold'						"folding of texw
Plug 'tpope/vim-fugitive'						"git integration
Plug 'tpope/vim-surround'						"text surrounding with symbols,  tags
Plug 'tpope/vim-commentary'						"comments in vim
Plug 'cohama/lexima.vim'						"autoclosing pairs
"Plug 'vim-airline/vim-airline'					"improved status bar
Plug 'itchyny/lightline.vim'					"more simple status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} "VSCode completer requires NodeJs Temporary disabled
Plug 'terryma/vim-smooth-scroll'				"smooth scrolling 

"Plug 'Valloric/YouCompleteMe'	  				"autocompletion for vim
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}"extended status bar

call plug#end()

"Deoplete autocompletion
"let g:deoplete#enable_at_startup = 1

"remaping space
noremap <space> :
inoremap hh <esc> 

"folding code
set foldmethod=indent
set foldlevel=99

"row numbers relative hybrid
set number relativenumber

"SimpylFold enable
let g:SimpylFold_docstring_preview = 1

"fix tabs spaces to 4
set tabstop=4
set shiftwidth=4

"terminal escape remap
tnoremap <Esc> <C-\><C-n>

"powerlin
"set g:powerline_pycmd = "py3"

"don't wrap text in vim
set nowrap

"smooth scrolling setup
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"set default color scheme
let g:solarized_termcolors=256
:colorscheme solarized
set termguicolors
