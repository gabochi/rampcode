# rampcode
Rampcode is a bytebeat inspired system for livecoding.

## requirements
- pd-l2ork or purrdata
- vim (or equivalent, like gedit, atom, etc)

## setup
- extract files from the latest version in a rampcode folder
- extract samples inside rampcode/samples
- add this line to your usr/bin/vimr:

`autocmd BufNewFile,BufRead *.gede nnoremap <buffer> <c-e> :silent exec '!./sendline.sh ' . shellescape(getline('.'), 1)<CR>:redraw!<CR>`

and this (optional):

`autocmd BufNewFile,BufRead *.gede set syntax=haskell`

if you'll use another editor you need it to figure how to send a line to the sendline.sh script.

- open rampcode.pd in your pd
- download tuto.gede and open it in vim from your rampcode folder
- that's it, folow the tutorial and it should work :)

## bugs
- examine "* " freezes pd
