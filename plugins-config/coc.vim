" TextEdit might fail
set hidden

" Do not pass message to |ins-completion-menu|
set shortmess+=c

" Use tab to trigger completion with character ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.')  - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use K to show documentation in preview mode
nnoremap <silent> K :call <SID>show_documentatation()<CR>

function! s:show_documentation()
  if (index(["nvim","help"], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion.
" '<C-g>u' mean break undo chain at current position
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make <CR> auto-select the first completion
inoremap <silent><expr> <cr pumvisible() ? coc#_select_configm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()<CR>"

" Highlight the symbol and its reference when holding cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Renaming
nmap <leader>rn <Plug>(coc-rename)
