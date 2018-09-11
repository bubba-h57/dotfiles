"""""""""""""""""""""""""""""""""""""
" Bubba Hines neovim configuration 
"""""""""""""""""""""""""""""""""""""""

" Declare the general config group for autocommand
augroup vimrc
  autocmd!
augroup END

"-------------------------------------
" Handle OS/Instance Specific Settings
"-------------------------------------
if has("unix")
  let s:uname = system("uname")
  
  if filereadable('/var/lib/ReproConnect/python/bin/python')
  	let g:python2_host_prog='/var/lib/ReproConnect/python/bin/python'
  endif

  if filereadable('/var/lib/ReproConnect/python3/bin/python')
  	let g:python3_host_prog='/var/lib/ReproConnect/python3/bin/python'
  endif

  if s:uname =~? "Darwin"
    let g:python2_host_prog='/usr/local/bin/python2' 
    let g:python3_host_prog='/usr/local/bin/python3'
  endif

endif


"---------------------------
" Install and Configure Plug
"---------------------------

" Auto install Plugs if it is missing
let plug_file_check=$HOME . '/.config/nvim/autoload/plug.vim'
let plug_dir_check=$HOME . '/.config/nvim/plugged'

if empty(glob(plug_file_check))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


if !isdirectory(plug_dir_check)
    silent call mkdir(plug_dir_check, "p")
endif

call plug#begin(plug_dir_check)

" Utility
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Ansible
Plug 'pearofducks/ansible-vim'

" Theme / Interface
Plug 'ryanoasis/vim-devicons'
Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'

" PHP
Plug 'roxma/ncm-phpactor',  {'for': 'php'}
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}

" php refactoring options
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug '2072/php-indenting-for-vim', {'for': 'php'}

" php doc autocompletion
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" Searching / replacing plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code Quality tools plugin
Plug 'neomake/neomake'

" Refactoring plugins
Plug 'adoy/vim-php-refactoring-toolbox'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Snippet plugins
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Outline plugin
Plug 'majutsushi/tagbar'

" Debugger plugin
Plug 'joonty/vdebug'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" source every plugin configs
let plugconfig_dir=$HOME . '/.config/nvim/plugged-conf'

if !isdirectory(plugconfig_dir)
	silent call mkdir(plugconfig_dir, "p")
endif

for file in split(glob("~/.config/nvim/plugged-conf/*.nvimrc"), '\n')
   exe 'source' file
endfor

"""""""""""""""""""""""""""""""""""
" General Binding
"""""""""""""""""""""""""""""""""""
syntax on

" Map Leader to my MEH key
let mapleader = "<A-S-C>"
map <SPACE> <leader>

" un-highlight when esc is pressed
map <silent><esc> :noh<cr>

" surround by quotes - frequently use cases of vim-surround
map <leader>" ysiw"<cr>
map <leader>' ysiw'<cr>

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" arrow keys resize windows
nnoremap <Left> :vertical resize -10<CR>
nnoremap <Right> :vertical resize +10<CR>
nnoremap <Up> :resize -10<CR>
nnoremap <Down> :resize +10<CR>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" edit vimrc with f5 and source it with f6
nmap <silent> <leader><f5> :e $MYVIMRC<CR>
nmap <silent> <leader><f6> :so $MYVIMRC<CR>

" delete trailing space when saving files
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd vimrc BufWrite *.php,*.js,*.jsx,*.vue,*.twig,*.html,*.sh,*.yaml,*.yml :call DeleteTrailingWS()

map <C-n> :NERDTreeToggle<CR>
map <leader><n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""
" Theme Settings
""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark

if (has("termguicolors"))     
	set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }
colorscheme NeoSolarized 

"""""""""""""""""""""""""""""""""""""
" General Config 
""""""""""""""""""""""""""""""""""""""
set encoding=utf8

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" set the directory where the swap file will be saved
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//

" save undo trees in files
set undofile
set undodir=~/.config/nvim/undo//

" the copy goes to the clipboard
set clipboard+=unnamedplus

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

" number of undo saved in memory
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" set list
set list listchars=tab:\┆\ ,trail:·,nbsp:±

" doesn't prompt a warning when opening a file and the current file was written but not saved 
set hidden

" doesn't display the mode status
set noshowmode

" Keep cursor more in middle when scrolling down / up
set scrolloff=999

" no swap file! This is just annoying
set noswapfile

" write automatically when quitting buffer
set autowrite

" Fold related
set foldlevelstart=0 " Start with all folds closed

" Set foldtext
set foldtext=general#FoldText()

" Show the substitution LIVE
set inccommand=nosplit

" Better ex autocompletion
set wildmenu
set wildmode=list:longest,full

" enable the mouse
set mouse=a

let NERDTreeShowHidden=1


"" Reloads the vim config after saving.
augroup myvimrc
        autocmd!
        " autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END


call neomake#configure#automake('nrwi', 500) 
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
