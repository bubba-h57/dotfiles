"""""""""""""""""""""""""""""""""""""
" Bubba Hines neovim configuration 
"""""""""""""""""""""""""""""""""""""""

set encoding=utf8
set mouse=a

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

" Load Plugs
let plug_file_check='~/.config/nvim/autoload/plug.vim'
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

call plug#end()

set backspace=indent,eol,start

filetype plugin indent on 


"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme NeoSolarized 
 
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
