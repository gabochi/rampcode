#!/bin/sh

# run puredata no gui, text to stderr, open patch file, redirect output to null
# save puredata process id
# run vim and excecute macros script after loading tutorial file
# kill puredata process

puredata -nogui -stderr puredata/patch.pd >/dev/null 2>&1 & PID=$! && vim -c "source scripts/macros.vim" tuto.ramp && kill $PID
