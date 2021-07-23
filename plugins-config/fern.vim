" Open fern with <C-o>
nmap <silent><C-o> :Fern . -reveal=% -drawer -toggle<CR><Plug>(fern-action-zoom:reset)

" Enable nerdfont
let g:fern#renderer = "nerdfont"

" Hide cursor
let g:fern#hide_cursor = 1
