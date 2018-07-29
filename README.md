# RAMPCODE

Rampcode is a PD patch for livecoding with math and logical expressions, inspired by bytebeat but with a few more tools to mess with synthesis and rythm.

## How does it work?
It has **just one time ramp (phasor~) and all sounds are a function of that**. It is basically waveshaping with math and logic (bitwise too, so you can do bytebeat :wink:) plus a rythmical aspect, envelopes and random values. 

## How can I play?
1. Open the **rampcode.pd** patch in PD (you need the **in.pd** in the same folder).

2. Open your favorite **text editor** and create a file with the code, for instance:

`ramp 1; code sin($v1) 1 1, end;`

3. Click the **open button** in the patch and select the file you are working.

4. Click the **read button** to update the code (remember to save the file before hehe).

If the DSP is on, you should hear an annoying sinewave. Try dividing the sine to change the pitch like `sin($v1/4)` and play with different subdivissions and envelope curves as `sin($v1/4) 8 2`, `sin($v1/4) 8 10`, `sin($v1/4) 4 1`, etc. There is an optional fourth argument for paning: `sin($v1/8) 8 1 0`. Paning goes from -1 (full left) to 1 (full right). All **code** arguments but envelope curve can be expressions as in `sin($v1/4) 8*($v1%t<t/2) 1 sin($v1/t)`.

**$v1** is the actual value of the ramp, an increasing counter (8000 per cycle). **t** is a very useful constant = 8000. Then, you have all math (`+ - * / % ...`), bitwise (`& | >> << ...`) and non-bitwise (`&& || > < ...`) logical operators. Also, there is a random value (from 0 to 1) **$v2** that's generated in every subdivission of the expression.

## Messages
There are two kinds of messages that rampcode receives: *ramp* and *code*. **Each type of msg is separated by a ; and each msg is separated by ,**.

**ramp** sets the general speed and pitch in cycles per second (hz), *think of a cycle as a pattern*.

**code** create multiple signals from the main ramp.

## Examples are your best friend
I think the best way to understand it is taking a look at the examples and mess with them. There are many topics and possibilities. **Good luck!** Don't hesitate to contact me to ask anything and show me your rampcodes :heart:

## TO DO: VIM
According to **munshkr**, there's a way in vim to update the patch each time you save the file via pdsend but didn't had time to test it yet and I'm sure I'll need some help hehe. This would be really great, so you don't have to push the read button every time (I made the patch very compact so that you can leave the window always on top while you code and then press read but that's still very ugly and unconfortable).
