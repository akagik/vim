"set iskeyword=@,48-57,_,192-255

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


let mapleader = "\<Space>"
nnoremap <leader>i :OmniSharpFindImplementations<cr>
nnoremap <leader>t :OmniSharpFindType<cr>
nnoremap <leader>s :OmniSharpFindSymbol<cr>
nnoremap <leader>u :OmniSharpFindUsages<cr>
"finds members in the current buffer
nnoremap <leader>m :OmniSharpFindMembers<cr>
" cursor can be anywhere on the line containing an issue
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>xu :OmniSharpFixUsings<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>doc :OmniSharpDocumentation<cr>
nnoremap <leader>dd :OmniSharpGotoDefinition<cr>
"navigate up by method/property/field
nnoremap <C-K> :OmniSharpNavigateUp<cr>
"navigate down by method/property/field
nnoremap <C-J> :OmniSharpNavigateDown<cr>

nnoremap <C-f><C-f> :OmniSharpCodeFormat<cr>
