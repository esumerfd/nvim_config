--set statusline=%f       "tail of the filename
--set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
--set statusline+=%y      "filetype
--set statusline+=%r      "read only flag
--set statusline+=%m      "modified flag
--"set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
--set statusline+=%=      "left/right separator
--set statusline+=%c,     "cursor column
--set statusline+=%l/%L   "cursor line/total lines
require('lualine').setup {
  options = {
    theme = 'codedark',
  },
  sections = { lualine_c = {'%f'} }
}


