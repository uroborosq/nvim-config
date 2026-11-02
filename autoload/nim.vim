" Copyright 2018 Leorize <leorize+oss@disroot.org>
" 
" Permission to use, copy, modify, and/or distribute this software for any purpose
" with or without fee is hereby granted, provided that the above copyright notice
" and this permission notice appear in all copies.
" 
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
" REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
" FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
" INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
" OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
" TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
" THIS SOFTWARE.

" Source: https://github.com/alaviss/nim.nvim
" Revision: 9ee8fdc04ad3d7fcbd9679e0be3477543f17b9d9

function nim#SearchIdentifierRegex(ident)
  " creates a regex that can match style-insensitive identifiers
  let i = 0
  let result = '\V\C'
  while i < len(a:ident)
    let c = a:ident[i]
    let underscore = i < len(a:ident) - 1 ? '_\?' : ''
    if i is 0 && c =~ '\a'
      let result .= escape(c, '\/ ') . underscore
    elseif c is '_'
      let result .= ''
    elseif c =~ '\k'
      let result .= '\%('. tolower(c) . '\|' . toupper(c) . '\)' . underscore
    else
      let result .= escape(i, '\/ ')
    endif
    let i += 1
  endwhile
  return result
endfunction

function nim#StarSearchRegex()
  " creates a regex that matches like how the * operator work
  " if no match could be found, an empty regex is returned
  let line = getline('.')
  let start = col('.') - 1
  while start > 0 && line[start] =~ '\k\|\w'
    let start -= 1
  endwhile
  let match = matchstrpos(line, '\a\k*', start)
  if match[0] is ''
    return ''
  endif
  let synName = synIDattr(synID(line('.'), match[1] + 1, v:true), "name")
  if synName isnot '' && synName !~# '\(Comment\|String\|nimCharacter\)$'
    return '\V' . match[0]
  else
    return nim#SearchIdentifierRegex(match[0])
  endif
endfunction
