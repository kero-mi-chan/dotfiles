"-----------------------------------------------------------------------
" 共通設定
"-----------------------------------------------------------------------

" 構文ごとの色分け
syntax on
" カーソルを表示(しようと思ったけど、描画が劇的に遅くなったから停止)
" set cursorline
" 行番号を表示
 set number
" タブを常に表示
set showtabline=2
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

set rtp+=~/.vim/bundle/vundle/
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
