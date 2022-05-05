local ls = require("luasnip")
local vimp = require("vimp")

ls.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

ls.add_snippets("javascript", {
	ls.parser.parse_snippet("fn", "function $1($2) {\n\t$3\n}"),
	ls.parser.parse_snippet("afn", "async function $1($2) {\n\t$3\n}"),
	ls.parser.parse_snippet("im", "import $1 from '$2'"),
})

ls.add_snippets("typescript", {
	ls.parser.parse_snippet("fn", "function $1($2)$3 {\n\t$4\n}"),
	ls.parser.parse_snippet("afn", "async function $1($2)$3 {\n\t$4\n}"),
	ls.parser.parse_snippet("im", "import $1 from '$2'"),
})

vimp.inoremap("<c-h>", function ()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vimp.inoremap("<c-l>", function ()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end)

vimp.inoremap("<c-o>", function ()
	if ls.expandable() then
		ls.expand()
	end
end)
