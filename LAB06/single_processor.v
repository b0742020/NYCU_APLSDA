module processor (
    input CLOCK_50,
input [2:0]KEY,
output reg  [9:0]LEDR,
output reg [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5
);
reg [4:0]addr;
reg [7:0]instru_tmp;
reg [7:0]instru_ff[31:0];
reg [7:0]R[7:0];
wire [7:0]instru;

//KEY[0] is reset     
//KEY[1] is ROM and counter 's clk     
//KEY[2] is procesor 's clk
//00 mvi 
//01 mv 
//10 add
//11 sub
rom_1 rom_test_inst (
	.address(addr),
	.clock(KEY[1]),
	.q(instru)
	);

always@(posedge KEY[1])begin
	addr <= (addr==5'd31)?5'd0:addr+5'd1;
end


always@(negedge KEY[2] or negedge KEY[0])begin
	if(!KEY[0])begin
		instru_tmp <= 8'b00000000;
	end
	else begin
		instru_tmp <= instru;
        if((instru[7:6]==2'b00)&&(instru_tmp[7:6]!=2'b01))begin
            R[instru[5:3]] <=  R[instru[2:0]];
        end
        else if (instru_tmp[7:6]==2'b01)begin
            R[instru_tmp[5:3]] <=  instru;
        end
        else if (instru[7:6]==2'b10)begin
            R[instru[5:3]] <=  R[instru[5:3]] + R[instru[2:0]];
        end
        else if(instru[7:6]==2'b11) begin
            R[instru[5:3]] <=  R[instru[5:3]] - R[instru[2:0]];
        end
	end
end


always@(*)begin
	LEDR = instru_tmp;
end


always@(*)begin
	case(R[1][3:0])
		4'd1: HEX0 = 7'b1111001;
        4'd2: HEX0 = 7'b0100100;
        4'd3: HEX0 = 7'b0110000;
        4'd4: HEX0 = 7'b0011001;
        4'd5: HEX0 = 7'b0010010;
        4'd6: HEX0 = 7'b0000010;
        4'd7: HEX0 = 7'b1011000;
        4'd8: HEX0 = 7'b0000000;
        4'd9: HEX0 = 7'b0011000;
        4'd10: HEX0 = 7'b0001000;
        4'd11: HEX0 = 7'b0000011;
        4'd12: HEX0 = 7'b1000110;
        4'd13: HEX0 = 7'b0100001;
        4'd14: HEX0 = 7'b0000110;
        4'd15: HEX0 = 7'b0001110;
        default: HEX0 = 7'b1000000;
	endcase
end


always@(*)begin
	case(R[1][7:4])
		4'd1: HEX1 = 7'b1111001;
        4'd2: HEX1 = 7'b0100100;
        4'd3: HEX1 = 7'b0110000;
        4'd4: HEX1 = 7'b0011001;
        4'd5: HEX1 = 7'b0010010;
        4'd6: HEX1 = 7'b0000010;
        4'd7: HEX1 = 7'b1011000;
        4'd8: HEX1 = 7'b0000000;
        4'd9: HEX1 = 7'b0011000;
        4'd10: HEX1 = 7'b0001000;
        4'd11: HEX1 = 7'b0000011;
        4'd12: HEX1 = 7'b1000110;
        4'd13: HEX1 = 7'b0100001;
        4'd14: HEX1 = 7'b0000110;
        4'd15: HEX1 = 7'b0001110;
        default: HEX1 = 7'b1000000;
	endcase
end


always@(*)begin
	case(R[0][3:0])
		4'd1: HEX2 = 7'b1111001;
        4'd2: HEX2 = 7'b0100100;
        4'd3: HEX2 = 7'b0110000;
        4'd4: HEX2 = 7'b0011001;
        4'd5: HEX2 = 7'b0010010;
        4'd6: HEX2 = 7'b0000010;
        4'd7: HEX2 = 7'b1011000;
        4'd8: HEX2 = 7'b0000000;
        4'd9: HEX2 = 7'b0011000;
        4'd10: HEX2 = 7'b0001000;
        4'd11: HEX2 = 7'b0000011;
        4'd12: HEX2 = 7'b1000110;
        4'd13: HEX2 = 7'b0100001;
        4'd14: HEX2 = 7'b0000110;
        4'd15: HEX2 = 7'b0001110;
        default: HEX2 = 7'b1000000;
	endcase
end


always@(*)begin
	case(R[0][7:4])
		4'd1: HEX3 = 7'b1111001;
        4'd2: HEX3 = 7'b0100100;
        4'd3: HEX3 = 7'b0110000;
        4'd4: HEX3 = 7'b0011001;
        4'd5: HEX3 = 7'b0010010;
        4'd6: HEX3 = 7'b0000010;
        4'd7: HEX3 = 7'b1011000;
        4'd8: HEX3 = 7'b0000000;
        4'd9: HEX3 = 7'b0011000;
        4'd10: HEX3 = 7'b0001000;
        4'd11: HEX3 = 7'b0000011;
        4'd12: HEX3 = 7'b1000110;
        4'd13: HEX3 = 7'b0100001;
        4'd14: HEX3 = 7'b0000110;
        4'd15: HEX3 = 7'b0001110;
        default: HEX3 = 7'b1000000;
	endcase
end

always@(*)begin
	case(instru[3:0])
		4'd1: HEX4 = 7'b1111001;
        4'd2: HEX4 = 7'b0100100;
        4'd3: HEX4 = 7'b0110000;
        4'd4: HEX4 = 7'b0011001;
        4'd5: HEX4 = 7'b0010010;
        4'd6: HEX4 = 7'b0000010;
        4'd7: HEX4 = 7'b1011000;
        4'd8: HEX4 = 7'b0000000;
        4'd9: HEX4 = 7'b0011000;
        4'd10: HEX4 = 7'b0001000;
        4'd11: HEX4 = 7'b0000011;
        4'd12: HEX4 = 7'b1000110;
        4'd13: HEX4 = 7'b0100001;
        4'd14: HEX4 = 7'b0000110;
        4'd15: HEX4 = 7'b0001110;
        default: HEX4 = 7'b1000000;
	endcase
end

always@(*)begin
	case(instru[7:4])
		4'd1: HEX5 = 7'b1111001;
        4'd2: HEX5 = 7'b0100100;
        4'd3: HEX5 = 7'b0110000;
        4'd4: HEX5 = 7'b0011001;
        4'd5: HEX5 = 7'b0010010;
        4'd6: HEX5 = 7'b0000010;
        4'd7: HEX5 = 7'b1011000;
        4'd8: HEX5 = 7'b0000000;
        4'd9: HEX5 = 7'b0011000;
        4'd10: HEX5 = 7'b0001000;
        4'd11: HEX5 = 7'b0000011;
        4'd12: HEX5 = 7'b1000110;
        4'd13: HEX5 = 7'b0100001;
        4'd14: HEX5 = 7'b0000110;
        4'd15: HEX5 = 7'b0001110;
        default: HEX5 = 7'b1000000;
	endcase
	
end


endmodule