# RAMPCODE
Rampcode is a live coding system inspired by the bytebeat technique (but careful, it is not the same). It works with *Pure Data* and, basically, it's all about making synthesis algorithms with logical-mathematical expression using only one variable: an always increasing signal, that is, a ramp (like waveshaping a very slow saw wave LFO with a huge amplitude).

# Setup
The simplest way to use Rampcode is downloading the patch (*rampcode.pd*) and installing the *Atom package* by Reo Matsumoto. The package is available at https://github.com/pndmix/atom-rampcode, but you can install it easily from *Atom* itself.

Then, you first open the patch in *Pure Data* and then run *Atom*. You toggle the package pressing **Ctrl+Alt+R** and voila! You can now make some noise. Use **Shift+Enter** to evaluate a line and **Alt+.** to stop the sound in any point.
 
You can also use another editor with the proper configuration or send messages to the patch directly from Pure Data or the command like with the pdsend program (generally installed along with Pure Data).
 
# Valid messages

Every message should end with a semicolon `;`. 

There are many possible messages but, by default, you can just write an expression and evaluate it like: `$v1%2;`

`$v1` is the input signal and you can check all the possible expressions on the **expr~** object help inside Pure Data.

### Open *cheatsheet.ramp* file for instructions and examples or take this short tutorial:

[![Rampcode Tutorial Video](https://img.youtube.com/vi/UVPiRbt5MBc/0.jpg)](https://www.youtube.com/watch?v=UVPiRbt5MBc)

