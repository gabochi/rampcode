# RAMPCODE

Rampcode is a PD patch for livecoding with math and logical expressions, inspired by bytebeat but with a few more tools to mess with synthesis and rythm.

## How does it work?
It has **just one time ramp (phasor~) and all sound result is a function of that**. It is basically waveshaping with math and logic (bitwise too, so you can do bytebeat :wink:) plus a rythmical aspect, envelopes and random values. 

## Set up instructions
1. Download the files.

2. Open the **rampcode.pd** patch in PD (you need the **in.pd** in the same folder).

3. Add this line to the vimrc (you need **pdsend** from **puredata-utils**):
`autocmd BufWritePost *.gede silent exec "!pdsend 3005 < <afile>"`

4. Run **vim** and write something like this
`ramp 1; code sin($v1*2) 1 1, 0;`

5. Save the file as **(whatever).gede**

You should hear an annoying sinewave. Try dividing the sine to change the pitch like `sin($v1/4)` and play with different subdivissions and envelope curves as `sin($v1/4) 8 2`, `sin($v1/4) 3 10`, `sin($v1/4) 4 1`, etc. There is an optional fourth argument for paning: `sin($v1/8) 8 1 0`. Paning goes from -1 (full left) to 1 (full right). All **code** arguments but envelope curve can be expressions as in `sin($v1/4) 8*($v1%t<t/2) 1 sin($v1/t)`.

**$v1** is the actual value of the ramp, an increasing counter (8000 per cycle). **t** is a very useful constant = 8000. Then, you have all math (`+ - * / % ...`), bitwise (`& | >> << ...`) and non-bitwise (`&& || > < ...`) logical operators. Also, there is a random value **$v2** that's generated (from 0 to 1) in every subdivission of the expression.

## Messages
There are two kinds of messages that rampcode receives: *ramp* and *code*. **Each type of msg is separated by a ; and each msg is separated by ,**.

**ramp** sets the general speed and pitch in cycles per second (hz), *think of a cycle as a pattern*.

**code** create multiple signals from the main ramp.

## Examples are your best friend
I think the best way to understand it is taking a look at the examples and mess with them. There are many topics and possibilities. **Good luck!** Don't hesitate to contact me to ask anything and show me your rampcodes :heart:

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
