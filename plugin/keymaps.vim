let mapleader = " "

" Search
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>en <cmd>lua require('configs.telescope').search_nvim()<cr>

" Buffer
nnoremap <leader>[ :bprev<cr>
nnoremap <leader>] :bnext<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>e :write<cr><bar>:bdelete<cr>

" Git
nnoremap <leader>gg :G<cr>
nnoremap <leader>gc :G cm<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gph :Gitsigns preview_hunk<cr>
nnoremap [c :Gitsigns prev_hunk<cr>
nnoremap ]c :Gitsigns next_hunk<cr>
