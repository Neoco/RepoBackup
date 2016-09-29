" ----------   Basic  ----------
set nocompatible
set backspace=2
set mouse=a
set clipboard=unnamed
set autoread

" ----------    UI    ----------
set number
set ruler
set laststatus=2
set showmode
set showcmd
set wildmenu
set listchars=tab:▸\ ,eol:¬

" ----------  Render  ----------
set lazyredraw
set ttyfast

" ---------- Encoding ----------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" ---- Backup & swap & undo ----
set undodir=~/.vim/.undo//
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set nobackup
set nowritebackup
set noswapfile

" ----------   Bell   ----------
set noerrorbells
set visualbell
set t_vb=

" ----------  Editing ----------
set wrap " Line break
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smarttab
set autoindent 
set smartindent

" ----------  Folding ----------
set foldenable
set foldmethod=indent
set foldlevelstart=50
set foldnestmax=10
nnoremap <space> za

" ---------- Searching----------
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" ----------   Map    ----------
let mapleader = ","

" Delete the tail space and jump to the tail
nnoremap A <c-[>:s/\s*$//<cr>A
imap <c-]> <c-[>A

" j k moving
nnoremap j gj
nnoremap k gk

" Normal mode command
nnoremap ; :
nnoremap : ;

" ----------  Plugin  ----------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'

Plugin 'scrooloose/syntastic'

Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'

" Front end
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'ternjs/tern_for_vim'

" Theme 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
filetype plugin on

" ---------- Ailrline ----------
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_b='Neoco'

" ----------   Color  ----------
set t_Co=256
syntax enable
set background=dark
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='soft'
colorscheme gruvbox

" ----------Easymotion----------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap / <Plug>(easymotion-sn)
xmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-sn)
nmap <Leader>L <Plug>(easymotion-overwin-line)
xmap <Leader>L <Plug>(easymotion-bd-jk)
omap <Leader>L <Plug>(easymotion-bd-jk)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" ---------- NERDTree ----------
nnoremap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')

" -------- Nerdcommenter--------
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
map <Leader>cc <plug>NERDCommenterComment
map <Leader>cd <plug>NERDCommenterUncomment

" ---------- Syntastic----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol             = '✖︎'
let g:syntastic_warning_symbol           = '▲'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 3
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": [],
      \ "passive_filetypes": [] }
nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>
nnoremap <leader>se :Error<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

" ----------   Emmet  ----------
let g:user_emmet_leader_key = '<C-z>'
let g:user_emmet_mode='inv'

" ---------- SuperTab ----------
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-p>'
let g:SuperTabRetainCompletionDuration = 'completion'
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
set completeopt-=preview
inoremap <c-o> <c-x><c-o>
inoremap <c-l> <c-x><c-l>
inoremap <c-v> <c-x><c-v>
let g:SuperTabCrMapping = 1

" ----------Auto Pairs----------
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '∫'
let g:AutoPairsShortcutToggle = '†'
let g:AutoPairsShortcutFastWrap = '∑'
let g:AutoPairsShortcutJump= '∆'
