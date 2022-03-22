function JsAbbreviations()
	iabbrev fn& function () {<cr>}<esc>kf(i
	iabbrev im& import _module_ from '_module_'<esc>^:.,$s/_module_//g<left><left>
endfunction

autocmd FileType javascript,typescript call JsAbbreviations()
