function JsAbbreviations()
	iabbrev fn& <esc>bciwfunction<C-o>p() {<cr>}<C-o>O
	iabbrev im& <esc>bciwimport<C-o>p from '<C-o>p'<esc>BBB
endfunction

autocmd FileType javascript,typescript call JsAbbreviations()
