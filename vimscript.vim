set syn=haskell
set mouse=a

function Dale()
	"silent exe "w | !pdsend 3005 < " . bufname("%") | redraw!
	silent exe "!sed '4i o=" . getline(".") . "' blank | pdsend 3005" | redraw!
	endfunction

map <c-e> <esc> :call Dale() <enter>
