# Rampcode
Rampcode is a bytebeat inspired language for livecoding written in Pure Data. It differs from other lc languages in the sense that you can construct the synthesis from -almost- zero yourself, all output is a result of a function of time. So, the limit is your imagination. I've made it 'cos I do livecoding and I love to experiment without presets or close boundaries.

## Requirements
- Pure Data (tested on vanilla and l2ork)
- vim (or equivalent, like gedit, atom, etc)

## Setup
- Download or clone this repo
- Add this line to your /usr/bin/vimr:

`autocmd BufNewFile,BufRead *.gede nnoremap <buffer> <c-e> :silent exec '!./sendline.sh ' . shellescape(getline('.'), 1)<CR>:redraw!<CR>`

(and optional):

`autocmd BufNewFile,BufRead *.gede set syntax=haskell`

You can use another editor but you need it to figure how to send a line to the sendline.sh script. 
For example, you can build an external tool in gedit with this script:

`sh ./sendline.sh $GEDIT_CURRENT_LINE`

- Give sendline.sh executable permission

`chmod +x sendline.sh`

- Open rampcode-xxx.pd in Pure Data
- Open tuto.gede with your editor
- That's it, follow the tutorial and it should work :)

## Fixed on 0.3.1
- FX chain is not cleared when a new `c` or `w` message arrives.
