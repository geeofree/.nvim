function! ext#dirvish#CreateFile()
	let l:cwd = expand('%:h') . '/'
	let l:filepath = input(cwd)

	if empty(filepath)
		return
	endif

	let l:directory = fnamemodify(filepath, ':h')
	execute(":silent !mkdir -p " . shellescape(cwd . directory))

	let l:file = fnamemodify(filepath, ':t')

	if empty(file) != 1
		execute(":silent !touch " . shellescape(cwd . filepath))
	endif

	execute("Dirvish " . fnameescape(cwd . directory))
	execute("norm /" . fnameescape(file) . "\<cr>")
endfunction

" https://github.com/roginfarrer/vim-dirvish-dovish/blob/main/ftplugin/dirvish.vim#L41
function! s:getVisualSelection()
  if mode()=="v"
    let [line_start, column_start] = getpos("v")[1:2]
    let [line_end, column_end] = getpos(".")[1:2]
  else
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
  end
  if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
    let [line_start, column_start, line_end, column_end] =
          \   [line_end, column_end, line_start, column_start]
  end
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - 1]
  let lines[0] = lines[0][column_start - 1:]
  return lines
endfunction

function! ext#dirvish#DeleteFiles()
	let lines = s:getVisualSelection()

	let confirm_header = 'Are you sure you want to delete:'
	let msg = ''
	for file in lines
		let msg = msg . "\n- " . file
	endfor

	let result = confirm(confirm_header . msg, "&Yes\n&No", 2)

	if result != 1
		echo 'Cancelled.'
		return
	endif

	for file in lines
		execute(":silent !rm -r " . shellescape(file))
	endfor

	let success_header = 'Successfully deleted:'
	echo success_header . msg
endfunction
