filetype off
""" pathogen をコメントアウト
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" set helpfile=$VIMRUNTIME/doc/help.txt

""" Vundle '''
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on

" 利用中のプラグインをPlugin
Plugin 'gmarik/vundle'
"Plugin 'Shougo/neocomplcache'
Plugin 'neoclide/coc.nvim'
Plugin 'Shougo/unite.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tomasr/molokai'
"Plugin 'thinca/vim-puickrun'
Plugin 'thinca/vim-ref'
Plugin 'kana/vim-fakeclip'
Plugin 'depuracao/vim-rdoc'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"
" for jedi-vim
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'

" http://qiita.com/PSP_T/items/3a1af1301ee197b32a8a
Plugin 'osyo-manga/vim-over'
Plugin 'LeafCage/yankround.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'syui/wauto.vim'

set spell
set tabstop=4
set shiftwidth=4
set expandtab
set nocompatible
"call pathogen#infect()
set softtabstop=0

set list
set listchars=tab:»-

if has("autocmd")
  " https://qiita.com/ymiyamae/items/06d0f5ce9c55e7369e1f
  filetype plugin on
  filetype indent on
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sh          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif
syntax on
filetype on
filetype indent on
filetype plugin on
set number

set encoding=utf-8

syntax enable
if has('gui_running')
	set background=dark
else
	set background=dark
	"colorscheme desert256
	colorscheme molokai
	"colorscheme Zenburn
	":let g:solarized_termcolors=256
	"colorscheme solarized
endif



"--------------
"let g:neocomplcache_enable_at_startup = 1
""ユーザ定義の辞書を指定
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'scala' : $HOME . '/.vim/dict/scala.dict',
			\ }

" for NERDTree
" https://github.com/scrooloose/nerdtree
" Q. How can I open a NERDTree automatically when vim starts up?
"autocmd vimenter * NERDTree
"
"Q. How can I open a NERDTree automatically when vim starts up if no files
"were specified?
autocmd vimenter * if !argc() | NERDTree | endif

" pycファイルを表示しない
let NERDTreeIgnore = ['\.pyc$']


""" neocomplecache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" for python style
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" highlight 80th column
set colorcolumn=80

" spell checker
set spell

"inoremap <C-c> <ESC>
" remap tag-jump
nmap <c-h>	:pop<CR>
" nnoremap <c-[>	:pop<CR>
" nnoremap <c-h>  :pop<CR>

"""" http://qiita.com/items/9ca3fa0c4c00d7e70cbb
" adjust the window height/width
" nnoremap <space>+ <C-w>5+
" nnoremap <space>- <C-w>5-
" nnoremap <space>> <C-w>10>
" nnoremap <space>< <C-w>10<

" complete surroundings
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap \| \|\|<Left>

""""""""" http://qiita.com/items/95b8a7a0d007e6e09d78
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge""""

"""""""" 無限undoと編集位置の自動復帰
"""""""" http://blog.papix.net/entry/2012/12/14/042937
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

" yankround.vim
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

"" wauto.vim
nmap <Leader>s  <Plug>(AutoWriteStart)
nmap <Leader>ss <Plug>(AutoWriteStop)
let g:auto_write = 1

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

