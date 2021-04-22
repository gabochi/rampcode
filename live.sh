#!/bin/bash

#puredata -nogui ../patch.pd &

[ "$1" == "" ] && FILE="demo" || FILE="$1"
echo "$FILE"

MEBIT=0
MEPAR=0
EXBIT=0
EXPAR=0

updateME(){
	[ $MEBIT -gt 0 ] && ME=$(eval sed '$((MEBIT))!d' ${FILE}.0 | sed "s/p0/${MEPAR}/") || ME="t 0 m"
	[[ $(echo $ME | grep v1) == "" ]] && ME=$(./ptoi.sh $ME)
	echo "$ME" | pdsend 3031
}

updateEX(){
	[ $EXBIT -gt 0 ] && EX=$(eval sed '$((EXBIT))!d' ${FILE}.3 | sed "s/p0/${EXPAR}/") || EX="t 0 m"
	[[ $(echo $EX | grep v1) == "" ]] && EX=$(./ptoi.sh $EX)
	echo "$EX" | pdsend 3030
}

while true
do
#	clear
	printf '%04d ' "$(echo "obase=2; $MEBIT" | bc)" 
	printf '%04d ' "$(echo "obase=2; $MEPAR" | bc)" 
	printf '%08d ' "$(echo "obase=2; $EXBIT" | bc)" 
	printf '%04d ' "$(echo "obase=2; $EXPAR" | bc)" 
	echo " ($MEBIT) : $ME -> ($EXBIT) : $EX "
	
	

	read -sn1
	case $REPLY in
		u ) ((MEBIT=MEBIT^8)) ;;
		i ) ((MEBIT=MEBIT^4)) ;;
		o ) ((MEBIT=MEBIT^2)) ;;
		p ) ((MEBIT=MEBIT^1)) ;;

		U ) ((MEPAR=MEPAR^8)) ;;
		I ) ((MEPAR=MEPAR^4)) ;;
		O ) ((MEPAR=MEPAR^2)) ;;
		P ) ((MEPAR=MEPAR^1)) ;;
			
		a ) ((EXBIT=EXBIT^128)) ;;
		s ) ((EXBIT=EXBIT^64)) ;;
		d ) ((EXBIT=EXBIT^32)) ;;
		f ) ((EXBIT=EXBIT^16)) ;;
		h ) ((EXBIT=EXBIT^8)) ;;
		j ) ((EXBIT=EXBIT^4)) ;;
		k ) ((EXBIT=EXBIT^2)) ;;
		l ) ((EXBIT=EXBIT^1)) ;;

		Z ) ((EXPAR=EXPAR^8)) ;;
		X ) ((EXPAR=EXPAR^4)) ;;
		C ) ((EXPAR=EXPAR^2)) ;;
		V ) ((EXPAR=EXPAR^1)) ;;

		c ) ((EXBIT=EXBIT+1&255)) ;;
		x ) ((EXBIT=EXBIT-1&255)) ;;
		v ) ((EXBIT=EXBIT+2&255)) ;;
		z ) ((EXBIT=EXBIT-2&255)) ;;
	esac

	case $REPLY in
		u|i|o|p|U|I|O|P ) updateME ;;
		a|s|d|f|h|j|k|l|Z|X|C|V|z|x|c|v ) updateEX ;;
	esac
done


