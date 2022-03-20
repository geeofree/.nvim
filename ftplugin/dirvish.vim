nnoremap <silent><buffer> p :<c-u>Shdo! mv {} %<cr>
nnoremap <silent><buffer> c :<c-u>Shdo! cp -r {} %<cr>
nnoremap <silent><buffer> dd :<c-u>Shdo! rm -r {}<cr>
nnoremap <silent><buffer> <c-r> :Dirvish %<cr>
nnoremap <m-p> :<c-u>call ext#dirvish#CreateFile()<cr>
