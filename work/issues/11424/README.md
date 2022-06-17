## Dshot commands causing motors to spin (when BDIR=OFF) #11424
* https://github.com/betaflight/betaflight/issues/11424

* Logic analyzer capture shows single motor getting the correct command but all others are getting `0xFFFF` (all ones) causing them to spin
* Debugging the dshot bitbang code, 
    1. clear all motor values
    2. Only set motor value from command
* Could mean the defaults are wrong? Or something is inverting the default value of 0 after clearing the motors? 
* dshot bitbang dma layout single 32 bit uint for each timing phase of dshot signal `H, (1=H,0=L), L` where middle indicates the bit value
    * upper 16 bits is non-inverted gpio pins
    * lower 16 bits is inverted gpio pins
* Added cliDebug logging to dump [dshot dma output port buffer](/home/john/code/drone/betaflight-workspace/work/issues/11424/dshot-port-out-buffer-dump.md)
     