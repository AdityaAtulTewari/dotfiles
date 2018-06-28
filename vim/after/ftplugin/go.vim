map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snake_case"
let g:ale_linters = {"go":['golint', 'govet', 'gometalinter']}
let g:ale_go_gometalinter_options = '--disable-all --enable=errcheck'
let g:ale_go_gometalinter_lint_package = 1
nnoremap <CR> :noh<CR><CR>
