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


  if filereadable($HOME . '/.config/python/venvs/py2Bubba/bin/python2')             " Prefer my personal virtual environment
    let g:python2_host_prog=$HOME . '/.config/python/venvs/py2Bubba/bin/python2'
  elseif filereadable('/var/lib/ReproConnect/python/bin/python')                   " Prefer the STS Virtual environment
    let g:python2_host_prog='/var/lib/ReproConnect/python/bin/python'
  elseif filereadable('/usr/local/bin/python2')                                    " Or we will look for the /usr/local install
    let g:python2_host_prog='/usr/local/bin/python2'
  elseif filereadable('/usr/bin/python2.7')                                        " finally, check of it in /usr/bin
    let g:python2_host_prog='/usr/bin/python2.7'
  endif

  if filereadable($HOME . '/.config/python/venvs/py3Bubba/bin/python3')             " Prefer my personal virtual environment
    let g:python3_host_prog=$HOME .'/.config/python/venvs/py3Bubba/bin/python3'
  elseif filereadable('/var/lib/ReproConnect/python3/bin/python3')                 " then the STS Virtual Env
    let g:python3_host_prog='/var/lib/ReproConnect/python3/bin/python3'
  elseif filereadable('/usr/local/bin/python3')                                    " Finally, look in /usr/bin
    let g:python3_host_prog='/usr/local/bin/python3'
  endif

  let g:python_host_prog=g:python2_host_prog

  if filereadable($HOME . '/.rbenv/versions/2.6.0/lib/ruby/gems/2.6.0/gems/neovim-0.8.0/exe/neovim-ruby-host')
      let g:ruby_host_prog = $HOME . '/.rbenv/versions/2.6.0/lib/ruby/gems/2.6.0/gems/neovim-0.8.0/exe/neovim-ruby-host'
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
Plug 'scrooloose/nerdtree'          " tree explorer plugin for vim.
Plug 'Xuyuanp/nerdtree-git-plugin'  " plugin of NERDTree showing git status flags.

" Ansible
Plug 'pearofducks/ansible-vim'      " vim syntax plugin for Ansible 2.x, it supports YAML playbooks, Jinja2 templates, and Ansible's hosts files

" Theme / Interface
Plug 'ryanoasis/vim-devicons'       " Adds file type glyphs/icons to NERDTree
Plug 'iCyMind/NeoSolarized'         " Sets up our NeoSolarized theme
Plug 'itchyny/lightline.vim'        " A light and configurable statusline/tabline plugin for Vim

" Completion Manager
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'        " Provides words from current buffer for completion.
Plug 'ncm2/ncm2-path'           " Provides words from the files path
Plug 'ncm2/ncm2-github'         " Provides Github repo completion
Plug 'filipekiss/ncm2-look.vim' " Provides spelling based on BSD look dictionary
Plug 'ncm2/ncm2-cssomni'        " Provices CSS Completion
Plug 'ncm2/ncm2-tern'           " Provides Javascript Completion
Plug 'ncm2/ncm2-jedi'           " Provides Python Completion
Plug 'ncm2/ncm2-pyclang'        " Provides c/c++ completion
Plug 'ncm2/ncm2-vim'            " Provides vimscript completion
Plug 'Shougo/neco-vim'          " Plug 'Shougo/neco-vim' depends on this.
Plug 'ncm2/ncm2-go'             " Provides golang completion
Plug 'phpactor/ncm2-phpactor'   " Provides PHP Completion

" For Java Development
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'StanAngeloff/php.vim', {'for': 'php'} " An up-to-date Vim syntax for PHP
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}

" php refactoring options
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
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

" Syntax Files
Plug 'ekalinin/dockerfile.vim'

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
map <leader>g" ciw""<Esc>P
map <leader>' ysiw''<cr>

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

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
" General Config
""""""""""""""""""""""""""""""""""""""
set encoding=utf8

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

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
set clipboard^=unnamed

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

" Don't move my lines around at all.
set scrolloff=0


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
let NERDTreeQuitOnOpen=0
let g:NERDTreeMouseMode=2

" CTL+S to save (:update)
noremap  <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>
noremap  <silent> <D-s> :update<CR>
vnoremap <silent> <D-s> <C-C>:update<CR>
inoremap <silent> <D-s> <C-O>:update<CR>

" CTL+A to select all
noremap <silent> <C-a> gg"*VG<CR>
vnoremap <silent> <C-a> <C-C>gg"*VG<CR>
inoremap <silent> <C-a> <C-O>gg"*VG<CR>

" CTL+C to copy text to clipboard
vnoremap <silent> <C-c> "+y<CR>

" CTL-X to cut text to clipboard
vnoremap <silent> <C-x> "+d<CR>

" CTL+V to paste text from clipboard
noremap <silent> <C-v> "+p<CR>
inoremap <silent> <C-v> <C-R>+

" CTL-Q to quit the document
map <silent> <C-q> :q<CR>

"" Reloads the vim config after saving.
augroup myvimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END

let g:lightline.colorscheme = 'solarized'

call neomake#configure#automake('nrwi', 500)
autocmd BufWritePre * :%s/\s\+$//e
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
set mouse=a

" Enabling project specific config files '.nvimrc'
set exrc   " allow loading local executing local rc files
set secure " do not allow the use of :autocmd, shell and write commands in local .vimrc files.
