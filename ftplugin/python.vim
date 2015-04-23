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



set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set matchtime=2

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
set list                " 不可視文字の可視化
" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" " 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

