
if has('win32')
	nmap <F1> :w<CR>:!firefox %<CR>
elseif has('mac')
	nmap <F1> :w<CR>:!firefox %<CR>
else
	nmap <F1> :w<CR>:!firefox %<CR>
endif
