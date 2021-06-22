#!/bin/bash

declare -a pila

agregar(){
	(( p++ ))
	pila[${p}]=${1}
}

operar(){
	case ${1} in
		n ) operacion="t*p(2\,${pila[$p]}/12.0)" ;;
		p ) operacion="p(${pila[$(( p - 1 ))]}\,${pila[$p]})" 
			(( p-- ))
			;;
		s ) operacion="s(${pila[$p]})" ;;
		i ) operacion="i(${pila[$p]})" ;;
		* ) operacion="(${pila[$(( p - 1 ))]}${1}${pila[$p]})" 
			(( p-- )) 
			;;

	esac
	
	pila[${p}]="${operacion}"
}

for ((i=1;i<=$#;i++))
do 

#	echo "$#" "$i" "${!i}" 
	
	[[ ${!i} =~ t|[0-9] ]] && agregar "${!i}" || operar "${!i}"

done


# echo "${pila[${p}]}"

echo "${pila[${p}]};" | sed -f replace.sed 
