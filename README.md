# reface
This is a small script I wrote to interact with my Yamaha Reface DX synth.
It uses `amidi` to send SYSEX commands.
It's quite dirty so only use it if you know what you are doing. 

# Instructions
- `reface pull` downloads the current patch from the synth into a syx file named (hopefully) like the patch. You can also specify a filename to output to.
- `reface push <syxfile>` pushes the specified file into the synth.
