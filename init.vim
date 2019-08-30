if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

" Pythonインタプリタへのパスを指定
let g:python3_host_prog = '~/.pyenv/shims/python3'
let g:python_host_prog = '~/.pyenv/shims/python'

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim'
    s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set noswapfile
set number             "行番号を表示
set autoindent         "改行時に自動でインデントする
set smartindent
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set laststatus=2

inoremap <C-j> <Esc>
nnoremap gb gT
nnoremap sn :tabnew<CR>:Tnew<CR>i
nnoremap tn :tabnew<CR>:T t<CR>i
nnoremap <Space>noh :noh<CR>
tnoremap <C-j> <C-\><C-n>

colorscheme railscasts
