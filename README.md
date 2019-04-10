# Rampcode
Rampcode is a synthesis system or technique, inspired by __bytebeat__, that I use for __live coding__.  It works with __Pure Data__ but the logic behind it is very simple so I think it can be ported or complemented with other languages.

## Setup
You'll need Pure Data.  Open the rampcode patch (.pd), it receives messages via *pdsend* (a communication prgram, commonly installed with Pure Data).  

I will tell you how I do it but you can find the way that you prefer.

I use *gedit* editor and define an external tool, a simple script as follows:

~~~~
#!/bin/sh

echo $GEDIT_CURRENT_LINE | pdsend 8080 
~~~~

And assign a shurtcut key (like CTRL+. or whatever).  So, every time I press CTRL+., the current line is sent as a message to the rampcode patch.

Perl or Haskell syntax highlighting works fine.

### Using the command line

You can always send the updates from the console like `pdsend 8080 <message>` or `pdsend 8080` and then write the messages.  I don't recommend this because you won't have almost any editing tools and you'll need them, believe me.

In fact, you could just edit the expr~ content directly from the patch in Pure Data but, again, won't have any editing or syntax tool, it is really unconfortable.
 
## Messages
Remember that **all messages must end with a semicolon (;)**.  Like here:

`set 1;`

These are the possible messages:

### Expression
By default, any message is an expression message.  This means that it will update the epxr~ object with the sent content.  Be careful, expression messages can't have any spaces and any colon (,) must go with an escpe char before.  Here you have an expression message example:

`sin($v1)*pow(1-$v1%1000/1000\,8);`

### Set
Set messages change the pitch, affecting both, the tone and the speed.  By default, rampcode runs at 1Hz.  This is a +8000 ramp per second, something like 120bpm.  This is an example of a set message that decreases the pitch to 50%:

`set 0.5;`

### Record
If you want to record the output, the patch will create a randomly named wave file (something like 4213.wav).

`rec 1;` Starts recording.

`rec 0;` Stop the recording.

## More
Check the PDF quick guide and the .ramp examples for more detailed information.
