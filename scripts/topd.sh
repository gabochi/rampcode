#!/bin/bash

declare -a pila

agregar(){
	(( p++ ))
	pila[${p}]=${1}
}

operar(){
	case ${1} in

		n ) operacion="t*p(2\,${pila[$p]}/12.0)" ;;
		I ) operacion="I(${pila[$(( p - 2 ))]}\,${pila[$(( p - 1 ))]}\,${pila[$p]})" 
			(( p = p - 2 ))
			;;
		p ) operacion="p(${pila[$(( p - 1 ))]}\,${pila[$p]})" 
			(( p-- ))
			;;
		s ) operacion="s(${pila[$p]})" ;;
		i ) operacion="i(${pila[$p]})" ;;
		b ) operacion="b(${pila[$p]})" ;;
		* ) operacion="(${pila[$(( p - 1 ))]}${1}${pila[$p]})" 
			(( p-- )) 
			;;
	esac
	
	pila[${p}]="${operacion}"
}

	for ((i=1;i<=$#;i++))
	do 
		[[ ${!i} =~ t|[0-9] ]] && agregar "${!i}" || operar "${!i}"
	done
	echo "${pila[${p}]};" | sed -f scripts/replace.sed 


