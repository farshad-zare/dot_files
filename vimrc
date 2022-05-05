" Relative Line Numbers
set number
set relativenumber

"Showing the statusline
set laststatus=2

"background color of the popup menu
highlight Pmenu ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
highlight PmenuSel ctermfg=15 ctermbg=14 guifg=#00005f guibg=#dfff00


" Plugins
call plug#begin()
Plug 'tyru/caw.vim'
Plug 'shougo/context_filetype.vim'
Plug 'preservim/NERDTree'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-crystalline'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xuyuanp/nerdtree-git-plugin'
call plug#end()

" Plugins settings

" NerdTreeTab
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_open_on_console_startup = 1

" quickly open and close Nerd Tree
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['.directory', '.git$', 'node_modules']

" status line and tabline
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'default'

set showtabline=2
set guioptions-=e
set laststatus=2

"vim command to run coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument