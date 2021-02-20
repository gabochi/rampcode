#!/bin/bash

echo zero > midinote
currentnote="zero"

while true
do
	updatednote=$(< midinote)

	if [ "${currentnote}" != "${updatednote}" ] 
		then	
			currentnote="${updatednote}"
			echo "${currentnote}"
		fi

done

