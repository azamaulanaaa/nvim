" Open fern with <C-o>
noremap <silent><C-o> :Fern . -reveal=% -drawer -toggle<CR>

" Enable nerdfont
let g:fern#renderer = "nerdfont"

" Hide cursor
let g:fern#hide_cursor = 1
