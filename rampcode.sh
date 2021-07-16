#!/bin/sh

# run puredata no gui, text to stderr, open patch file, redirect output to null
# save puredata process id
# run vim and excecute config file after loading tutorial file
# kill puredata process

puredata $@ -nogui -stderr puredata/patch.pd >/dev/null 2>&1 & PID=$! && vim --clean -c "source scripts/rconfig.vim" projects/tuto.rampcode ; kill $PID
