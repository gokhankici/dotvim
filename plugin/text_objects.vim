call textobj#user#plugin('general', {
\   'wword': {
\     'pattern': '[^ \t]\{1,}',
\     'select': ['ag', 'ig'],
\   },
\ })

call textobj#user#plugin('line', {
\   'myLine': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\   'myLineFromHere': {
\     'select-a-function': 'CurrentLineAI_here',
\     'select-a': 'aL',
\     'select-i-function': 'CurrentLineAI_here',
\     'select-i': 'iL',
\   },
\ })

function! CurrentLineA()
  normal! 0
  return CurrentLineAI_here()
endfunction

function! CurrentLineAI_here()
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction
