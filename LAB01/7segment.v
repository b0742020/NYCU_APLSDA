module ex1(SW,HEX0);
input [3:0]SW;
output reg[6:0]HEX0;

//0是亮

always@(*)begin
	if (SW==4'b0000)begin
		HEX0 = 7'b1000000;
	end
	
	else if (SW==4'b0001)begin
		HEX0 = 7'b1111001;
	end
	
	else if (SW==4'b0010)begin
		HEX0 = 7'b0100100;
	end
	
	else if (SW==4'b0011)begin
		HEX0 = 7'b0110000;
	end
	
	else if (SW==4'b0100)begin
		HEX0 = 7'b0011001;
	end
	
	else if (SW==4'b0101)begin
		HEX0 = 7'b0010010;
	end
	
	else if (SW==4'b0110)begin
		HEX0 = 7'b0000011;
	end
	
	else if (SW==4'b0111)begin
		HEX0 = 7'b1011000;
	end
	
	else if (SW==4'b1000)begin
		HEX0 = 7'b0000000;
	end
	
	else if (SW==4'b1001)begin
		HEX0 = 7'b0011000;
	end

	else begin
		HEX0 = 7'bxxxxxxx;
	end
end

endmodule
