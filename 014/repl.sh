#!/bin/bash

sed -f repl.sed $1 > tempi
pdsend 3005 < tempi