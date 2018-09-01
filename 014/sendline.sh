#!/bin/sh
echo $1 | sed -f repl.sed | pdsend 3005
