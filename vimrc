" Relative Line Numbers
set number
set relativenumber

"Showing the statusline
set laststatus=2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent

"autosave
autocmd BufLeave,FocusLost * silent! wall

"background color of the popup menu
highlight Pmenu ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
highlight PmenuSel ctermfg=15 ctermbg=14 guifg=#00005f guibg=#dfff00


"***********************************Plugins************************************************
call plug#begin()
Plug 'tyru/caw.vim'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-crystalline'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

"********************************Plugins settings******************************************
"_________________________________________________________________________________________*

"********************************neoformat*************************************************
autocmd BufWritePre *.js *.jsx *.cjs *.json *.vue Neoformat
let g:neoformat_try_node_exe = 1
map <F3> :Neoformat prettier<CR>


"**********************************coc-explorer********************************************
noremap <silent> <F2> <Cmd>CocCommand explorer<CR>
"******************* status line and tabline***********************************************
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{FugitiveHead()}'
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

"****************************vim command to run coc-prettier***************************************
"command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"key binding for prettier
"map <F3> :Prettier<CR>




