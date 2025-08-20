wvResizeWindow -win $_nWave1 8 31 893 202
wvResizeWindow -win $_nWave1 8 31 1097 615
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/RAID2/COURSE/dic/dic145/final/03_GATE/Convolution_SYN.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/BUFx2_ASAP7_75t_R"
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_PATTERN"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/BUFx2_ASAP7_75t_R"
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_PATTERN"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
{/TESTBED/u_PATTERN/Golden_OFM\[12:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
{/TESTBED/u_PATTERN/Golden_OFM\[12:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/BUFx2_ASAP7_75t_R"
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_PATTERN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_PATTERN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_Convolution"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
{/TESTBED/u_PATTERN/Golden_OFM\[12:0\]} \
{/TESTBED/u_Convolution/out\[12:0\]} \
{/TESTBED/u_Convolution/out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
{/TESTBED/u_PATTERN/Golden_OFM\[12:0\]} \
{/TESTBED/u_Convolution/out\[12:0\]} \
{/TESTBED/u_Convolution/out_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvZoom -win $_nWave1 113340.265957 496057.739362
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/BUFx2_ASAP7_75t_R"
wvGetSignalSetScope -win $_nWave1 "/TESTBED"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_PATTERN"
wvGetSignalSetScope -win $_nWave1 "/TESTBED/u_Convolution"
wvGetSignalSetSignalFilter -win $_nWave1 "in_valid"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/TESTBED/u_PATTERN/Pattern_ifm\[1:32\]} \
{/TESTBED/u_PATTERN/Pattern_ofm\[0:49\]} \
{/TESTBED/u_PATTERN/Pattern_weight\[1:32\]} \
{/TESTBED/u_PATTERN/Golden_OFM\[12:0\]} \
{/TESTBED/u_Convolution/out\[12:0\]} \
{/TESTBED/u_Convolution/out_valid} \
{/TESTBED/u_Convolution/in_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvExit
