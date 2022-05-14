let mapleader = " "

" Search
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fss <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>ev <cmd>lua require('configs.telescope').search_nvim()<cr>
nnoremap <leader>en <cmd>lua require('configs.telescope').search_notes()<cr>
nnoremap <leader>ed <cmd>lua require('configs.telescope').search_dotfiles()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string { search = vim.fn.input("Search For: ") }<CR>

" Buffer
nnoremap <leader>[ :bprev<cr>
nnoremap <leader>] :bnext<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>qq :bdelete!<cr>
nnoremap <leader>e :write<cr><bar>:bdelete<cr>
nnoremap <leader>cd :lcd %:p:h<cr>
nnoremap <leader>bb :BufferLinePick<cr>
nnoremap <leader>bc :BufferLinePickClose<cr>

" Git
nnoremap <leader>gg :G<cr>
nnoremap <leader>gc :G cm<cr>
nnoremap <leader>gl :G log<cr>
nnoremap <leader>gp :G ps<cr>
nnoremap <leader>gd :Gvdiffsplit<cr>
nnoremap <leader>gph :Gitsigns preview_hunk<cr>
nnoremap [c :Gitsigns prev_hunk<cr>
nnoremap ]c :Gitsigns next_hunk<cr>

" Quickfix
nnoremap <leader>, :cprevious<cr>
nnoremap <leader>. :cnext<cr>
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>

" Terminal Emulator
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>tt :FloatermToggle<cr>
nnoremap <leader>tn :FloatermNew<cr>
nnoremap <leader>tq :FloatermKill<cr>
nnoremap <leader>tqq :FloatermKill!<cr>
nnoremap <leader>tf :Floaterms<cr>
