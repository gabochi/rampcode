#!/bin/sh
text=`echo -n "$1" | sed -f repl.sed`
echo $text | pdsend 3005