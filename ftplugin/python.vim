function! Comment_out() range
	let save_hlsearch = &hlsearch
	let lnum = a:firstline
	while lnum <= a:lastline
		if match(getline(lnum), "^\\s*#") == -1
			exec lnum . "s/^/#/"	
		else
			exec lnum . "s/^\\(\\s*\\)#/\\1/"	
		endif
		let lnum = lnum + 1
	endwhile
	let &hlsearch = save_hlsearch 
endfunction

nmap <C-N> :.call Comment_out()<CR>
vmap <C-N> :call Comment_out()<CR>

if has('win32')
	let pycommand = "python"
elseif has('mac')
	let pycommand = "/Users/kohei/.pyenv/shims/python"
else
	let pycommand = "python"
endif

nmap <F1> :w<CR>:execute "!".pycommand "%"<CR>
nmap <F2> :w<CR>:execute "!".pycommand "-i %"<CR>
nmap <F3> :w<CR>:execute "!".pycommand "%\|less"<CR>
