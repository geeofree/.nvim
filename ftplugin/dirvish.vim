nnoremap <silent><buffer> p :<c-u>Shdo! mv {} %<cr>
nnoremap <silent><buffer> c :<c-u>Shdo! cp -r {} %<cr>
nnoremap <silent><buffer> d :<c-u>Shdo! rm -r {}<cr>
nnoremap <silent><buffer> <c-r> :Dirvish %<cr>
nnoremap <silent><buffer> i :<c-u>call ext#dirvish#CreateFile()<cr>
