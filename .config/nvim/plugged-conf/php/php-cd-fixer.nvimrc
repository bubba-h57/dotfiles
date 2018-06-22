let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_cache = ".php_cs.cache"
let g:php_cs_fixer_config_file = ".php_cs_laravel"

autocmd vimrc FileType php setlocal commentstring=\/\/\ %s
autocmd vimrc FileType php nnoremap <leader>g :silent :call PhpCsFixerFixFile()<CR>
