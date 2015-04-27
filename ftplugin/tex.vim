nnoremap <F1> :w<CR>:!platex %<CR>:!dvipdfmx %<<CR>
nnoremap <C-M> :w<CR>:!platex %<CR>:!dvipdfmx %<<CR>
inoremap <F1> <ESC>:w<CR>:!platex %<CR>:!dvipdfmx %<<CR>a


if has('win32')

elseif has('mac')
	nmap <F2> :!open %<.pdf<CR>
	imap <F2> <ESC>:!open %<.pdf<CR>a
else
	nmap <F2> :!open %<.pdf<CR>
	imap <F2> <ESC>:!open %<.pdf<CR>a
	nmap <F3> :!pbibtex %<<CR>
	nnoremap vi$ F$lvf$h
	nnoremap va$ F$vf$
endif

imap <C-T>i \\begin{itemize}<CR>\\item<CR>\\end{itemize}<ESC>kA\ 
imap <C-T>e \\begin{enumerate}<CR>\\item<CR>\\end{enumerate}<ESC>kA\ 
imap <C-T>m \\begin{eqnarray*}<CR>\\end{eqnarray*}<ESC>O
imap <C-T>ra $\\rightarrow$ 
imap <C-T>f \\frac{}{} 
inoremap <C-$> $$<ESC>i

function! Comment_out() range
	let save_hlsearch = &hlsearch
	let lnum = a:firstline
	while lnum <= a:lastline
		if match(getline(lnum), "^\\s*%") == -1
			exec lnum . "s/^/%/"	
		else
			exec lnum . "s/^\\(\\s*\\)%/\\1/"	
		endif
		let lnum = lnum + 1
	endwhile
	let &hlsearch = save_hlsearch 
endfunction

function! To_Variable() range
	let save_hlsearch = &hlsearch
	let lnum = a:firstline
	while lnum <= a:lastline
		let line = getline(lnum)
		let subtext = substitute(line, '\(\A\)\(\h\+\)\(\A\)', "\\1$\\2$\\3", "g")
		call setline(lnum, subtext)
		let lnum = lnum + 1
	endwhile
	let &hlsearch = save_hlsearch 
endfunction

nmap <C-N> :.call Comment_out()<CR>
vmap <C-N> :call Comment_out()<CR>

vmap <C-T>v :call To_Variable()<CR>
