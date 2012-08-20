"-----------------------------------------------------------------------
" 共通設定
"-----------------------------------------------------------------------

" 構文ごとの色分け
syntax on
" カーソルを表示(しようと思ったけど、描画が劇的に遅くなったから停止)
" set cursorline
" 行番号を表示
set number
" 検索結果のハイライト
set hlsearch
" タブを常に表示(unite.vimで不要なんじゃね、と思い無効)
" set showtabline=2
" スワップファイルをつくらない
set noswapfile
" バックアップファイルをつくらない
set nobackup
" 自動インデントを有効に
set autoindent
" ソフトtabは基本的にナシ
set noexpandtab
" 不可視文字の表示
set list
" ステータスラインのカスタマイズ
set laststatus=2
:set statusline=%m%r\ [F=%{&fileencoding}\ %{&fileformat}]\ [T=%Y]\ [A=\%03.3b]\ [H=\%06.6B]\ [POS=%04l,%04v][%p%%]

"-----------------------------------------------------------------------
" 言語ごとの設定
"-----------------------------------------------------------------------

" .rbでタブ幅を2に変更
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2 expandtab


"-----------------------------------------------------------------------
" Vundleの設定
"-----------------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" 必要なものをここに追加
Bundle 'vim-scripts/opsplorer'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

filetype plugin indent on

"-----------------------------------------------------------------------
" プラグインの設定
"-----------------------------------------------------------------------

" let g:ref_alc_start_linenumber = 30
" let g:ref_alc_encoding = 'cp932'


" vim-ref の設定
let g:ref_source_webdict_sites = {
\  'je': {
\    'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\  },
\  'ej': {
\    'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\  },
\  'wiki': {
\    'url': 'http://ja.wikipedia.org/wiki/%s',
\  }
\}
let g:ref_source_webdict_sites.default = 'ej'

function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction

" unite の設定
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部のせ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -bufer-name=files buffer file_mru bookmark file<CR>

