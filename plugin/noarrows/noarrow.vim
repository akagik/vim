" Vim global plugin for becoming familiar with not using arrow keys.
" Last Change:	2014 August 28
" Maintainer:	Kohei Imatomi <kohei.imatomi@gmail.com>
" License:		This file is placed in the public domain.
"

if exists("g:loaded_noarrow")
	finish
endif
let g:loaded_noarrow = 1

let s:cpo_save = &cpo
set cpo&vim

let s:isProhibited=0

function s:ProhibitArrowKeys()
	inoremap <UP> <Nop>
	noremap <UP> <Nop>
	inoremap <RIGHT> <Nop>
	noremap <RIGHT> <Nop>
	inoremap <DOWN> <Nop>
	noremap <DOWN> <Nop>
	inoremap <LEFT> <Nop>
	noremap <LEFT> <Nop>
endfunction

function s:AllowAllowKeys()
	unmap <UP>
	unmap <RIGHT>
	unmap <DOWN>
	unmap <LEFT>
	iunmap <UP>
	iunmap <RIGHT>
	iunmap <DOWN>
	iunmap <LEFT>
endfunction

function s:ToggleArrowKeys()
	if s:isProhibited
		call s:AllowAllowKeys()
		let s:isProhibited = 0
	else
		call s:ProhibitArrowKeys()
		let s:isProhibited = 1
	endif
endfunction

if !exists("ToggleNoKey")
	command -nargs=0 ToggleNoKey :call s:ToggleArrowKeys()
endif

let &cpo = s:cpo_save
unlet s:cpo_save

