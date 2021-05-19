"set syn=haskell
set mouse=a

function Dale()
	silent exe '!./obo.sh ' . getline('.') . '| pdsend 3030' | redraw!
	endfunction

function Quiet()
	silent exe '!./ptoi.sh t 0 m | pdsend 3030' | redraw!
	endfunction

map <c-e> <esc> :call Dale() <enter>
map <c-a> <esc> :call Quiet() <enter>
