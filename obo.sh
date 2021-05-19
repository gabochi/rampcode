#!/bin/bash

./ptoi.sh $(echo $@ | sed 's/\([^0-9|^.]\)/ \1 /g')
