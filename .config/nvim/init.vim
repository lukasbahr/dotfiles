" -------------------------------------------------------------------------------
" Vim setting for bahrlu
" -------------------------------------------------------------------------------

" -------------------------------------------------------------------------------
" Initialize plugin system
" -------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

	" Add base16 theme
	Plug 'chriskempson/base16-vim'

	" Add ack for file search
	Plug 'mileszs/ack.vim'
	let g:ackprg = 'ag --vimgrep'

	" Add YCM for auto complete
	Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --all' }

	Plug 'ntpeters/vim-better-whitespace'

	" Add lightline
	Plug 'itchyny/lightline.vim'
	let g:lightline = { 'colorscheme': 'wombat' }

	" Add fuzzy search to enviroment
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	" Add fzf to vim
	Plug 'junegunn/fzf.vim'

	" Add sorround for brackets
	Plug 'tpope/vim-surround'

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
syntax on

set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

set hlsearch
set incsearch
set showcmd
set cmdheight=2
set autoread
set nu
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

" ------------------------------------------------------------------------------
" File handling
" -------------------------------------------------------------------------------
au BufNewFile,BufRead *.py
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.cpp,*.hh,*.cxx,*.md
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

