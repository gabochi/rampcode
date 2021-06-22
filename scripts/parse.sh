#!/bin/sh

scripts/topd.sh $(echo $@ | sed 's/\([^0-9|^.]\)/ \1 /g')
