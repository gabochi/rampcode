"set mouse=a

function HighL()
   " Matches
    syn match Function /t\|n\|s/
    syn match Number /[0-9]\+/
    syn match Conditional /L\|G\|E\|N\|I/
    "syn match ? /a\|o\|x/
    "syn match ? /r\|l/
    "syn match ? /+\|-\|m\|d\|M\|i/
    syn match Comment /^#.*/

    " Regions
    "syn region Keyword start='$(' end=')' 
    endfunction

"eval current line
function Dale()
	silent exe '!. scripts/func.sh && scripts/parse.sh ' . getline('.') . '| pdsend 3030' | redraw!
	endfunction

"random FX
function Rompe()
"	silent exe '!scripts/parse.sh t $((RANDOM\%3))r$((RANDOM\%3))l$(((1<<RANDOM\%5+9)-1))at13r8192m+t$((RANDOM&3))l$((RANDOM&31|1))a+ | pdsend 3031' | redraw!
	silent exe '!scripts/parse.sh t $((RANDOM\%30+2)) at+ 1 $((RANDOM\%4+10)) l M | pdsend 3031' | redraw!
    normal <C-o>
	endfunction

"return to normal
function Normal()
	silent exe '!scripts/parse.sh t | pdsend 3031' | redraw!
	endfunction


"stop sound
function Quiet()
	silent exe '!scripts/topd.sh t 0 m | pdsend 3030' | redraw!
	endfunction


"map <c-e> <esc> :call Dale() <enter>
"map <c-a> <esc> :call Quiet() <enter>

map <F2> <esc> :call Dale() <enter>
map <F3> <esc> :call Rompe() <enter>
map <F4> <esc> :call Normal() <enter>
map <F5> <esc> :call Quiet() <enter>

"change the speed
map <F6> <esc> :!echo "1.0;" <bar> pdsend 3032

"syntax
au BufRead,BufNewFile *.rampcode :call HighL()
call HighL()

