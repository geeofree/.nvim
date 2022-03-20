let mapleader = " "

" Search
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>u <cmd>Telescope buffers<cr>

" Buffer
nnoremap <leader>[ :bprev<cr>
nnoremap <leader>] :bnext<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>e :write<cr><bar>:bdelete<cr>

" Git
nnoremap <leader>g :G<cr>
nnoremap <leader>gc :G cm<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gp :Gitsigns preview_hunk<cr>
nnoremap [c :Gitsigns prev_hunk<cr>
nnoremap ]c :Gitsigns next_hunk<cr>
