# RAMPCODE

Bytebeat live-coding system.

## Requirements

+ **Bash** (scripts)
+ **Vim** (editor)
+ **Pure Data** (audio)

## Usage

Just run `./rampcode.sh` inside its directory and then follow the tutorial instructions.

### No sound?

Rampcode runs **Pure Data** with the default audio settings.  You can change and save them in **PD** or edit the arguments in the `./rampcode.sh` script.

## How does it work?

Rampcode uses **PD** dynamic patchig for updating `expr~` objects.  **Vim** script send the new content, the syntax is converted via **bash**.
More documentation available in the `text` object, inside the patch.

### Bytebeat

Bytebeat is a discovery made by **Viznut**, check [his page](http://viznut.fi/en/) for more information.

--

## Contact:

[Visit my page](https://gabochi.github.io)

Mail me : gabriel.vinazza@gmail.com

[Check my Instagram](https://instagram.com/gabovinazza)
