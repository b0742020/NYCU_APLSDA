module FSM(SW,KEY,HEX0);
	input [3:0]KEY;
	input [2:0]SW;
	output reg [6:0]HEX0;

	reg [3:0] result_ff,result;
	reg [1:0] input_ff;
	
	
	always@(negedge KEY[0] or negedge SW[0]) begin
		if(!SW[0]) begin
			result_ff <= 4'b0000;
		end
		else begin
			if(SW[2:1] == 2'b00) begin
				result_ff <= result_ff;
			end
			else if(SW[2:1] == 2'b01) begin
				if(result_ff < 9)begin
					result_ff <= result_ff + 1;
				end
				else begin
					result_ff <= 4'b0000;
				end
			end
			else if(SW[2:1] == 2'b10) begin
				if(result_ff == 8 )begin
					result_ff <= 4'b0000;
				end
				else if(result_ff == 9) begin
					result_ff <= 4'b0001;
				end
				else begin
				result_ff <= result_ff + 2;
				end
			end
			else if(SW[2:1] == 2'b11) begin
				if(result_ff == 0)begin
					result_ff <= 4'd9;
				end
				else begin
					result_ff <= result_ff - 1;
				end
			end
		end
	end
	
	
	always@(*)begin
		result = result_ff;
		case(result)
			4'b0000: HEX0 = 7'b1000000;
			4'b0001: HEX0 = 7'b1111001;
			4'b0010: HEX0 = 7'b0100100;
			4'b0011: HEX0 = 7'b0110000;
			4'b0100: HEX0 = 7'b0011001;
			4'b0101: HEX0 = 7'b0010010;
			4'b0110: HEX0 = 7'b0000011;
			4'b0111: HEX0 = 7'b1011000;
			4'b1000: HEX0 = 7'b0000000;
			4'b1001: HEX0 = 7'b0011000;
			4'b1010: HEX0 = 7'b0001000;
			4'b1011: HEX0 = 7'b0000011;
			4'b1100: HEX0 = 7'b1000110;
			4'b1101: HEX0 = 7'b0100001;
			4'b1110: HEX0 = 7'b0000110;
			4'b1111: HEX0 = 7'b0001110;
			default: HEX0 = 7'b1000000;
		endcase
	end
	
	
	
	endmodule