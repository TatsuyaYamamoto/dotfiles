" @link https://qiita.com/morikooooo/items/9fd41bcd8d1ce9170301
" @link https://qiita.com/kojionilk/items/67379e68cf54d811081a
" @link http://vimblog.hatenablog.com/entry/vimrc_set_tab_indent_options
" @link https://original-game.com/vim-mac9/


set fenc=utf-8 "文字コードをUFT-8に設定

syntax enable  " シンタックスハイライトの有効化
set showcmd    " 入力中のコマンドをステータスに表示する
set number     " 行番号を表示
set cursorline " 現在の行を強調表示

set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように

set expandtab     "タブ入力を複数の空白入力に置き換える
set tabstop=2     "画面上でタブ文字が占める幅
set shiftwidth=2  "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 矢印キーを無効にする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
