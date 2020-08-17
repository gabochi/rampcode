# "RAMPCODE"

For a while I was experimenting and trying to get a deeper understanding of bytebeat in terms of musicality. This work was done under the name of "Rampcode" but the project was continuously changing. Right now, Rampcode is this bunch of bash functions with a bytebeat audio engine made in Pure Data.

## Disclaimer

This is not a more 'friendly' bytebeat language, you need some bytebeat knowledge to take advantage. I'm working on possible 'friendly' programs and a detailed documentation, not about Rampcode but about bytebeat in general.

## Requirements

* Pure Data
* Bash

## Usage

First, open *patch/rampcode.pd* patch with PD. Then, you can use the *rc.sh* script as a REPL or setup your favorite editor and tell the script to evaluate a certain expression like this: `./rc.sh -e 'expression'`

There is a *log* folder, you can load a previous history like this: `./rc.sh -r logfile`. Then type `history` and use `!n` to repeat *n* command.

For expressions, use `[]` instead of `()` and `lrAOX` instead of `<<>>&|^` to avoid bash errors (`PLMD` for `+-*/` optionally).

---

# Functions

# Communication

### ch
Send expression a to channel.

```bash:
ch 1 t
```

Send expression `t` to channel 1.

### hz
Change cycles per second.

`hz 1`

Set 1 cycle per second (default, 60/120/240 bpms).

## Sequencers

### bs
Binary sequencer, returns 1 or 0.

```bash:
t*$(bs 123 tr10A7)
```

`123` = `01111011` pattern (since `123>>...` from right to left)

`tr10` = `t>>10` speed

`A7` = `&7` steps (8)

### eu
Euclidean binary sequencer, returns 1 or 0.

`t*$(eu 10 8 3 1)`

`10` speed

`8` steps

`3` 'hits'

`1` rotation (optional)

### ra
Random, returns a value between 0 and 1

`ch 1 t*$(ra 11 2)`

`11` speed

`2` seed (optional)

### hs
Hex sequencer, similar to `bs` but returns 0-15. Use with `tt`.

## Melody

### tt
12-TET note. Relative to `t`, not a fixed tunning.

`ch 1 $(tt 12)`
Play note 12

`ch 1 $(tt $(hs 0xc730 tr10A3))l2` Minor arpeggio

`l2` = `<<2`

`ch 1 $(tt 24+$(hs ${pma} tr10A7Xtr11A3))` Pentatonic melody

`24+` sets fundamental

`tr10A7Xtr11A3` = `t>>10&7^t>>11&3`

`ch 1 $(tt $(hs ${dor} $(ra 11)M8A7))l1`

#### Scales

aeo, art, dor, fri, har, jon, lid, loc, mix, pma, pmi

### vi
Vibrato

`ch 1 $(vi 120 4)+$(tt 24)`

`120` speed

`4` amplitude

## Amplitude

### en
Basic envelope

`ch 1 $(en tl4 3 2 1)*0.5`

`3` speed

`2` emphasis

`1` reverse (optional)

`*0.5` final amplitude

### am
Amplitude modulation

`ch 1 $(en tl7 2 3)*$(am 777 0.6 0.3)`

`777` speed

`0.6` amplitude (optional)

`0.3` minimum (optional)

## "Presets"

### si
Sine wave

`ch 1 $(si $(tt 24))`

### fm
Frequency modulation

`ch 1 $(fm $(tt 24) 0.5 10)`

`0.5` ratio for second operator (first operator / 2)

`10` modulation amplitude

### tk
Triangle percussion

`ch 1 $(tk 7 2)`

`7` speed

`2` pitch

### si
Sine percussion

`ch 1 $(sk 12 8)`

`12` speed

`8` pitch 

## Extra

### t (function)
Replace all t

`ch 1 $(t t+1024 $(tt 24+$(hs ${fri} tr10A7Otr12A7)))`

This makes a 1024 offset for all the expression.

### test
Test bytebeat expressions

`test "t&3|t>>1&7"`

Returns blocks of 64 results
