set syn=haskell
set mouse=a

function Dale()
	silent exe "!sed 4i$(echo '" . getline(".") . "' | sed s/\\ //g | sed s/t/\\$v1/g) blank | pdsend 3005" | redraw!
	endfunction

map <c-e> <esc> :call Dale() <enter>


