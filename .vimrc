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


" NeoBundle 'davidhalter/jedi-vim'


" lazy evaluate
"NeoBundleLazy 'vim-clang-format',{
"	\"autoload" : {"filetypes" :[ "cpp" ]}
"	\}

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
