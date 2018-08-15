## Requirements

* Any version of Puredata (it should run ok in vanilla, l2ork, purr or extended)
* pdsend command (if you have Pd, you should probably have this, comes with pd-utils package)

## Setup (vim and gedit)

You need to comunicate your fav text editor with the rampcode patch. 

For instance, in **vim**, add this one to your vimrc file:

`autocmd BufWritePost *.gede silent exec "!pdsend 3005 < <afile>"`

This will send the msgs every time you save a .gede file.

Or add this external tool command on your **gedit**:

`pdsend 3005 < $GEDIT_CURRENT_DOCUMENT_NAME`

**You can use any other editor (even the terminal), just make sure you can send the msgs through pdsend.**

There are two types of msg you can send: *ramp* and *code*! Each type is separated by ; and each msg by ,.

## Ramp

`ramp <cycles per second>;`

The *ramp* is a counter, a line function. Each cycle adds 8000 to the ramp. The speed of the ramps controls the beat and the pitch 'cos everything is calculated as a function of the ramp. **This msg should always be before the code since it clears all previous instructions**.

## Code

`code <synthesis*amp> <subdivission> <curve> [pan] [delay time] [delay output/input], ..., ..., ...;`

**The arguments are separated by spaces, so be careful.**

### Mandatory

*synthesis* is any operation that makes the continuous or "pure" wave that will be then gated or enveloped. **Remember to multiply it by small numbers like 0.1 since all waves shouldn't sum more than 1 in amplitude**

*subdivission* triggers the envelope X times per cycle (in symetrical time intervals). 

*curve* power the envelope curve. The bigger the power is, the shorter and enfatic the envelope works. **This can't be an expression.**

### Optional

*pan* A number between -1 and 1 for stereo panning (default 0, centered).

*delay time* The variable time (in ms) of a feedback delay. Can be used as reverb, echo, phaser and many extrange fx.

*delay output/input* So far, a number between 0 and 1. 0.5 being input 50%, feedback 50%. **This will be probably optimized.**

## Variables

*$v1* The actual value of the ramp (from 0 to 8000*256).

*$v2* A random value between 0 and 1 for each subdivission. **Unavailable for subdivission expressions**

## Constants

*t1 t2 t4 t8* Just faster ways of writing 8000, 4000 (1/2 cycle), 2000 (1/4 cycle) and 1000 (1/8 cycle). I found this useful, any other constant could be add very simply using the *value* object.

## Operations

All common logical -bitwise (`& | >> << ...`) and non bitwise (`&& || < > == ...`)- and mathematical (`+ - * / % ...`) functions are available for expressions. **If you need to use an expression that need the *comma* char (,) put an *escape* char before the comma (\,).**

## Examples, demo, tutorial...

The example folder is not updated but I recently upload a [demo/tutorial video](https://youtu.be/2AApVwGgmKY).

### Waves

`$v1%100/100` A sawtooth wave.

`$v1%100<50` A symetrical square wave.

`sin($v1/4)` A sine wave.

`sin($v1/4)*sin($v1/750)` AM

`min(sin($v1/4)\,0)` A cliped sine wave.

`sin($v1&$v1>>8)` A classic bytebeat expression.

`sin($v1/($v1/t8%8))` An eight step 1/8 sequence.

`sin($v1/($v2*8%8))` A random 1/8 sequence.

`sin($v1/8+sin($v1/4))` 2 op FM

`sin($v1/2+sin($v1/8)*sin($v1/1500)*10)` 3 op FM

`sin($v1*sin($v1))` Noise

`sin($v1*sin($v1%16))` Another noise.

### Subdivissions

`1+$v1/t1%8` A subdivission sequence (1/1 1/2 1/3 1/4 1/5 1/6 1/7 1/8), doubles each cycle.

`($v1/t8%3==0)*8` Subdivides the cycle in 1/8 and triggers each 3 steps.

`8+($v1/t1%2>0)*8` One cycle 1/8 and one cycle 1/16.

### Pan

`$v2*2-1` Random pan.

## Envelope tables

`env <table>;`

There is a third kind of msg that selects the envelope table. Now there are just two tables (0 and 1, 0 is the default and 1 is the same inverted). **Doesn't support expression neither.**

---

## The Docker way

Execute as:
```bash
docker run --rm -it --name puredata \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    --device /dev/snd \
    -e DISPLAY="unix$DISPLAY" \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    --group-add=audio \
    -v /dev/shm:/dev/shm \
    --cap-add=SYS_ADMIN \
    $(find /dev/snd/ -type c | sed 's/^/--device /') \
    --security-opt seccomp=./docker/chrome.json \
    -v <rampcode-repo>:/repo \
    puredata/ubu12.04:v1 \
    bash
```

where `rampcode-repo` is the repository directory.
Some of the above arguments might not be really necessary.
Tested in Arch Linux (kernel v4.17).

<!--- EOF -->
