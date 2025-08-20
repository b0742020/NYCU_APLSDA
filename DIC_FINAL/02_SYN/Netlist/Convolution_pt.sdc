###################################################################

# Created by write_sdc on Thu Jan  4 18:48:15 2024

###################################################################
set sdc_version 2.1

set_units -time ps -resistance kOhm -capacitance fF -voltage V -current mA
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports {Out_OFM[12]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[11]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[10]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[9]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[8]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[7]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[6]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[5]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[4]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[3]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[2]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[1]}]
set_load -pin_load 0.05 [get_ports {Out_OFM[0]}]
set_max_delay 1000  -from [list [get_ports rst_n] [get_ports clk] [get_ports in_valid] [get_ports \
weight_valid] [get_ports {In_IFM_1[3]}] [get_ports {In_IFM_1[2]}] [get_ports   \
{In_IFM_1[1]}] [get_ports {In_IFM_1[0]}] [get_ports {In_IFM_2[3]}] [get_ports  \
{In_IFM_2[2]}] [get_ports {In_IFM_2[1]}] [get_ports {In_IFM_2[0]}] [get_ports  \
{In_IFM_3[3]}] [get_ports {In_IFM_3[2]}] [get_ports {In_IFM_3[1]}] [get_ports  \
{In_IFM_3[0]}] [get_ports {In_IFM_4[3]}] [get_ports {In_IFM_4[2]}] [get_ports  \
{In_IFM_4[1]}] [get_ports {In_IFM_4[0]}] [get_ports {In_IFM_5[3]}] [get_ports  \
{In_IFM_5[2]}] [get_ports {In_IFM_5[1]}] [get_ports {In_IFM_5[0]}] [get_ports  \
{In_IFM_6[3]}] [get_ports {In_IFM_6[2]}] [get_ports {In_IFM_6[1]}] [get_ports  \
{In_IFM_6[0]}] [get_ports {In_IFM_7[3]}] [get_ports {In_IFM_7[2]}] [get_ports  \
{In_IFM_7[1]}] [get_ports {In_IFM_7[0]}] [get_ports {In_IFM_8[3]}] [get_ports  \
{In_IFM_8[2]}] [get_ports {In_IFM_8[1]}] [get_ports {In_IFM_8[0]}] [get_ports  \
{In_IFM_9[3]}] [get_ports {In_IFM_9[2]}] [get_ports {In_IFM_9[1]}] [get_ports  \
{In_IFM_9[0]}] [get_ports {In_IFM_10[3]}] [get_ports {In_IFM_10[2]}]           \
[get_ports {In_IFM_10[1]}] [get_ports {In_IFM_10[0]}] [get_ports               \
{In_IFM_11[3]}] [get_ports {In_IFM_11[2]}] [get_ports {In_IFM_11[1]}]          \
[get_ports {In_IFM_11[0]}] [get_ports {In_IFM_12[3]}] [get_ports               \
{In_IFM_12[2]}] [get_ports {In_IFM_12[1]}] [get_ports {In_IFM_12[0]}]          \
[get_ports {In_IFM_13[3]}] [get_ports {In_IFM_13[2]}] [get_ports               \
{In_IFM_13[1]}] [get_ports {In_IFM_13[0]}] [get_ports {In_IFM_14[3]}]          \
[get_ports {In_IFM_14[2]}] [get_ports {In_IFM_14[1]}] [get_ports               \
{In_IFM_14[0]}] [get_ports {In_IFM_15[3]}] [get_ports {In_IFM_15[2]}]          \
[get_ports {In_IFM_15[1]}] [get_ports {In_IFM_15[0]}] [get_ports               \
{In_IFM_16[3]}] [get_ports {In_IFM_16[2]}] [get_ports {In_IFM_16[1]}]          \
[get_ports {In_IFM_16[0]}] [get_ports {In_IFM_17[3]}] [get_ports               \
{In_IFM_17[2]}] [get_ports {In_IFM_17[1]}] [get_ports {In_IFM_17[0]}]          \
[get_ports {In_IFM_18[3]}] [get_ports {In_IFM_18[2]}] [get_ports               \
{In_IFM_18[1]}] [get_ports {In_IFM_18[0]}] [get_ports {In_IFM_19[3]}]          \
[get_ports {In_IFM_19[2]}] [get_ports {In_IFM_19[1]}] [get_ports               \
{In_IFM_19[0]}] [get_ports {In_IFM_20[3]}] [get_ports {In_IFM_20[2]}]          \
[get_ports {In_IFM_20[1]}] [get_ports {In_IFM_20[0]}] [get_ports               \
{In_IFM_21[3]}] [get_ports {In_IFM_21[2]}] [get_ports {In_IFM_21[1]}]          \
[get_ports {In_IFM_21[0]}] [get_ports {In_IFM_22[3]}] [get_ports               \
{In_IFM_22[2]}] [get_ports {In_IFM_22[1]}] [get_ports {In_IFM_22[0]}]          \
[get_ports {In_IFM_23[3]}] [get_ports {In_IFM_23[2]}] [get_ports               \
{In_IFM_23[1]}] [get_ports {In_IFM_23[0]}] [get_ports {In_IFM_24[3]}]          \
[get_ports {In_IFM_24[2]}] [get_ports {In_IFM_24[1]}] [get_ports               \
{In_IFM_24[0]}] [get_ports {In_IFM_25[3]}] [get_ports {In_IFM_25[2]}]          \
[get_ports {In_IFM_25[1]}] [get_ports {In_IFM_25[0]}] [get_ports               \
{In_IFM_26[3]}] [get_ports {In_IFM_26[2]}] [get_ports {In_IFM_26[1]}]          \
[get_ports {In_IFM_26[0]}] [get_ports {In_IFM_27[3]}] [get_ports               \
{In_IFM_27[2]}] [get_ports {In_IFM_27[1]}] [get_ports {In_IFM_27[0]}]          \
[get_ports {In_IFM_28[3]}] [get_ports {In_IFM_28[2]}] [get_ports               \
{In_IFM_28[1]}] [get_ports {In_IFM_28[0]}] [get_ports {In_IFM_29[3]}]          \
[get_ports {In_IFM_29[2]}] [get_ports {In_IFM_29[1]}] [get_ports               \
{In_IFM_29[0]}] [get_ports {In_IFM_30[3]}] [get_ports {In_IFM_30[2]}]          \
[get_ports {In_IFM_30[1]}] [get_ports {In_IFM_30[0]}] [get_ports               \
{In_IFM_31[3]}] [get_ports {In_IFM_31[2]}] [get_ports {In_IFM_31[1]}]          \
[get_ports {In_IFM_31[0]}] [get_ports {In_IFM_32[3]}] [get_ports               \
{In_IFM_32[2]}] [get_ports {In_IFM_32[1]}] [get_ports {In_IFM_32[0]}]          \
[get_ports {In_Weight_1[3]}] [get_ports {In_Weight_1[2]}] [get_ports           \
{In_Weight_1[1]}] [get_ports {In_Weight_1[0]}] [get_ports {In_Weight_2[3]}]    \
[get_ports {In_Weight_2[2]}] [get_ports {In_Weight_2[1]}] [get_ports           \
{In_Weight_2[0]}] [get_ports {In_Weight_3[3]}] [get_ports {In_Weight_3[2]}]    \
[get_ports {In_Weight_3[1]}] [get_ports {In_Weight_3[0]}] [get_ports           \
{In_Weight_4[3]}] [get_ports {In_Weight_4[2]}] [get_ports {In_Weight_4[1]}]    \
[get_ports {In_Weight_4[0]}] [get_ports {In_Weight_5[3]}] [get_ports           \
{In_Weight_5[2]}] [get_ports {In_Weight_5[1]}] [get_ports {In_Weight_5[0]}]    \
[get_ports {In_Weight_6[3]}] [get_ports {In_Weight_6[2]}] [get_ports           \
{In_Weight_6[1]}] [get_ports {In_Weight_6[0]}] [get_ports {In_Weight_7[3]}]    \
[get_ports {In_Weight_7[2]}] [get_ports {In_Weight_7[1]}] [get_ports           \
{In_Weight_7[0]}] [get_ports {In_Weight_8[3]}] [get_ports {In_Weight_8[2]}]    \
[get_ports {In_Weight_8[1]}] [get_ports {In_Weight_8[0]}] [get_ports           \
{In_Weight_9[3]}] [get_ports {In_Weight_9[2]}] [get_ports {In_Weight_9[1]}]    \
[get_ports {In_Weight_9[0]}] [get_ports {In_Weight_10[3]}] [get_ports          \
{In_Weight_10[2]}] [get_ports {In_Weight_10[1]}] [get_ports {In_Weight_10[0]}] \
[get_ports {In_Weight_11[3]}] [get_ports {In_Weight_11[2]}] [get_ports         \
{In_Weight_11[1]}] [get_ports {In_Weight_11[0]}] [get_ports {In_Weight_12[3]}] \
[get_ports {In_Weight_12[2]}] [get_ports {In_Weight_12[1]}] [get_ports         \
{In_Weight_12[0]}] [get_ports {In_Weight_13[3]}] [get_ports {In_Weight_13[2]}] \
[get_ports {In_Weight_13[1]}] [get_ports {In_Weight_13[0]}] [get_ports         \
{In_Weight_14[3]}] [get_ports {In_Weight_14[2]}] [get_ports {In_Weight_14[1]}] \
[get_ports {In_Weight_14[0]}] [get_ports {In_Weight_15[3]}] [get_ports         \
{In_Weight_15[2]}] [get_ports {In_Weight_15[1]}] [get_ports {In_Weight_15[0]}] \
[get_ports {In_Weight_16[3]}] [get_ports {In_Weight_16[2]}] [get_ports         \
{In_Weight_16[1]}] [get_ports {In_Weight_16[0]}] [get_ports {In_Weight_17[3]}] \
[get_ports {In_Weight_17[2]}] [get_ports {In_Weight_17[1]}] [get_ports         \
{In_Weight_17[0]}] [get_ports {In_Weight_18[3]}] [get_ports {In_Weight_18[2]}] \
[get_ports {In_Weight_18[1]}] [get_ports {In_Weight_18[0]}] [get_ports         \
{In_Weight_19[3]}] [get_ports {In_Weight_19[2]}] [get_ports {In_Weight_19[1]}] \
[get_ports {In_Weight_19[0]}] [get_ports {In_Weight_20[3]}] [get_ports         \
{In_Weight_20[2]}] [get_ports {In_Weight_20[1]}] [get_ports {In_Weight_20[0]}] \
[get_ports {In_Weight_21[3]}] [get_ports {In_Weight_21[2]}] [get_ports         \
{In_Weight_21[1]}] [get_ports {In_Weight_21[0]}] [get_ports {In_Weight_22[3]}] \
[get_ports {In_Weight_22[2]}] [get_ports {In_Weight_22[1]}] [get_ports         \
{In_Weight_22[0]}] [get_ports {In_Weight_23[3]}] [get_ports {In_Weight_23[2]}] \
[get_ports {In_Weight_23[1]}] [get_ports {In_Weight_23[0]}] [get_ports         \
{In_Weight_24[3]}] [get_ports {In_Weight_24[2]}] [get_ports {In_Weight_24[1]}] \
[get_ports {In_Weight_24[0]}] [get_ports {In_Weight_25[3]}] [get_ports         \
{In_Weight_25[2]}] [get_ports {In_Weight_25[1]}] [get_ports {In_Weight_25[0]}] \
[get_ports {In_Weight_26[3]}] [get_ports {In_Weight_26[2]}] [get_ports         \
{In_Weight_26[1]}] [get_ports {In_Weight_26[0]}] [get_ports {In_Weight_27[3]}] \
[get_ports {In_Weight_27[2]}] [get_ports {In_Weight_27[1]}] [get_ports         \
{In_Weight_27[0]}] [get_ports {In_Weight_28[3]}] [get_ports {In_Weight_28[2]}] \
[get_ports {In_Weight_28[1]}] [get_ports {In_Weight_28[0]}] [get_ports         \
{In_Weight_29[3]}] [get_ports {In_Weight_29[2]}] [get_ports {In_Weight_29[1]}] \
[get_ports {In_Weight_29[0]}] [get_ports {In_Weight_30[3]}] [get_ports         \
{In_Weight_30[2]}] [get_ports {In_Weight_30[1]}] [get_ports {In_Weight_30[0]}] \
[get_ports {In_Weight_31[3]}] [get_ports {In_Weight_31[2]}] [get_ports         \
{In_Weight_31[1]}] [get_ports {In_Weight_31[0]}] [get_ports {In_Weight_32[3]}] \
[get_ports {In_Weight_32[2]}] [get_ports {In_Weight_32[1]}] [get_ports         \
{In_Weight_32[0]}]]  -to [list [get_ports out_valid] [get_ports {Out_OFM[12]}] [get_ports          \
{Out_OFM[11]}] [get_ports {Out_OFM[10]}] [get_ports {Out_OFM[9]}] [get_ports   \
{Out_OFM[8]}] [get_ports {Out_OFM[7]}] [get_ports {Out_OFM[6]}] [get_ports     \
{Out_OFM[5]}] [get_ports {Out_OFM[4]}] [get_ports {Out_OFM[3]}] [get_ports     \
{Out_OFM[2]}] [get_ports {Out_OFM[1]}] [get_ports {Out_OFM[0]}]]
