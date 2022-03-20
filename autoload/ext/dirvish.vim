function! ext#dirvish#CreateFile()
	let l:cwd = expand('%:h') . '/'
	let l:filepath = input(cwd)

	if trim(filepath) == ''
		return
	endif

	let l:directory = fnamemodify(filepath, ':h')
	execute(":silent !mkdir -p " . shellescape(cwd . directory))

	let l:file = fnamemodify(filepath, ':t')

	if empty(file) != 1
		execute(":silent !touch " . shellescape(filepath))
	endif

	execute("Dirvish " . fnameescape(cwd . directory))
endfunction
