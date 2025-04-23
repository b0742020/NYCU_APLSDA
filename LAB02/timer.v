/*Original code by <HONG-MING-WU>*/
module clock(CLOCK_50,SW,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
input CLOCK_50;
input [9:0]SW;
output reg [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5;

//reg declare
reg[26:0]sys_cnt; //use to count 1 second
reg[5:0]sec_cnt; //use to count real second
reg[7:0]min_cnt;//use to count minute
reg[7:0]hr_cnt;//use to count hour
reg SW8_ff;
//wire declare
wire SW8_n;

//delay one cycle
always@(posedge CLOCK_50)begin
	SW8_ff <= SW[8];
end

//
always@(posedge CLOCK_50 )begin
	if ((SW[9]==1'b1)&&(SW8_ff==1'b0)&&(SW[8]==1'b1))begin
			hr_cnt <= SW[7:0];
		end
	else if ((SW[9]==1'b0)&&(SW8_ff==1'b0)&&(SW[8]==1'b1))begin
			min_cnt <= SW[7:0];
		end
	//when sys_cnt reaches 50000000, it means 1 second has passed
	else if(sys_cnt < 50000000)begin
		sys_cnt <= sys_cnt+26'b1;
		end

	else begin
		sys_cnt <= 0;
		if ((sec_cnt == 6'd59)&&(min_cnt == 6'd59)&&(hr_cnt == 6'd23))begin
			sec_cnt <= 0;
			min_cnt <= 0;
			hr_cnt <= 0;
		end
		else if ((sec_cnt == 6'd59)&&(min_cnt == 6'd59))begin
			sec_cnt <= 0;
			min_cnt <= 0;
			hr_cnt <= hr_cnt+1;
		end
		else if ((sec_cnt == 6'd59))begin
			sec_cnt <= 0;
			min_cnt <= min_cnt+1;
		end
		else begin
			sec_cnt <= sec_cnt+1;
		end
	end
end


/*The reason why I didn't use this part
,Because I didn't solve the problem of pull down set_valid signal.*/

/*always@(posedge SW[8])begin
	if (SW[9]==1'b1)begin
		set_hr <= SW[7:0];
		set_valid <= 1'b1;
	end
	else if (SW[9]==1'b0)begin
		set_min <= SW[7:0];
		set_valid <= 1'b1;
	end
end*/

//sec display
always@(*)begin
	if(sec_cnt == 6'b000001)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b1111001;
	end
	else if(sec_cnt == 6'b000010)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0100100;

	end
	else if(sec_cnt == 6'b000011)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0110000;

	end
	else if(sec_cnt == 6'b000100)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0011001;

	end
	else if(sec_cnt == 6'b000101)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0010010;

	end
	else if(sec_cnt == 6'b000110)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0000011;

	end
	else if(sec_cnt == 6'b000111)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b1011000;

	end
	else if(sec_cnt == 6'b001000)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0000000;

	end
	else if(sec_cnt == 6'b001001)begin
		HEX1 =7'b1000000;
		HEX0 = 7'b0011000;

	end
	else if (sec_cnt ==6'd10)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b1000000;
		
	end
	else if (sec_cnt ==6'd11)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b1111001;		
	end
	else if (sec_cnt ==6'd12)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0100100;

	end
	else if (sec_cnt ==6'd13)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0110000;

	end
	else if (sec_cnt ==6'd14)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0011001;

	end
	else if (sec_cnt ==6'd15)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0010010;

	end
	else if (sec_cnt ==6'd16)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0000011;

	end
	else if (sec_cnt ==6'd17)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b1011000;

	end
	else if (sec_cnt ==6'd18)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0000000;
	end
	else if (sec_cnt ==6'd19)begin
		HEX1 = 7'b1111001;
		HEX0 = 7'b0011000;
	end
	else if (sec_cnt ==6'd20)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b1000000;
	end
	else if (sec_cnt ==6'd21)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b1111001;
	end
	else if (sec_cnt ==6'd22)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0100100;
	end
	else if (sec_cnt ==6'd23)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0110000;
	end
	else if (sec_cnt ==6'd24)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0011001;
	end
	else if (sec_cnt ==6'd25)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0010010;
	end
	else if (sec_cnt ==6'd26)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0000011;
	end
	else if (sec_cnt ==6'd27)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b1011000;
	
	end
	else if (sec_cnt ==6'd28)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0000000;
	end
	else if (sec_cnt ==6'd29)begin
		HEX1 = 7'b0100100;
		HEX0 = 7'b0011000;
	end
	else if (sec_cnt ==6'd30)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b1000000;

	end
	else if (sec_cnt ==6'd31)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b1111001;

	end
	else if (sec_cnt ==6'd32)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0100100;
	
	end
	else if (sec_cnt ==6'd33)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0110000;

	end
	else if (sec_cnt ==6'd34)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0011001;
	
	end
	else if (sec_cnt ==6'd35)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0010010;
	
	end
	else if (sec_cnt ==6'd36)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0000011;
	
	end
	else if (sec_cnt ==6'd37)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b1011000;
	
	end
	else if (sec_cnt ==6'd38)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0000000;
	
	end
	else if (sec_cnt ==6'd39)begin
		HEX1 = 7'b0110000;
		HEX0 = 7'b0011000;
	
	end
	else if (sec_cnt ==6'd40)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b1000000;

	end
	else if (sec_cnt ==6'd41)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b1111001;
	
	end
	else if (sec_cnt ==6'd42)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0100100;
	
	end
	else if (sec_cnt ==6'd43)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0110000;
	
	end
	else if (sec_cnt ==6'd44)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0011001;
	
	end
	else if (sec_cnt ==6'd45)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0010010;
	
	end
	else if (sec_cnt ==6'd46)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0000011;
	
	end
	else if (sec_cnt ==6'd47)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b1011000;
	
	end
	else if (sec_cnt ==6'd48)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0000000;
	
	end
	else if (sec_cnt ==6'd49)begin
		HEX1 = 7'b0011001;
		HEX0 = 7'b0011000;
	
	end
	else if (sec_cnt ==6'd50)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b1000000;

	end
	else if (sec_cnt ==6'd51)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b1111001;
	
	end
	else if (sec_cnt ==6'd52)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0100100;
	
	end
	else if (sec_cnt ==6'd53)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0110000;
	
	end
	else if (sec_cnt ==6'd54)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0011001;
	
	end
	else if (sec_cnt ==6'd55)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0010010;
	
	end
	else if (sec_cnt ==6'd56)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0000011;
	
	end
	else if (sec_cnt ==6'd57)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b1011000;
	
	end
	else if (sec_cnt ==6'd58)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0000000;
	
	end
	else if (sec_cnt ==6'd59)begin
		HEX1 = 7'b0010010;
		HEX0 = 7'b0011000;

	end
	else begin
		HEX1 = 7'b1000000;
		HEX0 = 7'b1000000;
	end
end

//min display
always@(*)begin
	if(min_cnt == 6'b000001)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b1111001;
	end
	else if(min_cnt == 6'b000010)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0100100;

	end
	else if(min_cnt == 6'b000011)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0110000;

	end
	else if(min_cnt == 6'b000100)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0011001;

	end
	else if(min_cnt == 6'b000101)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0010010;

	end
	else if(min_cnt == 6'b000110)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0000011;

	end
	else if(min_cnt == 6'b000111)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b1011000;

	end
	else if(min_cnt == 6'b001000)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0000000;

	end
	else if(min_cnt == 6'b001001)begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b0011000;

	end
	else if (min_cnt ==6'd10)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b1000000;
		
	end
	else if (min_cnt ==6'd11)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b1111001;		
	end
	else if (min_cnt ==6'd12)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0100100;

	end
	else if (min_cnt ==6'd13)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0110000;

	end
	else if (min_cnt ==6'd14)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0011001;

	end
	else if (min_cnt ==6'd15)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0010010;

	end
	else if (min_cnt ==6'd16)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0000011;

	end
	else if (min_cnt ==6'd17)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b1011000;

	end
	else if (min_cnt ==6'd18)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0000000;
	end
	else if (min_cnt ==6'd19)begin
		HEX3 = 7'b1111001;
		HEX2 = 7'b0011000;
	end
	else if (min_cnt ==6'd20)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b1000000;
	end
	else if (min_cnt ==6'd21)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b1111001;
	end
	else if (min_cnt ==6'd22)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0100100;
	end
	else if (min_cnt ==6'd23)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0110000;
	end
	else if (min_cnt ==6'd24)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0011001;
	end
	else if (min_cnt ==6'd25)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0010010;
	end
	else if (min_cnt ==6'd26)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0000011;
	end
	else if (min_cnt ==6'd27)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b1011000;
	
	end
	else if (min_cnt ==6'd28)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0000000;
	end
	else if (min_cnt ==6'd29)begin
		HEX3 = 7'b0100100;
		HEX2 = 7'b0011000;
	end
	else if (min_cnt ==6'd30)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b1000000;

	end
	else if (min_cnt ==6'd31)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b1111001;

	end
	else if (min_cnt ==6'd32)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0100100;
	
	end
	else if (min_cnt ==6'd33)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0110000;

	end
	else if (min_cnt ==6'd34)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0011001;
	
	end
	else if (min_cnt ==6'd35)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0010010;
	
	end
	else if (min_cnt ==6'd36)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0000011;
	
	end
	else if (min_cnt ==6'd37)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b1011000;
	
	end
	else if (min_cnt ==6'd38)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0000000;
	
	end
	else if (min_cnt ==6'd39)begin
		HEX3 = 7'b0110000;
		HEX2 = 7'b0011000;
	
	end
	else if (min_cnt ==6'd40)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b1000000;

	end
	else if (min_cnt ==6'd41)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b1111001;
	
	end
	else if (min_cnt ==6'd42)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0100100;
	
	end
	else if (min_cnt ==6'd43)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0110000;
	
	end
	else if (min_cnt ==6'd44)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0011001;
	
	end
	else if (min_cnt ==6'd45)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0010010;
	
	end
	else if (min_cnt ==6'd46)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0000011;
	
	end
	else if (min_cnt ==6'd47)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b1011000;
	
	end
	else if (min_cnt ==6'd48)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0000000;
	
	end
	else if (min_cnt ==6'd49)begin
		HEX3 = 7'b0011001;
		HEX2 = 7'b0011000;
	
	end
	else if (min_cnt ==6'd50)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b1000000;

	end
	else if (min_cnt ==6'd51)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b1111001;
	
	end
	else if (min_cnt ==6'd52)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0100100;
	
	end
	else if (min_cnt ==6'd53)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0110000;
	
	end
	else if (min_cnt ==6'd54)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0011001;
	
	end
	else if (min_cnt ==6'd55)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0010010;
	
	end
	else if (min_cnt ==6'd56)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0000011;
	
	end
	else if (min_cnt ==6'd57)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b1011000;
	
	end
	else if (min_cnt ==6'd58)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0000000;
	
	end
	else if (min_cnt ==6'd59)begin
		HEX3 = 7'b0010010;
		HEX2 = 7'b0011000;

	end
	else if ((min_cnt ==6'd59)&&(sec_cnt==7'd59))begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b1000000;

	end
	else begin
		HEX3 = 7'b1000000;
		HEX2 = 7'b1000000;
	end
end

//hour diplay
always@(*)begin
	if(hr_cnt == 6'b000001)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b1111001;
	end
	else if(hr_cnt == 6'b000010)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0100100;

	end
	else if(hr_cnt == 6'b000011)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0110000;

	end
	else if(hr_cnt == 6'b000100)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0011001;

	end
	else if(hr_cnt == 6'b000101)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0010010;

	end
	else if(hr_cnt == 6'b000110)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0000011;

	end
	else if(hr_cnt == 6'b000111)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b1011000;

	end
	else if(hr_cnt == 6'b001000)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0000000;

	end
	else if(hr_cnt == 6'b001001)begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b0011000;

	end
	else if (hr_cnt ==6'd10)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b1000000;
		
	end
	else if (hr_cnt ==6'd11)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b1111001;		
	end
	else if (hr_cnt ==6'd12)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0100100;

	end
	else if (hr_cnt ==6'd13)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0110000;

	end
	else if (hr_cnt ==6'd14)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0011001;

	end
	else if (hr_cnt ==6'd15)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0010010;

	end
	else if (hr_cnt ==6'd16)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0000011;

	end
	else if (hr_cnt ==6'd17)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b1011000;

	end
	else if (hr_cnt ==6'd18)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0000000;
	end
	else if (hr_cnt ==6'd19)begin
		HEX5 = 7'b1111001;
		HEX4 = 7'b0011000;
	end
	else if (hr_cnt ==6'd20)begin
		HEX5 = 7'b0100100;
		HEX4 = 7'b1000000;
	end
	else if (hr_cnt ==6'd21)begin
		HEX5 = 7'b0100100;
		HEX4 = 7'b1111001;
	end
	else if (hr_cnt ==6'd22)begin
		HEX5 = 7'b0100100;
		HEX4 = 7'b0100100;
	end
	else if (hr_cnt ==6'd23)begin
		HEX5 = 7'b0100100;
		HEX4 = 7'b0110000;
	end
	else if ((hr_cnt ==6'd23)&&(min_cnt==7'd59))begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b1000000;
	end
	else begin
		HEX5 = 7'b1000000;
		HEX4 = 7'b1000000;
	end
end
endmodule