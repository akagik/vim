"set iskeyword=@,48-57,_,192-255
"

function! ClangFormatStatically()
	let current_pos = getpos(".")
	normal H 
	let top_pos = getpos(".")
	ClangFormat
	call setpos(".", top_pos)
	normal zt
	call setpos(".", current_pos)
endfunction


"nunmap <C-f>
nnoremap <C-f> :call ClangFormatStatically()<CR>
inoremap <C-f> :call ClangFormatStatically()<CR>

" アクセス指定子は1インデント分下げる
" 短い if 文は1行にまとめる
" テンプレートの宣言(template<class ...>)後は必ず改行する
" C++11 の機能を使う
" {} の改行は Stroustrup スタイル（関数宣言時の { のみ括弧前で改行を入れる）
let g:clang_format#style_options = {
\ "BasedOnStyle" : "Google",
\ "IndentWidth": 4,
\ "TabWidth": 4,
\ "AccessModifierOffset" : -4,
\ "AllowShortIfStatementsOnASingleLine" : "true",
\ "AlwaysBreakTemplateDeclarations" : "true",
\ "Standard" : "C++11",
\ }



function! Comment_out() range
	let save_hlsearch = &hlsearch
	let lnum = a:firstline
	while lnum <= a:lastline
		if match(getline(lnum), "^\\s*\\/\\/") == -1
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

nmap <C-M> :w<CR>:make<CR>
nmap <F2> :!./a.out<CR>
