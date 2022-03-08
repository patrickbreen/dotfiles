let g:polyglot_disabled = ['markdown']
call plug#begin()

" NERDTree
" Plug 'scrooloose/nerdtree'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Go things
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ms-jpq/chadtree'
Plug 'simrat39/symbols-outline.nvim'
Plug 'ray-x/navigator.lua'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ms-jpq/coq_nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Linting

" Completion

" Debugger
" Plug 'vim-vdebug/vdebug'

" Snippets

" Comments
Plug 'tpope/vim-commentary'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'

" Themes
Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

"General
syntax on
colorscheme jellybeans
set nu
filetype plugin indent on
set nocp
set ruler
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set mouse-=a
set t_Co=256

"Code folding
set foldmethod=manual

"Tabs and spacing
set autoindent
set cindent
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

"Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set diffopt +=iwhite

"Use FZF for search
nnoremap <C-p> :Files<Cr>
let g:fzf_tags_command = 'ctags'

"Open quickfix window after running git grep
autocmd QuickFixCmdPost *grep* cwindow

"Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'django', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'php', 'python', 'ruby', 'sass', 'xml', 'html', 'vim', 'go']

" Launch gopls when Go files are in use
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()


"(R)eplace all
"To use this, just put your cursor on the word you want to change, and type <leader>rNewVarName<cr> and you're done.
" <leader> is '\'
" so '\r<new word><cr>'
nnoremap <leader>r yiw:%s/\<<C-r>"\>//g<left><left>
