" Vundle

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'bufexplorer.zip'
Bundle 'FuzzyFinder'
Bundle 'VimIRC.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'
Bundle 'git://gitorious.org/vim-gnupg/vim-gnupg.git'
Bundle 'croaker/mustang-vim'
Bundle 'vim-scripts/UniCycle'
Bundle 'bufkill.vim'
"Bundle 'paredit.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'bouzuya/vim-ibus'
Bundle 'pangloss/vim-javascript'
Bundle 'javacomplete'
Bundle 'ervandew/supertab'
Bundle 'lh-vim-lib'
Bundle 'pydave/AsyncCommand'
Bundle 'JavaImp.vim--Lee'
Bundle 'tpope/vim-eunuch'
Bundle 'romanvbabenko/vim-asciidoc'
Bundle 'Jinja'
Bundle 'wavded/vim-stylus'
Bundle 'DrawIt'
Bundle 'elzr/vim-json'
Bundle 'plasticboy/vim-markdown'
Bundle 'mikewest/vimroom'
Bundle 'vim-scala'

Bundle 'tpope/vim-fireplace'
"Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'

Bundle 'bogado/file-line'

"Bundle 'ktvoelker/sbt-vim'

filetype plugin indent on





" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Prevent vim from emulating vi's bugs.
set nocompatible

set autoindent

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=light
" highlight Normal ctermfg=black ctermbg=white
" highlight Cursor ctermbg=black

" Set an orange cursor in insert mode, and a red cursor otherwise.
" Works at least for xterm and rxvt terminals.
" Does not work for gnome terminal, konsole, xfce4-terminal.
" if &term =~ "xterm\\|rxvt\\|screen"
" :silent !echo -ne "\<Esc>]12;red\x9c"
" let &t_SI = "\<Esc>]12;orange\x9c"
" let &t_EI = "\<Esc>]12;red\x9c"
" autocmd VimLeave * :!echo -ne "\<Esc>]12;red\x9c"
" endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
  filetype plugin on
endif

" Use skeleton files.
autocmd BufNewFile *.sb silent! 0r ~/.vim/skel/template.sb

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

set laststatus=2
set statusline=%<%f\ %h%w%m%r%y%=%l/%L\ (%p%%)\ %c%V\ %o\ %{fugitive#statusline()}

"git bindings
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>


" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set wildchar=<Tab> wildmenu wildmode=list:longest,full

" CTAGS
set tags+=~/.ctags/cpp
set tags+=~/.ctags/qt4
set tags+=~/.ctags/factor
map <F11> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

set hlsearch

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_CLIBCXX_STD"]
" automatically open and close popup
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" remap to C-N C-P
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Haskell
au Bufenter *.hs compiler ghc
let g:haddock_browser = "google-chrome"

"set relativenumber
set backspace=indent,eol,start
set ttyfast
set cursorline

" nnoremap / /\v
" vnoremap / /

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

au FocusLost * :wa

" set autochdir

let g:blogger_blogid = '1373144124906302554'
let g:blogger_email = 'itsjdh@gmail.com'
let g:blogger_pass = 'passwordwitha32qazxds'

"if !has('gui_running') &&
"  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
"  " Use the guicolorscheme plugin to makes 256-color or 88-color
"  " terminal use GUI colors rather than cterm colors.
"  runtime! plugin/guicolorscheme.vim
"  GuiColorScheme mustang
if has('gui_running')
  colorscheme solarized
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme solarized
  set background=dark
endif

au BufEnter *.hs compiler ghc
let g:haddock_browser = "google-chrome"
let g:ghc = "ghc"

" set runtimepath+=~/proj/vim-objj
" au BufNewFile,BufRead *.j,Jakefile setf objj
"
" set runtimepath+=~/proj/vim-yui3

let vimclojure#WantNailgun = 0
" let vimclojure#NailgunClient = "~/bin/ng"
let vimclojure#HighlightBuiltins = 0
let vimclojure#HighlightContrib = 0
let vimclojure#DynamicHighlighting = 1
let vimclojure#ParenRainbow = 1
let vimclojure#FuzzyIndent = 1

set backupdir=~/.vim-backup//
set directory=~/.vim-backup//
set noswapfile

set noswapfile

set nojoinspaces

" Markdown folding

function! MarkdownLevel(token)
  if 0 == empty(matchstr(getline(v:lnum), '^'.a:token.'<\(?\|\.\)'))
    return 'a1'
  endif
  if 0 == empty(matchstr(getline(v:lnum), '^'.a:token.'\(?\|\.\)>'))
    return 's1'
  endif
  let level = strlen(matchstr(getline(v:lnum),
        \                     '\(^'.a:token.' \)\@<=#\+\( \)\@='))
  if level == 0
    return '='
  else
    return '>'.level
  endif
endfunction

let g:comment#none = ''
let g:comment#semi = ';;'
let g:comment#slashes = '//'
let g:comment#hash = '#'

au BufEnter *.md,*.clj,*.cljs,*.js,*.sh setlocal foldmethod=expr

au BufEnter *.md setlocal foldexpr=MarkdownLevel(comment#none)
au BufEnter *.clj,*.cljs setlocal foldexpr=MarkdownLevel(comment#semi)
au BufEnter *.js setlocal foldexpr=MarkdownLevel(comment#slashes)
au BufEnter *.sh setlocal foldexpr=MarkdownLevel(comment#hash)

set guioptions-=T
set guioptions-=m

"au BufNewFile,BufRead *.cljs call PareditInitBuffer()

cnoreabbrev bd BD
cnoreabbrev bw BW
cnoreabbrev bun BUN

set list listchars=trail:·,tab:»·,nbsp:⍽
"autocmd InsertEnter * set nolist
"autocmd InsertLeave * set list

"autocmd BufRead,BufNewFile *.js compiler make_closure
"autocmd BufWritePost *.js call ClosureLinter()
"function! ClosureLinter()
"  compiler closure_linter
"  make
"  cwindow
"  compiler closure
"endfunction

autocmd BufRead,BufNewFile *.java setlocal omnifunc=javacomplete#Complete
"autocmd BufRead,BufNewFile *.java setlocal completefunc=javacomplete#CompleteParamsInfo

autocmd BufRead,BufNewFile *.scala setlocal ft=scala
autocmd BufRead,BufNewFile *.fr setlocal ft=haskell

let g:java_classpath = expand('~/opt/android-sdks/platforms/android-8/android.jar')

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
"let g:SuperTabContextDiscoverDiscovery = ['&omnifunc:<c-x><c-o>', '&completefunc:<c-x><c-u>']
let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = '<c-p>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1


let g:asynccommand_prg = 'gvim'


let g:JavaImpDataDir = $HOME.'/.vim/JavaImp'

"let g:paredit_matchlines=2000
"command! Ptoggle call PareditToggle()
"let g:paredit_mode=0

function! InsertHLine()
let n = &textwidth-virtcol('$')+1
let char = getline('.')[col('.')-1]
if char == ''
  let char = getline('.')[col('.')-2]
endif
let myline = repeat(char, n)
return myline
endfunction
inoremap <expr> <C-o> InsertHLine()

set synmaxcol=100
