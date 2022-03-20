function JsAbbreviations()
	iabbrev fn& function () {<cr>}<esc>kf(i
	iabbrev im& import module from 'module'<esc>^:.,$s/module//g<left><left>
endfunction

autocmd FileType javascript,typescript call JsAbbreviations()
