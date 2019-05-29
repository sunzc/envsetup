set tags=tags
set nu
execute pathogen#infect()
syntax on
filetype plugin indent on
nmap <F8> :TagbarToggle<CR>
let g:tagbar_show_linenumbers = 1 
