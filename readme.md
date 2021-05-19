# RAMPCODE

## About and Requirements

Rampcode is a group of utils to make bytebeat music.  You'll need *Pure Data* (which is the audio engine), *bash* or compatible shell, and also *Vim* to edit and evaluate expressions on the fly.

---

## Files description

+ **patch.pd** The Pure Data patch that receives the update messages and do the audio work.

+ **script.vim** The Vim script for converting and sending the current line as an update message to the patch with C-e.  You can add this script to your Vim config file or run it inside the editor with `:source script.vim`

+ **obo.sh** Converts RPN expressions to PD compatible.  You can run it directly from the command line and send the output to the patch like `$./obo.sh t2l | pdsend 3030`

+ **live.sh** A custom script to play "live sets".

+ **tutorial.rampcode** A bytebeat tutorial for Vim. 

---

## The "live" script (incomplete, experimental)
This script reads and evaluates specific lines from files that contain bytebeat expressions.  The expressions can be in RPN or expr PD notation.  It needs two files, *file.0* that should contain meta/pre-fx expressions and *file.3*.  

### Args:
`./live.sh [file]`

If file is omitted, *demo* is the default.

BTW is **the source from the album available** [here](https://gede1.bandcamp.com)

### Keys:
**u i o p** flip 'metaexpression' bits

**a s d f  h j k l** flip bytebeat expression bits

**z x c v** bytebeat expression -2 -1 +1 +2

---

Contact me:

gabriel.vinazza@gmail.com
@gabovinazza (ig)
