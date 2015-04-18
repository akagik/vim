
if has('win32')
	nmap <F1> :w<CR>:!python3.4 %<CR>
	nmap <F2> :w<CR>:!python3.4 -i %<CR>
	nmap <F3> :w<CR>:!python3.4 %\|less<CR>
elseif has('mac')
	nmap <F1> :w<CR>:!/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome %<CR>
else
	nmap <F1> :w<CR>:!python3.4 %<CR>
	nmap <F2> :w<CR>:!python3.4 -i %<CR>
	nmap <F3> :w<CR>:!python3.4 %\|less<CR>
endif
