module ex1(SW,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,LEDR);

//INPUT_AND_OUTPUT
//SWITCH_8 is Cin
//SWITCH_4-7 is B
//SWITCH_0-3 is A
//HEX5,HEX4 is result 
input [8:0]SW;
output [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;
output[9:0]LEDR;


//wire
wire COUT;
wire [4:0]SUM;


//full_adder calculate
assign {COUT,SUM} = SW[3:0] + SW[7:4] + SW[8];


assign LEDR[0] = COUT;



//十位數控制
assign HEX5[6] = ~SUM[4]|(~SUM[3]&~SUM[2]);
assign HEX5[5] = SUM[4]|(SUM[3]&SUM[1])|(SUM[3]&SUM[2]);
assign HEX5[4] = (~SUM[4]&SUM[3]&SUM[1])|(~SUM[4]&SUM[3]&SUM[2])|(SUM[4]&~SUM[3]&~SUM[2])|(SUM[3]&SUM[2]&SUM[1]);
assign HEX5[3] = (~SUM[4]&SUM[3]&SUM[1])|(~SUM[4]&SUM[3]&SUM[2])|(SUM[4]&~SUM[3]&~SUM[2]);
assign HEX5[2] = (SUM[4]&~SUM[3]&SUM[2])|(SUM[4]&SUM[2]&~SUM[1])|(SUM[4]&SUM[3]&~SUM[2]);
assign HEX5[1] = 1'b0;
assign HEX5[0] = (~SUM[4]&SUM[3]&SUM[1])|(~SUM[4]&SUM[3]&SUM[2])|(SUM[4]&~SUM[3]&~SUM[2]);


//個位數控制
assign HEX4[6] = (~SUM[4]&~SUM[3]&~SUM[2]&~SUM[1])|(~SUM[3]&~SUM[2]&~SUM[1]&SUM[0])|(~SUM[4]&SUM[3]&~SUM[2]&SUM[1])|(SUM[3]&~SUM[2]&SUM[1]&SUM[0])|(SUM[4]&~SUM[3]&SUM[2]&~SUM[1])|(SUM[4]&SUM[3]&SUM[2]&SUM[1])|(~SUM[4]&~SUM[3]&SUM[2]&SUM[1]&SUM[0]);
assign HEX4[5] = (~SUM[4]&~SUM[3]&~SUM[2]&SUM[0])|(~SUM[4]&~SUM[3]&~SUM[2]&SUM[1])|(~SUM[4]&~SUM[2]&SUM[1]&SUM[0])|(~SUM[4]&SUM[3]&SUM[2]&~SUM[1])|(SUM[4]&~SUM[3]&SUM[2]&SUM[0])|(SUM[4]&~SUM[3]&SUM[2]&SUM[1]);
assign HEX4[4] = (SUM[0])|(~SUM[4]&~SUM[3]&SUM[2]&~SUM[1])|(~SUM[4]&SUM[3]&SUM[2]&SUM[1])|(SUM[4]&SUM[3]&~SUM[2]&~SUM[1]);
assign HEX4[3] = (~SUM[4]&~SUM[2]&~SUM[1]&SUM[0])|(SUM[3]&~SUM[2]&SUM[1]&SUM[0])|(SUM[4]&~SUM[3]&~SUM[2]&SUM[0])|(SUM[4]&SUM[2]&~SUM[1]&SUM[0])|(~SUM[4]&~SUM[3]&SUM[2]&~SUM[1]&~SUM[0])|(~SUM[4]&~SUM[3]&SUM[2]&SUM[1]&SUM[0])|(~SUM[4]&SUM[3]&SUM[2]&SUM[1]&~SUM[0])|(SUM[4]&SUM[3]&~SUM[2]&~SUM[1]&~SUM[0]);
assign HEX4[2] = (~SUM[4]&~SUM[3]&~SUM[2]&SUM[1]&~SUM[0])|(~SUM[4]&SUM[3]&SUM[2]&~SUM[1]&~SUM[0])|(SUM[4]&~SUM[3]&SUM[2]&SUM[1]&~SUM[0]);
assign HEX4[1] = (SUM[3]&SUM[2]&SUM[1]&SUM[0])|(~SUM[4]&~SUM[3]&SUM[2]&~SUM[1]&SUM[0])|(~SUM[4]&~SUM[3]&SUM[2]&SUM[1]&~SUM[0])|(SUM[4]&~SUM[3]&~SUM[2]&~SUM[1]&~SUM[0])|(SUM[4]&SUM[3]&~SUM[2]&~SUM[1]&SUM[0])|(SUM[4]&SUM[3]&~SUM[2]&SUM[1]&~SUM[0]);
assign HEX4[0] = (~SUM[4]&~SUM[3]&SUM[2]&~SUM[0])|(~SUM[4]&SUM[2]&SUM[1]&~SUM[0])|(SUM[4]&~SUM[2]&~SUM[1]&~SUM[0])|(SUM[4]&SUM[3]&~SUM[2]&~SUM[0])|(~SUM[4]&~SUM[3]&~SUM[2]&~SUM[1]&SUM[0])|(~SUM[4]&SUM[3]&~SUM[2]&SUM[1]&SUM[0])|(SUM[4]&~SUM[3]&SUM[2]&~SUM[1]&SUM[0]);


//HEX3 作動
assign HEX3[6] = 1'b1;
assign HEX3[5] = (SW[7]&SW[6])|(SW[7]&SW[5]);
assign HEX3[4] = (SW[7]&SW[6])|(SW[7]&SW[5]);
assign HEX3[3] = (SW[7]&SW[6])|(SW[7]&SW[5]);
assign HEX3[2] = 1'b0;
assign HEX3[1] = 1'b0;
assign HEX3[0] = (SW[7]&SW[6])|(SW[7]&SW[5]); 


//HEX2 作動
assign HEX2[6] = (SW[7]&~SW[6]&SW[5])|(~SW[7]&SW[6]&SW[5]&SW[4])|(~SW[7]&~SW[6]&~SW[5]);
assign HEX2[5] = (SW[7]&SW[6]&~SW[5])|(~SW[6]&SW[5]&SW[4])|(~SW[7]&~SW[6]&SW[5])|(~SW[7]&~SW[6]&SW[4]);
assign HEX2[4] = SW[4]|(~SW[7]&SW[6]&~SW[5])|(SW[7]&SW[6]&SW[5]);
assign HEX2[3] = (SW[7]&~SW[6]&SW[4])|(~SW[6]&~SW[5]&SW[4])|(SW[7]&SW[6]&SW[5]&~SW[4])|(~SW[7]&SW[6]&SW[5]&SW[4])|(~SW[7]&SW[6]&~SW[5]&~SW[4]);
assign HEX2[2] = (SW[7]&SW[6]&~SW[5]&~SW[4])|(~SW[7]&~SW[6]&SW[5]&~SW[4]);
assign HEX2[1] = (SW[7]&SW[6]&SW[5]&SW[4])|(~SW[7]&SW[6]&~SW[5]&SW[4])|(~SW[7]&SW[6]&SW[5]&~SW[4]);
assign HEX2[0] = (SW[6]&SW[5]&~SW[4])|(~SW[7]&SW[6]&~SW[4])|(SW[7]&~SW[6]&SW[5]&SW[4])|(~SW[7]&~SW[6]&~SW[5]&SW[4]);


//HEX1 作動
assign HEX1[6] = 1'b1;
assign HEX1[5] = (SW[3]&SW[2])|(SW[3]&SW[1]);
assign HEX1[4] = (SW[3]&SW[2])|(SW[3]&SW[1]);
assign HEX1[3] = (SW[3]&SW[2])|(SW[3]&SW[1]);
assign HEX1[2] = 1'b0;
assign HEX1[1] = 1'b0;
assign HEX1[0] = (SW[3]&SW[2])|(SW[3]&SW[1]); 


//HEX0 作動
assign HEX0[6] = (SW[3]&~SW[2]&SW[1])|(~SW[3]&SW[2]&SW[1]&SW[0])|(~SW[3]&~SW[2]&~SW[1]);
assign HEX0[5] = (SW[3]&SW[2]&~SW[1])|(~SW[2]&SW[1]&SW[0])|(~SW[3]&~SW[2]&SW[1])|(~SW[3]&~SW[2]&SW[0]);
assign HEX0[4] = SW[0]|(~SW[3]&SW[2]&~SW[1])|(SW[3]&SW[2]&SW[1]);
assign HEX0[3] = (SW[3]&~SW[2]&SW[0])|(~SW[2]&~SW[1]&SW[0])|(SW[3]&SW[2]&SW[1]&~SW[0])|(~SW[3]&SW[2]&SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&~SW[0]);
assign HEX0[2] = (SW[3]&SW[2]&~SW[1]&~SW[0])|(~SW[3]&~SW[2]&SW[1]&~SW[0]);
assign HEX0[1] = (SW[3]&SW[2]&SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&SW[1]&~SW[0]);
assign HEX0[0] = (SW[2]&SW[1]&~SW[0])|(~SW[3]&SW[2]&~SW[0])|(SW[3]&~SW[2]&SW[1]&SW[0])|(~SW[3]&~SW[2]&~SW[1]&SW[0]);


//雙位數時亮燈
assign LEDR[9] = ((SW[3]&SW[2])|(SW[3]&SW[1]))||((SW[7]&SW[6])|(SW[7]&SW[5]));

endmodule

