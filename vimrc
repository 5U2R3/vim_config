"This is vimrc
"コメントアウト

"色表示
syntax on

"画面表示
"行番号表示
set number
"対応する括弧の協調
set showmatch
"カーソル行の背景色を変更
set cursorline
"ステータス行を常に表示
set laststatus=2

"検索
"大文字、小文字を区別して検索
set noignorecase
"サーチハイライト
set hlsearch
"インクリメントサーチ(1文字ずつ検索)
set incsearch

"ファイル処理
set noundofile
set noswapfile

"不可視文字の表示
set list
set listchars=tab:>\ ,extends:<

"Exコマンド補完
set wildmenu

"キーマッピング
noremap! <BS> <Nop>
noremap! <UP> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <silent> <C-j> <ESC>

inoremap { {}<LEFT>
inoremap {<Enter> {}<LEFT><CR><ESC><S-o><TAB>
inoremap ( ()<LEFT>
inoremap (<Enter> ()<LEFT><CR><ESC><S-o>
inoremap [ []
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"インデント
"オートインデント
set autoindent
"共通インデント
set tabstop=2
set shiftwidth=0
set expandtab

"ファイル別インデントの設定
autocmd FileType python setlocal tabstop=4

"バイナリファイル設定
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g -1
  autocmd BufWritePost * set nomod | endif
augroup END
