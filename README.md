# RAMPCODE
Live-coding system based on bytebeat.

Check https://greggman.com/downloads/examples/html5bytebeat/html5bytebeat.html and select 'floatbeat' for a similar online experience

Atom package available https://atom.io/packages/atom-rampcode

## Instructions
Open the rampcode patch with Pure Data and edit the *tutorial.rampcode* file with Atom.  Follow the documentation.

## Sound test
If you don't hear any sound, try going to *Media / Test audio and MIDI* in Pure Data.

## Appendix notes:
+ The `@` character in the tutorial means blank space. Since the `$1` and sometimes `$2` arguments are used in the patch to build the expression's content, no spaces are allowed. Blank spaces are reserved to specify the message receive (like in`hz @ 1.0 / 8 ;` and `c @ 11000 ;`) or distinguishing the first and second ramp expressions (`$v1 @ $v1 /8 %2 * 0.5 ;`). The blank spaces are deleted in the Atom package before sending the message to Pure Data. Take this in count if you want to build your own plugin or tool in the editor of your preference.
+ The `c` constant is not explained in the tutorial. It is a reference increasing rate and can't be an expression, just a number. By default it's 8000.
