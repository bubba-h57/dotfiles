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
    \  }
colorscheme NeoSolarized
