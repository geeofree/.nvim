let g:dirvish_dovish_map_keys = 0

function! g:DovishDelete(target) abort
  return 'rm -r ' . a:target
endfunction

nmap <silent><buffer> yy <Plug>(dovish_yank)
xmap <silent><buffer> y  <Plug>(dovish_yank)
nmap <silent><buffer> p  <Plug>(dovish_move)
nmap <silent><buffer> P  <Plug>(dovish_copy)
nmap <silent><buffer> dd <Plug>(dovish_delete)
nnoremap <m-p> :<c-u>call ext#dirvish#CreateFile()<cr>
xnoremap <buffer> d :<c-u>call ext#dirvish#DeleteFiles()<cr>
