let mapleader = " "

" Search
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string { search = vim.fn.input("Search For: ") }<CR>
nnoremap <leader>fss <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fd <cmd>lua require('configs.telescope').search_work_dirs(require('telescope.themes').get_dropdown())<cr>
nnoremap <leader>fm <cmd>lua require('configs.telescope').search_marked_buffers(require('telescope.themes').get_dropdown())<cr>
nnoremap <leader>ev <cmd>lua require('configs.telescope').search_nvim()<cr>
nnoremap <leader>ed <cmd>lua require('configs.telescope').search_dotfiles()<cr>

" Buffer
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>qq :bdelete!<cr>
nnoremap <leader>e :write<cr><bar>:bdelete<cr>
nnoremap <leader>mb <cmd>lua require('configs.utils').mark_buffer()<cr>
nnoremap <leader>mc <cmd>lua require('configs.utils').clear_marked_buffers()<cr>
nnoremap <leader>bu :bufdo :update<cr>
nnoremap <leader>bq :bufdo :bdelete<cr>
nnoremap <leader>bqq :bufdo :bdelete!<cr>

" Directory Navigation
nnoremap <leader>- :Rex<cr>
nnoremap - :Ex<cr>
nnoremap <leader>dd <cmd>lua require('configs.utils').go_to_root()<cr>
nnoremap <leader>dc <cmd>lua require('configs.utils').go_to_path('~/Projects/.dotfiles')<cr>
nnoremap <leader>dn <cmd>lua require('configs.utils').go_to_path('~/Projects/.nvim')<cr>
nnoremap <leader>dp <cmd>lua require('configs.utils').go_to_playground()<cr>
nnoremap <leader>cd <cmd>lua require('configs.utils').change_dir()<cr>

" Git
nnoremap <leader>gg :G<cr>
nnoremap <leader>ga :G aa<cr>
nnoremap <leader>gc :G cm<cr>
nnoremap <leader>gl :G log<cr>
nnoremap <leader>gp :G ps<cr>
nnoremap <leader>gd :Gvdiffsplit<cr>
nnoremap <leader>ph :Gitsigns preview_hunk<cr>
nnoremap <leader>rh :Gitsigns reset_hunk<cr>
nnoremap [c :Gitsigns prev_hunk<cr>
nnoremap ]c :Gitsigns next_hunk<cr>

" Quickfix
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>

" Terminal Emulator
tnoremap <C-\><C-\> <C-\><C-n>
nnoremap <leader>tt :FloatermToggle<cr>
nnoremap <leader>tn :FloatermNew<cr>
nnoremap <leader>tq :FloatermKill<cr>
nnoremap <leader>tqq :FloatermKill!<cr>
nnoremap <leader>tf :Floaterms<cr>
