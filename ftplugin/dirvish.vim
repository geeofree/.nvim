" unmap all default mappings
let g:dirvish_dovish_map_keys = 0

" Your preferred mappings
nmap <silent><buffer> i <Plug>(dovish_create_file)
nmap <silent><buffer> I <Plug>(dovish_create_directory)
nmap <silent><buffer> r <Plug>(dovish_rename)
nmap <silent><buffer> yy <Plug>(dovish_yank)<cr>
xmap <silent><buffer> y <Plug>(dovish_yank)<cr>
nmap <silent><buffer> p <Plug>(dovish_move)
nmap <silent><buffer> c <Plug>(dovish_copy)
