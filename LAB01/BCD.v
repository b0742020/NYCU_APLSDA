module ex1(SW,HEX0,HEX1);
input [3:0]SW;
output [6:0]HEX0,HEX1;

assign HEX1[6] = 1'b1;
assign HEX1[5] = (SW[3]&SW[2])|(SW[3]&SW[1]);
assign HEX1[4] = (SW[3]&SW[2])|(SW[3]&SW[1]);
assign HEX1[3] = (SW[3]&SW[2])|(SW[3]&SW[1]);
assign HEX1[2] = 1'b0;
assign HEX1[1] = 1'b0;
assign HEX1[0] = (SW[3]&SW[2])|(SW[3]&SW[1]); 


assign HEX0[6] = (SW[3]&~SW[2]&SW[1])|(~SW[3]&SW[2]&SW[1]&SW[0])|(~SW[3]&~SW[2]&~SW[1]);
assign HEX0[5] = (SW[3]&SW[2]&~SW[1])|(~SW[2]&SW[1]&SW[0])|(~SW[3]&~SW[2]&SW[1])|(~SW[3]&~SW[2]&SW[0]);
assign HEX0[4] = SW[0]|(~SW[3]&SW[2]&~SW[1])|(SW[3]&SW[2]&SW[1]);
assign HEX0[3] = (SW[3]&~SW[2]&SW[0])|(~SW[2]&~SW[1]&SW[0])|(SW[3]&SW[2]&SW[1]&~SW[0])|(~SW[3]&SW[2]&SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&~SW[0]);
assign HEX0[2] = (SW[3]&SW[2]&~SW[1]&~SW[0])|(~SW[3]&~SW[2]&SW[1]&~SW[0]);
assign HEX0[1] = (SW[3]&SW[2]&SW[1]&SW[0])|(~SW[3]&SW[2]&~SW[1]&SW[0])|(~SW[3]&SW[2]&SW[1]&~SW[0]);
assign HEX0[0] = (SW[2]&SW[1]&~SW[0])|(~SW[3]&SW[2]&~SW[0])|(SW[3]&~SW[2]&SW[1]&SW[0])|(~SW[3]&~SW[2]&~SW[1]&SW[0]);
endmodule
