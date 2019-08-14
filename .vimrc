
"** Spaces & Tabs
syntax enable           " enable syntax processing
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set expandtab           " tabs are spaces
set autoindent

"** UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set nolinebreak
set nowrap
set laststatus=2        " always display status line

"** Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <space> :nohlsearch<CR>

"** leader shortcut
let mapleader=","       " leader is comma
map <leader>c :s?^?#?<CR>
map <leader>C :s?^#??<CR>
map <leader>j :s?^?//?<CR>
map <leader>J :s?^//??<CR>
map <leader>n :NERDTreeToggle<CR>

"** Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <leader><space> za
set foldmethod=indent   " fold based on indent level

"** Plugins
execute pathogen#infect()
call pathogen#helptags()

"* specific c/java
augroup configgroup
    autocmd!
    autocmd FileType c,cpp setlocal tabstop=2
    autocmd FileType c,cpp setlocal shiftwidth=2
    autocmd FileType c,cpp setlocal softtabstop=2
    autocmd FileType c,cpp,java :set smartindent
augroup END

"--------------
" GUI only
"--------------
if has('gui_running')
    " Color sheme
    if has('mac')
        set guifont=Courier_New:h14
    else
        set guifont=Courier\ New\ 12
    endif
        colorscheme desert
    set guioptions +=mbT " enable tool bar

    "Case menu
    menu Util.NoTabOn :set et
    menu Util.NoTabOff :set noet
    menu Util.-sep3- :
    menu Util.Upper\ Case U
    menu Util.Lower\ Case u
    menu Util.Inverse\ Case ~
    menu Util.folder\ all :set foldmethod=syntax

    "Source menu
    menu Source.Nerdtree :NERDTreeToggle <CR>
    menu Source.Split\ Window :vsplit <CR>
    menu Source.Show\ Line\ Number :set nu <CR>
    menu Source.No\ Line\ Number :set nonu <CR>
    menu Source.-sep3- :
    menu Source.Replace\ Spaces :call <SID>SpaceRep()<CR>
    function <SID>SpaceRep()
      :1,$s/ / \\/g
    endfunction
    menu Source.unset\ Tab/space :set noet <CR>

    "Folder menu
    menu Folder.Close\ All : set foldmethod=syntax  <CR> zM
    menu Folder.Open\ All zR
    menu Folder.Close\ current zm
    menu Folder.Open\ current zA
endif

