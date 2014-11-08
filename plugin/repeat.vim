function! CountUp()
	let linenum = line(".")
	let text = getline(linenum)
	let num = matchstr(text, "\\d\\+")
	let rtext = substitute(text, "\\d\\+", num + 1, "g")
	call setline(linenum, rtext)
endfunction

nmap <F5> yyp:call CountUp()<CR>
