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

" Autopep8
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction


nmap <C-N> :.call Comment_out()<CR>
vmap <C-N> :call Comment_out()<CR>
nnoremap <C-c><C-c> :WatchdogsRun<CR>

if has('win32')
	let pycommand = "ipython"
elseif has('mac')
	let pycommand = "/Users/kohei/.pyenv/shims/ipython"
else
	let pycommand = "ipython"
endif

nmap <F1> :w<CR>:execute "!".pycommand "%"<CR>
nmap <F2> :w<CR>:execute "!".pycommand "-i %"<CR>


"set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする

"set list                " 不可視文字の可視化
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

set expandtab


" Ctrl + F で Autopep8
nnoremap <C-f> :call Autopep8()<CR>

