#!/bin/bash

# modos
jon=$((16#24579bc))
dor=$((16#23579ac))
fri=$((16#13579ac))
lid=$((16#24679bc))
mix=$((16#24579ac))
aeo=$((16#23578ac))

# menor armonica
arm=$((16#23578bc))
# mayor artificial
art=$((16#24578ac))

# pentatonicas
pma=$((16#2479c))
pmi=$((16#357ac))
# blue note
bma=$((16#23479c))
bmi=$((16#3567ac))


dup(){
	echo -e "$@ $@"
}

bin(){
	echo -e "$((2#$1)) $2 15ar1am"
}

hex(){
	echo -e "$((16#$1))"
}

seq(){
	echo -e "$@ 7a2lr15a"
}

sca(){
	echo -e "$@ 7a2lr15an"
}

euc(){
    echo -e "$1 15a $2 m16M $2 Lm"
}

mod(){
    echo -e "$1 31a $2 M0Em"
}

#imout(){
#	unset -f scale
#}
