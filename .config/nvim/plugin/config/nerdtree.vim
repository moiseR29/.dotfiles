" nerdtree
nmap <leader>nt :NERDTreeFind<CR>
nmap <F6> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeGitStatusWithFlags=1
let g:NERDTreeIgnore=['^node_modules$']
let NerdTreeShowLineNumbers=1

autocmd FileType nerdtree setlocal relativenumber