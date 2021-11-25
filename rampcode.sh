#!/bin/sh

# env for log file, create if not exist

LOGFILE=logs/$(date +%y-%m-%d).log
[ -e $LOGFILE ] || echo Rampcode log file > $LOGFILE

# run puredata no gui, text to stderr, open patch file, redirect output to null
# save puredata process id
# run vim and excecute config file after loading cheatsheet file
# kill puredata process

puredata $@ -nogui -stderr puredata/patch.pd >/dev/null 2>&1 & PID=$! && LOGFILE=$LOGFILE vim --clean -c "source scripts/rconfig.vim" projects/cheat.rampcode ; kill $PID
