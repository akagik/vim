set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

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

nmap <F1> :w<CR>:!python3.4 %<CR>
nmap <F2> :w<CR>:!python3.4 -i %<CR>
nmap <F3> :w<CR>:!python3.4 %\|less<CR>
