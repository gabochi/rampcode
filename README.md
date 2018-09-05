# rampcode
Rampcode is a bytebeat inspired system for livecoding.

## requirements
- pd (tested on vanilla and l2ork)
- vim (or equivalent, like gedit, atom, etc)

## setup
- extract files from the latest version
- extract samples to a /samples folder
- add this line to your usr/bin/vimr:

`autocmd BufNewFile,BufRead *.gede nnoremap <buffer> <c-e> :silent exec '!./sendline.sh ' . shellescape(getline('.'), 1)<CR>:redraw!<CR>`

and this (optional):

`autocmd BufNewFile,BufRead *.gede set syntax=haskell`

if you'll use another editor you need it to figure how to send a line to the sendline.sh script.

- open rampcode.pd in pd
- open tuto.gede with your editor
- that's it, follow the tutorial and it should work :)

## bugs
- examine "* " freezes pd (bash problem: sendline.sh)
