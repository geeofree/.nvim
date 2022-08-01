function I(...)
	print(vim.inspect(...))
end

function F(text, ...)
	print(string.format(text, ...))
end
