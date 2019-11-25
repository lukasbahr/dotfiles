" -------------------------------------------------------------------------------
" Vim setting for bahrlu
" -------------------------------------------------------------------------------

" -------------------------------------------------------------------------------
" Initialize plugin system
" -------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

       	 " Add base16 theme
	 Plug 'chriskempson/base16-vim'

	 " Add YCM for auto complete
	 " Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --all' }
	 " set completeopt-=preview
	 Plug 'davidhalter/jedi-vim'

	 " Add lightline
	 Plug 'itchyny/lightline.vim'
	 let g:lightline = { 'colorscheme': 'wombat' }

	 " Add ack for file search
	 Plug 'mileszs/ack.vim'
	 let g:ackprg = 'ag --vimgrep'

	 " Add fuzzy search to enviroment
	 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	 " Add fzf to vim
	 Plug 'junegunn/fzf.vim'

	 " Add commeter to nvim
	 Plug 'scrooloose/nerdcommenter'
	 " Add spaces after comment delimiters by default
	 let g:NERDSpaceDelims = 1
	 " Use compact syntax for prettified multi-line comments
	 let g:NERDCompactSexyComs = 1
	 " Align line-wise comment delimiters flush left instead of following code indentation
	 let g:NERDDefaultAlign = 'left'
	 " Set a language to use its alternate delimiters by default
	 let g:NERDAltDelims_java = 1
	 " Add your own custom formats or override the defaults
	 let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
	 " Allow commenting and inverting empty lines (useful when commenting a region)
	 let g:NERDCommentEmptyLines = 1
	 " Enable trimming of trailing whitespace when uncommenting
	 let g:NERDTrimTrailingWhitespace = 1
	 " Enable NERDCommenterToggle to check all selected lines is commented or not
	 let g:NERDToggleCheckAllLines = 1

	 " Add autopep8 to vim
	 Plug 'tell-k/vim-autopep8'
	 let g:autopep8_max_line_length=79
	 let g:autopep8_disable_show_diff=1

	 " Add better whitespace
	 Plug 'ntpeters/vim-better-whitespace'

	 " Add vim support
	 Plug 'lervag/vimtex'

call plug#end()

" ------------------------------------------------------------------------------
" Colors & Formatting
" -------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight Comment cterm=italic gui=italic

" ------------------------------------------------------------------------------
" Interface
" -------------------------------------------------------------------------------
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

syntax on
set hlsearch
set incsearch
set showcmd
set autoread
set number
set scrolloff=15
set sidescrolloff=10
set wildmenu
set laststatus=2
set nobackup nowritebackup noswapfile
set smartcase
set hidden
set guicursor=

" ------------------------------------------------------------------------------
" Mapping
" -------------------------------------------------------------------------------
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
map <esc> :noh<cr>
nnoremap <C-p> :FZF<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
inoremap { {}<ESC>ha
inoremap [ []<ESC>ha
inoremap ( ()<ESC>ha


" ------------------------------------------------------------------------------
" File handling
" -------------------------------------------------------------------------------
set clipboard=unnamed


au BufNewFile,BufRead *.py
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.tex
	\ filetype plugin indent on
	" \ set nocompatible
	\ set autoindent
	\ set nomodeline " disable modeline vulnerability

	"  text encoding
	\ set encoding=utf8

	" use 4 spaces for tabs
	\ set textwidth=79
	\ set autoindent
	\ set expandtab
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set shiftround

	\ set backspace =indent,eol,start

	" Set linenumbers
	\ set number
	\ set relativenumber
	\ set wrap

	" column ruler at 100
	\ set ruler
	\ set colorcolumn=80

	" Highlight searching
	\ set incsearch
	\ set showmatch
	\ set hlsearch
	\ set ignorecase
	\ set smartcase

	\ set inccommand="nosplit"
	\ set autoread " autoread files
	\ set mouse=a " use mouse for scroll or window size

au BufNewFile,BufRead *.js,*.html,*.css,*.cpp,*.hh,*.cxx,*.md
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2
