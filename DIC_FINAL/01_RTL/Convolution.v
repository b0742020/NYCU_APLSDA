module CIM_Macro (clk,rst_n,in_valid,weight_valid
,I1,I2,I3,I4
,I5,I6,I7,I8
,I9,I10,I11,I12
,I13,I14,I15,I16
,I17,I18,I19,I20
,I21,I22,I23,I24
,I25,I26,I27,I28
,I29,I30,I31,I32
,W1  ,W2  ,W3  ,W4  
,W5  ,W6  ,W7  ,W8  
,W9  ,W10 ,W11 ,W12  
,W13 ,W14 ,W15 ,W16 
,W17 ,W18 ,W19 ,W20 
,W21 ,W22 ,W23 ,W24 
,W25 ,W26 ,W27 ,W28 
,W29 ,W30 ,W31 ,W32
,out_valid
,out_result
);


//=====================================================================//
//                             I/O port
//=====================================================================//
input clk , rst_n;
input in_valid;
input weight_valid;
input [3:0]I1,I2,I3,I4
,I5,I6,I7,I8
,I9,I10,I11,I12
,I13,I14,I15,I16
,I17,I18,I19,I20
,I21,I22,I23,I24
,I25,I26,I27,I28
,I29,I30,I31,I32
,W1  ,W2  ,W3  ,W4  
,W5  ,W6  ,W7  ,W8  
,W9  ,W10 ,W11 ,W12  
,W13 ,W14 ,W15 ,W16 
,W17 ,W18 ,W19 ,W20 
,W21 ,W22 ,W23 ,W24 
,W25 ,W26 ,W27 ,W28 
,W29 ,W30 ,W31 ,W32;
output reg out_valid;
output reg[12:0]out_result;
//=====================================================================//
//                                                                     //
//=====================================================================//

//=====================================================================//
//                                 Register 
//=====================================================================//
reg done; 
reg[12:0]input_value[1:32];
reg[12:0]input_weight[1:32];
reg [12:0] mult_result [1:32];
reg [12:0] sum_result_1 [1:16];
reg [12:0] sum_result_2 [1:8];
reg [12:0] sum_result_3 [1:4];
reg [12:0] sum_result_4 [1:2];
reg [12:0] sum_result_5;
//=====================================================================//
//                                                                     //
//=====================================================================//

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		input_weight[1] <='d0;
		input_weight[2] <='d0;
		input_weight[3] <='d0;
		input_weight[4] <='d0;
		input_weight[5] <='d0;
		input_weight[6] <='d0;
		input_weight[7] <='d0;
		input_weight[8] <='d0;
		input_weight[9] <='d0;
		input_weight[10] <='d0;
		input_weight[11] <='d0;
		input_weight[12] <='d0;
		input_weight[13] <='d0;
		input_weight[14] <='d0;
		input_weight[15] <='d0;
		input_weight[16] <='d0;
		input_weight[17] <='d0;
		input_weight[18] <='d0;
		input_weight[19] <='d0;
		input_weight[20] <='d0;
		input_weight[21] <='d0;
		input_weight[22] <='d0;
		input_weight[23] <='d0;
		input_weight[24] <='d0;
		input_weight[25] <='d0;
		input_weight[26] <='d0;
		input_weight[27] <='d0;
		input_weight[28] <='d0;
		input_weight[29] <='d0;
		input_weight[30] <='d0;
		input_weight[31] <='d0;
		input_weight[32] <='d0;
	end
	else begin 
		if(weight_valid)begin
		input_weight[1] <=W1;
		input_weight[2] <=W2;
		input_weight[3] <=W3;
		input_weight[4] <=W4;
		input_weight[5] <=W5;
		input_weight[6] <=W6;
		input_weight[7] <=W7;
		input_weight[8] <=W8;
		input_weight[9] <=W9;
		input_weight[10] <=W10;
		input_weight[11] <=W11;
		input_weight[12] <=W12;
		input_weight[13] <=W13;
		input_weight[14] <=W14;
		input_weight[15] <=W15;
		input_weight[16] <=W16;
		input_weight[17] <=W17;
		input_weight[18] <=W18;
		input_weight[19] <=W19;
		input_weight[20] <=W20;
		input_weight[21] <=W21;
		input_weight[22] <=W22;
		input_weight[23] <=W23;
		input_weight[24] <=W24;
		input_weight[25] <=W25;
		input_weight[26] <=W26;
		input_weight[27] <=W27;
		input_weight[28] <=W28;
		input_weight[29] <=W29;
		input_weight[30] <=W30;
		input_weight[31] <=W31;
		input_weight[32] <=W32;
		end
	end
end

always @(posedge clk or negedge rst_n)begin	
	if(!rst_n) begin
		input_value[1] <='d0;
		input_value[2] <='d0;
		input_value[3] <='d0;
		input_value[4] <='d0;
		input_value[5] <='d0;
		input_value[6] <='d0;
		input_value[7] <='d0;
		input_value[8] <='d0;
		input_value[9] <='d0;
		input_value[10] <='d0;
		input_value[11] <='d0;
		input_value[12] <='d0;
		input_value[13] <='d0;
		input_value[14] <='d0;
		input_value[15] <='d0;
		input_value[16] <='d0;
		input_value[17] <='d0;
		input_value[18] <='d0;
		input_value[19] <='d0;
		input_value[20] <='d0;
		input_value[21] <='d0;
		input_value[22] <='d0;
		input_value[23] <='d0;
		input_value[24] <='d0;
		input_value[25] <='d0;
		input_value[26] <='d0;
		input_value[27] <='d0;
		input_value[28] <='d0;
		input_value[29] <='d0;
		input_value[30] <='d0;
		input_value[31] <='d0;
		input_value[32] <='d0;
	end
	else begin 
		if(in_valid)begin
			input_value[1] <=I1;
			input_value[2] <=I2;
			input_value[3] <=I3;
			input_value[4] <=I4;
			input_value[5] <=I5;
			input_value[6] <=I6;
			input_value[7] <=I7;
			input_value[8] <=I8;
			input_value[9] <=I9;
			input_value[10] <=I10;
			input_value[11] <=I11;
			input_value[12] <=I12;
			input_value[13] <=I13;
			input_value[14] <=I14;
			input_value[15] <=I15;
			input_value[16] <=I16;
			input_value[17] <=I17;
			input_value[18] <=I18;
			input_value[19] <=I19;
			input_value[20] <=I20;
			input_value[21] <=I21;
			input_value[22] <=I22;
			input_value[23] <=I23;
			input_value[24] <=I24;
			input_value[25] <=I25;
			input_value[26] <=I26;
			input_value[27] <=I27;
			input_value[28] <=I28;
			input_value[29] <=I29;
			input_value[30] <=I30;
			input_value[31] <=I31;
			input_value[32] <=I32;
		end
	end
end

always @(*)begin
	mult_result[1] = input_value[1]*input_weight[1];
	mult_result[2] = input_value[2]*input_weight[2];
	mult_result[3] = input_value[3]*input_weight[3];
	mult_result[4] = input_value[4]*input_weight[4];
	mult_result[5] = input_value[5]*input_weight[5];
	mult_result[6] = input_value[6]*input_weight[6];
	mult_result[7] = input_value[7]*input_weight[7];
	mult_result[8] = input_value[8]*input_weight[8];
	mult_result[9] = input_value[9]*input_weight[9];
	mult_result[10] = input_value[10]*input_weight[10];
	mult_result[11] = input_value[11]*input_weight[11];
	mult_result[12] = input_value[12]*input_weight[12];
	mult_result[13] = input_value[13]*input_weight[13];
	mult_result[14] = input_value[14]*input_weight[14];
	mult_result[15] = input_value[15]*input_weight[15];
	mult_result[16] = input_value[16]*input_weight[16];
	mult_result[17] = input_value[17]*input_weight[17];
	mult_result[18] = input_value[18]*input_weight[18];
	mult_result[19] = input_value[19]*input_weight[19];
	mult_result[20] = input_value[20]*input_weight[20];
	mult_result[21] = input_value[21]*input_weight[21];
	mult_result[22] = input_value[22]*input_weight[22];
	mult_result[23] = input_value[23]*input_weight[23];
	mult_result[24] = input_value[24]*input_weight[24];
	mult_result[25] = input_value[25]*input_weight[25];
	mult_result[26] = input_value[26]*input_weight[26];
	mult_result[27] = input_value[27]*input_weight[27];
	mult_result[28] = input_value[28]*input_weight[28];
	mult_result[29] = input_value[29]*input_weight[29];
	mult_result[30] = input_value[30]*input_weight[30];
	mult_result[31] = input_value[31]*input_weight[31];
	mult_result[32] = input_value[32]*input_weight[32];
end

always @(*)begin
	sum_result_1[1] = mult_result[1] + mult_result[2];
	sum_result_1[2] = mult_result[3] + mult_result[4];
	sum_result_1[3] = mult_result[5] + mult_result[6];
	sum_result_1[4] = mult_result[7] + mult_result[8];
	sum_result_1[5] = mult_result[9] + mult_result[10];
	sum_result_1[6] = mult_result[11] + mult_result[12];
	sum_result_1[7] = mult_result[13] + mult_result[14];
	sum_result_1[8] = mult_result[15] + mult_result[16];
	sum_result_1[9] = mult_result[17] + mult_result[18];
	sum_result_1[10] = mult_result[19] + mult_result[20];
	sum_result_1[11] = mult_result[21] + mult_result[22];
	sum_result_1[12] = mult_result[23] + mult_result[24];
	sum_result_1[13] = mult_result[25] + mult_result[26];
	sum_result_1[14] = mult_result[27] + mult_result[28];
	sum_result_1[15] = mult_result[29] + mult_result[30];
	sum_result_1[16] = mult_result[31] + mult_result[32];
end
 
always @(*)begin
	sum_result_2[1] = sum_result_1[1] + sum_result_1[2];
	sum_result_2[2] = sum_result_1[3] + sum_result_1[4];
	sum_result_2[3] = sum_result_1[5] + sum_result_1[6];
	sum_result_2[4] = sum_result_1[7] + sum_result_1[8];
	sum_result_2[5] = sum_result_1[9] + sum_result_1[10];
	sum_result_2[6] = sum_result_1[11] + sum_result_1[12];
	sum_result_2[7] = sum_result_1[13] + sum_result_1[14];
	sum_result_2[8] = sum_result_1[15] + sum_result_1[16];
end

always @(*)begin
	sum_result_3[1] = sum_result_2[1] + sum_result_2[2];
	sum_result_3[2] = sum_result_2[3] + sum_result_2[4];
	sum_result_3[3] = sum_result_2[5] + sum_result_2[6];
	sum_result_3[4] = sum_result_2[7] + sum_result_2[8];
end

always @(*)begin
	sum_result_4[1] = sum_result_3[1] + sum_result_3[2];
	sum_result_4[2] = sum_result_3[3] + sum_result_3[4];
	
	sum_result_5 = sum_result_4[1] + sum_result_4[2];
	
end

//=====================================================================//
//                           Output & Counter                          //
//=====================================================================//

always @(posedge clk or negedge rst_n )begin
	if(!rst_n)begin 
		done <= 0;
	end
	else begin 
		if(in_valid) begin
			done <= 1;
		end
		else begin
			done <= 0 ;
		end
	end
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		out_valid <= 0;
	end
	else begin 
		if(done)begin
			out_valid <= 1;
		end
		else begin 
			out_valid <= 0;
		end 
	end
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		out_result <= 'd0;
	end
	else begin
		if(done)begin
			out_result <= sum_result_5;
		end
		else begin
			out_result <='d0;
		end
	end
end

endmodule
