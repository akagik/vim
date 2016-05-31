autocmd FileType javascript :set dictionary=$HOME/.vim/dict/javascript.dict,$HOME/.vim/dict/jQuery.dict

function! Comment_out() range
	let save_hlsearch = &hlsearch
	let lnum = a:firstline
	while lnum <= a:lastline
		if match(getline(lnum), "^\\s*//") == -1
			exec lnum . "s/^/\\/\\//"	
		else
			exec lnum . "s/^\\(\\s*\\)\\/\\//\\1/"	
		endif
		let lnum = lnum + 1
	endwhile
	let &hlsearch = save_hlsearch 
endfunction

nmap <C-N> :.call Comment_out()<CR>
vmap <C-N> :call Comment_out()<CR>
nnoremap <C-c><C-c> :WatchdogsRun<CR>
nmap <C-F> :Autoformat<CR>

if has('win32')
	let jscommand = ""
elseif has('mac')
	let jscommand = "firefox"
else
	let jscommand = "firefox"
endif

nmap <F1> :w<CR>:execute "!".jscommand "%"<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
