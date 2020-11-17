call plug#begin('~/.vim/plugged') 
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
call plug#end()

set nu

syntax enable
set background=dark
colorscheme solarized
let g:airline_theme='onehalfdark'

if exists('&colorcolumn')
    set colorcolumn=80
endif
set updatetime=250

" START Python IDE
let g:jedi#completions_enabled = 0
if $PYENV_VIRTUAL_ENV == ""
  let s:current_python_path='/Users/user/.pyenv/shims/python'
else
  let s:current_python_path=$PYENV_VIRTUAL_ENV.'/bin/python'
endif
call coc#config('python', {'pythonPath': s:current_python_path})
" END Python IDE


" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

nmap <S-t> :NERDTree<CR> 
nmap <S-f> :FZF<CR>
nmap g :Rg<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ; :set hlsearch!<CR>
