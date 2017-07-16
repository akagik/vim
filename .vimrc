" pyenv のパスを通す
let $PATH = "~/.pyenv/shims:".$PATH

" vim-pyenv のエラー回避のため
call has("python3")


" neobundle settings"{{{
if has('vim_starting')
  if &compatible
     set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand($HOME . '/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'https://github.com/emonkak/vim-operator-comment.git'

"NeoBundle 'https://github.com/rhysd/vim-clang-format'
"NeoBundle 'https://github.com/kana/vim-operator-user'

" Shougo/unite.vim "{{{ -------------------------------------------------------
NeoBundleLazy 'Shougo/unite.vim', {
    \ "autoload": {
    \   "commands": ['Unite'],
    \ }}

let s:hooks = neobundle#get_hooks('unite.vim')
function! s:hooks.on_source(bundle)
"    let g:unite_enable_start_insert=1 " 挿入モードの状態で起動する
endfunction

nnoremap <Space>b :Unite buffer<CR>
nnoremap <Space>F :Unite file<CR>
"}}} ------------------------------------------------------------------------

" Shougo/neocomplete "{{{ 

" 遅延ロードする(insert モードに入るまでロードされない。
NeoBundleLazy 'Shougo/neocomplete', {
    \ "autoload": {"insert": 1}}

let s:hooks = neobundle#get_hooks("neocomplete")

" neocomplete用の設定関数。neocomplete ロード時に読み込まれる。
function! s:hooks.on_source(bundle)
    "Note: This option must set it in .vimrc(_vimrc). 
    " NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    endfunction

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl =
        \ '\h\w*->\h\w*\|\h\w*::'

endfunction

"}}}

" Shougo/vimshell "{{{ -------------------------------------------------------

" 遅延ロードする(command :VimShell を呼び出すまでロードされない)。
NeoBundleLazy 'Shougo/vimshell.vim', {
    \ "depends": ['Shougo/unite.vim'],
    \ "autoload": {
    \   "commands": ['VimShell'],
    \ }}

let s:hooks = neobundle#get_hooks('vimshell.vim')
function! s:hooks.on_source(bundle)
    let g:vimshell_scrollback_limit=50000
endfunction

nnoremap <Space>s :VimShell<CR>

"}}} ------------------------------------------------------------------------

" Shougo/vimfiler "{{{ -------------------------------------------------------

" 遅延ロードする(command :VimFiler を呼び出すまでロードされない)。
NeoBundleLazy 'Shougo/vimfiler', {
    \ "depends": ['Shougo/unite.vim'],
    \ "autoload": {
    \   "commands": ['VimFiler', 'VimFilerTab', 'VimFilerExplorer'],
    \   "mappings": ['<Plug>(vimfiler_switch)'],
    \   "explorer": 1,
    \ }}

let s:hooks = neobundle#get_hooks('vimfiler')
function! s:hooks.on_source(bundle)
    " . からはじまる
    let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"
endfunction

nnoremap <Space>f 
            \ :VimFilerExplorer -split -simple -winwidth=25 -no-quit<CR>

"}}} ------------------------------------------------------------------------

" Shougo/vimproc.vim"{{{ --------------------------------------
NeoBundle 'Shougo/vimproc.vim', {
 \ 'build' : {
 \ 'windows' : 'tools\\update-dll-mingw',
 \ 'cygwin' : 'make -f make_cygwin.mak',
 \ 'mac' : 'make',
 \ 'linux' : 'make',
 \ 'unix' : 'gmake',
 \ },
 \ }
"}}} ----------------------------------------------------------

" thinca/vim-quickrun"{{{ --------------------------------------
NeoBundle "thinca/vim-quickrun"
"}}} ----------------------------------------------------------

" vim-flake8 "{{{ --------------------------------------------------
NeoBundle "nvie/vim-flake8", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ }

let s:hooks = neobundle#get_hooks("vim-flake8")
function! s:hooks.on_source(bundle)
     " 各種設定
endfunction
"}}} ------------------------------------------------------------------------

" davidhalter/jedi-vim "{{{ --------------------------------------------------
NeoBundle "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}

"let s:hooks = neobundle#get_hooks("jedi-vim")
"function! s:hooks.on_source(bundle)
  " jediにvimの設定を任せると'completeopt+=preview'するので
  " 自動設定機能をOFFにし手動で設定を行う
"  let g:jedi#auto_vim_configuration = 0
  " 補完の最初の項目が選択された状態だと使いにくいためオフにする
"  let g:jedi#popup_select_first = 0
  " quickrunと被るため大文字に変更
"  let g:jedi#rename_command = '<Leader>R'
  " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
"  let g:jedi#goto_command = '<Leader>G'
"endfunction

autocmd FileType python setlocal omnifunc=jedi#completions
"}}} ------------------------------------------------------------------------

" lambdalisue/vim-pyenv "{{{ --------------------------------------------------
" pyenv 処理用に vim-pyenv を追加
" Note: depends が指定されているため jedi-vim より後にロードされる
" （ことを期待）
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
"}}}

" coq "{{{
NeoBundleLazy 'vim-scripts/CoqIDE', {
    \ 'autoload' : {
    \   'filetypes' : 'coq'
    \ }}
NeoBundleLazy 'jvoorhis/coq.vim', {
    \ 'autoload' : {
    \   'filetypes' : 'coq'
    \ }}

if has('win32')
	let CoqIDE_coqtop = "/Applications/CoqIde_8.4pl4.app/Contents/Resources/bin/coqtop.opt"
elseif has('mac')
	let CoqIDE_coqtop = "/Applications/CoqIde_8.4pl4.app/Contents/Resources/bin/coqtop.opt"
else
	let CoqIDE_coqtop = "/usr/bin/coqtop.opt"
endif
"}}}

" javascript "{{{

let s:envHome = $HOME

" offline document "{{{
NeoBundleFetch 'tokuhirom/jsref'
NeoBundleFetch 'mustardamus/jqapi'
NeoBundleLazy 'thinca/vim-ref', {'depends': 'mojako/ref-sources.vim', 'on_func': 'ref#K', 'on_map': '<Plug>(ref-keyword)'}
let g:ref_no_default_key_mappings = 1
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nmap <silent>K <Plug>(ref-keyword)
let s:hooks = neobundle#get_hooks('vim-ref')
function! s:hooks.on_source(bundle) abort
    let g:ref_cache_dir       = s:envHome .'/.vim/vim-ref/cache'
    let g:ref_detect_filetype = {
    \    'html':       ['javascript', 'jquery'],
    \    'javascript': ['javascript', 'jquery']}
    let g:ref_javascript_doc_path = s:envHome .'/.vim/bundle/jsref/htdocs'
    let g:ref_jquery_doc_path     = s:envHome .'/.vim/bundle/jqapi'
    let g:ref_use_cache           = 1
    let g:ref_use_vimproc         = 1
endfunction
"}}}

" syntax check"{{{
NeoBundle "osyo-manga/shabadou.vim" " quickrun-hook集
NeoBundle "osyo-manga/vim-watchdogs"

let s:hooks = neobundle#get_hooks('vim-watchdogs')
function! s:hooks.on_source(bundle) abort
    let g:watchdogs_check_BufWritePost_enable = 0
    let g:watchdogs_check_CursorHold_enable = 0

    let g:quickrun_config = {
    \   "javascript/watchdogs_checker" : {
    \     "type" : "eslint"
    \   },
    \   "python/watchdogs_checker" : {
    \     "type" : "pyflakes"
    \   },
    \ }

    let g:quickrun_config = {
    \   "_": {
    \     "outputter/quickfix/open_cmd" : "copen"
    \   },
    \ }
    call watchdogs#setup(g:quickrun_config)
endfunction
"}}}

NeoBundle 'Chiel92/vim-autoformat'

unlet s:envHome
"}}}

" Unity "{{{
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
      \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
      \   'build': {
      \     'windows' : 'msbuild server/OmniSharp.sln',
      \     'mac': 'xbuild server/OmniSharp.sln',
      \     'unix': 'xbuild server/OmniSharp.sln',
      \   },
      \ }
NeoBundle 'tpope/vim-dispatch'
"}}}

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" neobundle settings end"}}}


" vim general settings "{{{
syntax on
set number
set hidden              " バッファを閉じる代わりに
                        " 隠す（Undo履歴を残すため）
set matchpairs& matchpairs+=<:> 
                        " 対応括弧に'<'と'>'のペアを追加
set matchtime=2         " 対応括弧のハイライトする時間を 2 秒に。
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase          " 大文字・小文字を無視する。
set smartcase           " 検索文字に大文字が入っている場合、区別する。
set incsearch
set hlsearch
set colorcolumn=100      " 100文字目に色付け
set backspace=indent,eol,start 

set mouse=a
                        " BSで削除できるものを指定する
set fdm=marker          " 折り畳みを作成したときにマーカーを挿入

set backup
set backupdir=/tmp
set noswapfile          " スワップファイルを作成しない

set encoding=utf-8
set fileencoding=utf-8

" ESCを二回押すことでハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> *
    \ "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" " 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" window の移動
inoremap <C-w><C-w> <ESC><C-w><C-w>
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
inoremap <Right> <ESC><C-w>l
inoremap <Left> <ESC><C-w>h
inoremap <Up> <ESC><C-w>k
inoremap <Down> <ESC><C-w>j
inoremap <C-^> <ESC><C-^>

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

highlight SpellBad term=undercurl ctermbg=1

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
"}}}

