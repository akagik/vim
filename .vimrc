let $PATH = "~/.pyenv/shims:".$PATH

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand($HOME . '/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'https://github.com/emonkak/vim-operator-comment.git'

NeoBundle 'https://github.com/rhysd/vim-clang-format'
NeoBundle 'https://github.com/kana/vim-operator-user'

NeoBundle 'jvoorhis/coq.vim'
NeoBundle 'vim-scripts/CoqIDE', {
			\ 'autoload' : {
			\   'filetypes' : 'coq'
			\ }}

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }


NeoBundle 'davidhalter/jedi-vim'
"NeoBundleLazy 'davidhalter/jedi-vim', {
"    \ "rev" : "dev",
"    \ "autoload": {
"    \    "filetypes": [ "python", "python3" ]},
"    \}

" pyenv 処理用に vim-pyenv を追加
" " Note: depends が指定されているため jedi-vim
" より後にロードされる（ことを期待）
"NeoBundle "lambdalisue/vim-pyenv"
NeoBundleLazy "lambdalisue/vim-pyenv", {
   \ "depends": ['davidhalter/jedi-vim'],
   \ "autoload": {
   \   "filetypes": ["python", "python3"]
   \ }}


" lazy evaluate
"NeoBundleLazy 'vim-clang-format',{
"	\"autoload" : {"filetypes" :[ "cpp" ]}
"	\}

NeoBundle "kevinw/pyflakes-vim"
NeoBundle "nathanaelkane/vim-indent-guides"

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


if has('win32')
	let CoqIDE_coqtop = "/Applications/CoqIde_8.4pl4.app/Contents/Resources/bin/coqtop.opt"
elseif has('mac')
	let CoqIDE_coqtop = "/Applications/CoqIde_8.4pl4.app/Contents/Resources/bin/coqtop.opt"
else
	let CoqIDE_coqtop = "/usr/bin/coqtop.opt"
endif

set number
syntax on
set tabstop=4
set shiftwidth=4
" set expandtab

set backup
set backupdir=/tmp

set swapfile
" let g:jedi#auto_initialization = 0

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" jedi-vimでピリオドを打つたび補完候補が出るのを避ける
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0


"autocmd FileType python setlocal omnifunc=jedi#completions
"
"let g:jedi#auto_vim_configuration = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"	        let g:neocomplete#force_omni_input_patterns = {}
"		endif
"
"		let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=236
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 2

highlight SpellBad term=undercurl ctermbg=1
"highlight SpellBad guifg=NONE guibg=NONE gui=undercurl ctermfg=white ctermbg=red cterm=NONE guisp=#FFFFFF " undercurl color
