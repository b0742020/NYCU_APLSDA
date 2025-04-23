module multiplexer(KEY,SW,HEX0,HEX1,HEX2,HEX3,LEDR);
input [3:0]KEY;
input [9:0]SW;
output reg  [6:0]HEX0,HEX1,HEX2,HEX3;
output reg  [9:0]LEDR;

reg [7:0] A_ff,B_ff,C_ff,D_ff;
reg [15:0] cal_ab,cal_cd;
reg [15:0] cal_ab_ff,cal_cd_ff;
reg [15:0]result,result_ff;
reg [3:0]A_ff_q,B_ff_q,C_ff_q,D_ff_q;
reg [3:0]A_ff_r,B_ff_r,C_ff_r,D_ff_r;
reg [15:0]result_q_0,result_q_1,result_q_2,result_q_3;
reg [15:0]result_r_0,result_r_1,result_r_2,result_r_3;
reg cout;


always @(negedge KEY[1] or negedge KEY[0]) begin
    if(!KEY[0])begin
        A_ff <= 0;        
        B_ff <= 0;        
        C_ff <= 0;        
        D_ff <= 0;                       
    end
    else begin
        if(SW[9]==1)begin
            if((KEY[2]==1)&&(SW[8]==0))begin
                // A_ff <= SW[7:0];
                A_ff <= SW[7:0];
            end
            else if((KEY[2]==0)&&(SW[8]==0))begin
                // B_ff <= SW[7:0];
                B_ff <= SW[7:0];
                
            end
            else if((KEY[2]==1)&&(SW[8]==1))begin
                // C_ff <= SW[7:0];
                C_ff <= SW[7:0];
                
            end
            else if((KEY[2]==0)&&(SW[8]==1))begin
                // D_ff <= SW[7:0];
                D_ff <= SW[7:0];
                
            end
        end
        else begin
            A_ff <= A_ff;        
            B_ff <= B_ff;        
            C_ff <= C_ff;        
            D_ff <= D_ff;
        end
    end
end


always @(negedge KEY[1] or negedge KEY[0]) begin
    if(!KEY[0])begin
        cal_ab_ff <= 0;
        cal_cd_ff <= 0;
        result_ff <= 0;
    end
    else begin
        cal_ab_ff <= cal_ab;
        cal_cd_ff <= cal_cd;
        result_ff <= result;
    end
end


always@(*)begin
    cal_ab = A_ff * B_ff;
    cal_cd = C_ff * D_ff;
    // {cout,result} = cal_ab_ff + cal_cd_ff;
    {cout,result} = cal_ab + cal_cd;
end


always@(*)begin
	LEDR[9] = (cout)? 1'b1 : 1'b0;
end


always@(*)begin
	A_ff_q = A_ff/16;
	B_ff_q = B_ff/16;
	C_ff_q = C_ff/16;
	D_ff_q = D_ff/16;

	A_ff_r = A_ff%16;
	B_ff_r = B_ff%16;
	C_ff_r = C_ff%16;
	D_ff_r = D_ff%16;


	result_q_0 = result/16;
	result_r_0 = result%16;
	result_q_1 = result_q_0/16;
	result_r_1 = result_q_0%16;
	result_q_2 = result_q_1/16;
	result_r_2 = result_q_1%16;
	result_q_3 = result_q_2/16;
	result_r_3 = result_q_2%16;

end

always@(*)begin
	if(KEY[3]==1)begin
		if(SW[8]==0)begin
			if((A_ff_q ==8'd1))begin
				HEX3 = 7'b1111001;
			end
			else if(A_ff_q ==8'd2)begin
				HEX3 = 7'b0100100;
			end
			else if(A_ff_q ==8'd3)begin
				HEX3 = 7'b0110000;
			end
			else if(A_ff_q ==8'd4)begin
				HEX3 = 7'b0011001;
			end
			else if(A_ff_q ==8'd5)begin
				HEX3 = 7'b0010010;
			end
			else if(A_ff_q ==8'd6)begin
				HEX3 = 7'b0000011;
			end
			else if(A_ff_q ==8'd7)begin
				HEX3 = 7'b1011000;
			end
			else if(A_ff_q ==8'd8)begin
				HEX3 = 7'b0000000;
			end
			else if(A_ff_q ==8'd9)begin
				HEX3 = 7'b0011000;
			end
			else if(A_ff_q ==8'd10)begin
				HEX3 = 7'b0001000;
			end
			else if(A_ff_q ==8'd11)begin
				HEX3 = 7'b0000011;
			end
			else if(A_ff_q ==8'd12)begin
				HEX3 = 7'b1000110;
			end
			else if(A_ff_q ==8'd13)begin
				HEX3 = 7'b0100001;
			end
			else if(A_ff_q ==8'd14)begin
				HEX3 = 7'b0000110;
			end
			else if(A_ff_q ==8'd15)begin
				HEX3 = 7'b0001110;
			end
			else begin
				HEX3 = 7'b1000000;
			end
		end
		else begin
			if((C_ff_q ==8'd1))begin
				HEX3 = 7'b1111001;
			end
			else if(C_ff_q ==8'd2)begin
				HEX3 = 7'b0100100;
			end
			else if(C_ff_q ==8'd3)begin
				HEX3 = 7'b0110000;
			end
			else if(C_ff_q ==8'd4)begin
				HEX3 = 7'b0011001;
			end
			else if(C_ff_q ==8'd5)begin
				HEX3 = 7'b0010010;
			end
			else if(C_ff_q ==8'd6)begin
				HEX3 = 7'b0000011;
			end
			else if(C_ff_q ==8'd7)begin
				HEX3 = 7'b1011000;
			end
			else if(C_ff_q ==8'd8)begin
				HEX3 = 7'b0000000;
			end
			else if(C_ff_q ==8'd9)begin
				HEX3 = 7'b0011000;
			end
			else if(C_ff_q ==8'd10)begin
				HEX3 = 7'b0001000;
			end
			else if(C_ff_q ==8'd11)begin
				HEX3 = 7'b0000011;
			end
			else if(C_ff_q ==8'd12)begin
				HEX3 = 7'b1000110;
			end
			else if(C_ff_q ==8'd13)begin
				HEX3 = 7'b0100001;
			end
			else if(C_ff_q ==8'd14)begin
				HEX3 = 7'b0000110;
			end
			else if(C_ff_q ==8'd15)begin
				HEX3 = 7'b0001110;
			end
			else begin
				HEX3 = 7'b1000000;
			end
		end
	end
	else if(KEY[3]==0)begin
		if((result_r_3 ==8'd1))begin
			HEX3 = 7'b1111001;
		end
		else if(result_r_3 ==8'd2)begin
			HEX3 = 7'b0100100;
		end
		else if(result_r_3 ==8'd3)begin
			HEX3 = 7'b0110000;
		end
		else if(result_r_3 ==8'd4)begin
			HEX3 = 7'b0011001;
		end
		else if(result_r_3 ==8'd5)begin
			HEX3 = 7'b0010010;
		end
		else if(result_r_3 ==8'd6)begin
			HEX3 = 7'b0000011;
		end
		else if(result_r_3 ==8'd7)begin
			HEX3 = 7'b1011000;
		end
		else if(result_r_3 ==8'd8)begin
			HEX3 = 7'b0000000;
		end
		else if(result_r_3 ==8'd9)begin
			HEX3 = 7'b0011000;
		end
		else if(result_r_3 ==8'd10)begin
			HEX3 = 7'b0001000;
		end
		else if(result_r_3 ==8'd11)begin
			HEX3 = 7'b0000011;
		end
		else if(result_r_3 ==8'd12)begin
			HEX3 = 7'b1000110;
		end
		else if(result_r_3 ==8'd13)begin
			HEX3 = 7'b0100001;
		end
		else if(result_r_3 ==8'd14)begin
			HEX3 = 7'b0000110;
		end
		else if(result_r_3 ==8'd15)begin
			HEX3 = 7'b0001110;
		end
		else begin
			HEX3 = 7'b1000000;
		end
	end
	else begin
		HEX3= 7'b1000000;
	end
end


always@(*)begin
	if(KEY[3]==1)begin
		if(SW[8]==0)begin
			if((B_ff_q ==8'd1))begin
				HEX1 = 7'b1111001;
			end
			else if(B_ff_q ==8'd2)begin
				HEX1 = 7'b0100100;
			end
			else if(B_ff_q ==8'd3)begin
				HEX1 = 7'b0110000;
			end
			else if(B_ff_q ==8'd4)begin
				HEX1 = 7'b0011001;
			end
			else if(B_ff_q ==8'd5)begin
				HEX1 = 7'b0010010;
			end
			else if(B_ff_q ==8'd6)begin
				HEX1 = 7'b0000011;
			end
			else if(B_ff_q ==8'd7)begin
				HEX1 = 7'b1011000;
			end
			else if(B_ff_q ==8'd8)begin
				HEX1 = 7'b0000000;
			end
			else if(B_ff_q ==8'd9)begin
				HEX1 = 7'b0011000;
			end
			else if(B_ff_q ==8'd10)begin
				HEX1 = 7'b0001000;
			end
			else if(B_ff_q ==8'd11)begin
				HEX1 = 7'b0000011;
			end
			else if(B_ff_q ==8'd12)begin
				HEX1 = 7'b1000110;
			end
			else if(B_ff_q ==8'd13)begin
				HEX1 = 7'b0100001;
			end
			else if(B_ff_q ==8'd14)begin
				HEX1 = 7'b0000110;
			end
			else if(B_ff_q ==8'd15)begin
				HEX1 = 7'b0001110;
			end
			else begin
				HEX1 = 7'b1000000;
			end
		end
		else begin
			if((D_ff_q ==8'd1))begin
				HEX1 = 7'b1111001;
			end
			else if(D_ff_q ==8'd2)begin
				HEX1 = 7'b0100100;
			end
			else if(D_ff_q ==8'd3)begin
				HEX1 = 7'b0110000;
			end
			else if(D_ff_q ==8'd4)begin
				HEX1 = 7'b0011001;
			end
			else if(D_ff_q ==8'd5)begin
				HEX1 = 7'b0010010;
			end
			else if(D_ff_q ==8'd6)begin
				HEX1 = 7'b0000011;
			end
			else if(D_ff_q ==8'd7)begin
				HEX1 = 7'b1011000;
			end
			else if(D_ff_q ==8'd8)begin
				HEX1 = 7'b0000000;
			end
			else if(D_ff_q ==8'd9)begin
				HEX1 = 7'b0011000;
			end
			else if(D_ff_q ==8'd10)begin
				HEX1 = 7'b0001000;
			end
			else if(D_ff_q ==8'd11)begin
				HEX1 = 7'b0000011;
			end
			else if(D_ff_q ==8'd12)begin
				HEX1 = 7'b1000110;
			end
			else if(D_ff_q ==8'd13)begin
				HEX1 = 7'b0100001;
			end
			else if(D_ff_q ==8'd14)begin
				HEX1 = 7'b0000110;
			end
			else if(D_ff_q ==8'd15)begin
				HEX1 = 7'b0001110;
			end
			else begin
				HEX1 = 7'b1000000;
			end
		end
	end
	else if(KEY[3]==0)begin
		if((result_r_1 ==8'd1))begin
			HEX1 = 7'b1111001;
		end
		else if(result_r_1 ==8'd2)begin
			HEX1 = 7'b0100100;
		end
		else if(result_r_1 ==8'd3)begin
			HEX1 = 7'b0110000;
		end
		else if(result_r_1 ==8'd4)begin
			HEX1 = 7'b0011001;
		end
		else if(result_r_1 ==8'd5)begin
			HEX1 = 7'b0010010;
		end
		else if(result_r_1 ==8'd6)begin
			HEX1 = 7'b0000011;
		end
		else if(result_r_1 ==8'd7)begin
			HEX1 = 7'b1011000;
		end
		else if(result_r_1 ==8'd8)begin
			HEX1 = 7'b0000000;
		end
		else if(result_r_1 ==8'd9)begin
			HEX1 = 7'b0011000;
		end
		else if(result_r_1 ==8'd10)begin
			HEX1 = 7'b0001000;
		end
		else if(result_r_1 ==8'd11)begin
			HEX1 = 7'b0000011;
		end
		else if(result_r_1 ==8'd12)begin
			HEX1 = 7'b1000110;
		end
		else if(result_r_1 ==8'd13)begin
			HEX1 = 7'b0100001;
		end
		else if(result_r_1 ==8'd14)begin
			HEX1 = 7'b0000110;
		end
		else if(result_r_1 ==8'd15)begin
			HEX1 = 7'b0001110;
		end
		else begin
			HEX1 = 7'b1000000;
		end
	end
	else begin
		HEX1= 7'b1000000;
	end
end


always@(*)begin
	if(KEY[3]==1)begin
		if(SW[8]==0)begin
			if((A_ff_r ==8'd1))begin
				HEX2 = 7'b1111001;
			end
			else if(A_ff_r ==8'd2)begin
				HEX2 = 7'b0100100;
			end
			else if(A_ff_r ==8'd3)begin
				HEX2 = 7'b0110000;
			end
			else if(A_ff_r ==8'd4)begin
				HEX2 = 7'b0011001;
			end
			else if(A_ff_r ==8'd5)begin
				HEX2 = 7'b0010010;
			end
			else if(A_ff_r ==8'd6)begin
				HEX2 = 7'b0000011;
			end
			else if(A_ff_r ==8'd7)begin
				HEX2 = 7'b1011000;
			end
			else if(A_ff_r ==8'd8)begin
				HEX2 = 7'b0000000;
			end
			else if(A_ff_r ==8'd9)begin
				HEX2 = 7'b0011000;
			end
			else if(A_ff_r ==8'd10)begin
				HEX2 = 7'b0001000;
			end
			else if(A_ff_r ==8'd11)begin
				HEX2 = 7'b0000011;
			end
			else if(A_ff_r ==8'd12)begin
				HEX2 = 7'b1000110;
			end
			else if(A_ff_r ==8'd13)begin
				HEX2 = 7'b0100001;
			end
			else if(A_ff_r ==8'd14)begin
				HEX2 = 7'b0000110;
			end
			else if(A_ff_r ==8'd15)begin
				HEX2 = 7'b0001110;
			end
			else begin
				HEX2 = 7'b1000000;
			end
		end
		else begin
			if((C_ff_r ==8'd1))begin
				HEX2 = 7'b1111001;
			end
			else if(C_ff_r ==8'd2)begin
				HEX2 = 7'b0100100;
			end
			else if(C_ff_r ==8'd3)begin
				HEX2 = 7'b0110000;
			end
			else if(C_ff_r ==8'd4)begin
				HEX2 = 7'b0011001;
			end
			else if(C_ff_r ==8'd5)begin
				HEX2 = 7'b0010010;
			end
			else if(C_ff_r ==8'd6)begin
				HEX2 = 7'b0000011;
			end
			else if(C_ff_r ==8'd7)begin
				HEX2 = 7'b1011000;
			end
			else if(C_ff_r ==8'd8)begin
				HEX2 = 7'b0000000;
			end
			else if(C_ff_r ==8'd9)begin
				HEX2 = 7'b0011000;
			end
			else if(C_ff_r ==8'd10)begin
				HEX2 = 7'b0001000;
			end
			else if(C_ff_r ==8'd11)begin
				HEX2 = 7'b0000011;
			end
			else if(C_ff_r ==8'd12)begin
				HEX2 = 7'b1000110;
			end
			else if(C_ff_r ==8'd13)begin
				HEX2 = 7'b0100001;
			end
			else if(C_ff_r ==8'd14)begin
				HEX2 = 7'b0000110;
			end
			else if(C_ff_r ==8'd15)begin
				HEX2 = 7'b0001110;
			end
			else begin
				HEX2 = 7'b1000000;
			end
		end
	end
	else if(KEY[3]==0)begin
		if((result_r_2 ==8'd1))begin
			HEX2 = 7'b1111001;
		end
		else if(result_r_2 ==8'd2)begin
			HEX2 = 7'b0100100;
		end
		else if(result_r_2 ==8'd3)begin
			HEX2 = 7'b0110000;
		end
		else if(result_r_2 ==8'd4)begin
			HEX2 = 7'b0011001;
		end
		else if(result_r_2 ==8'd5)begin
			HEX2 = 7'b0010010;
		end
		else if(result_r_2 ==8'd6)begin
			HEX2 = 7'b0000011;
		end
		else if(result_r_2 ==8'd7)begin
			HEX2 = 7'b1011000;
		end
		else if(result_r_2 ==8'd8)begin
			HEX2 = 7'b0000000;
		end
		else if(result_r_2 ==8'd9)begin
			HEX2 = 7'b0011000;
		end
		else if(result_r_2 ==8'd10)begin
			HEX2 = 7'b0001000;
		end
		else if(result_r_2 ==8'd11)begin
			HEX2 = 7'b0000011;
		end
		else if(result_r_2 ==8'd12)begin
			HEX2 = 7'b1000110;
		end
		else if(result_r_2 ==8'd13)begin
			HEX2 = 7'b0100001;
		end
		else if(result_r_2 ==8'd14)begin
			HEX2 = 7'b0000110;
		end
		else if(result_r_2 ==8'd15)begin
			HEX2 = 7'b0001110;
		end
		else begin
			HEX2 = 7'b1000000;
		end
	end
	else begin
		HEX2 = 7'b1000000;
	end
end


always@(*)begin
	if(KEY[3]==1)begin
		if(SW[8]==0)begin
			if((B_ff_r ==8'd1))begin
				HEX0 = 7'b1111001;
			end
			else if(B_ff_r ==8'd2)begin
				HEX0 = 7'b0100100;
			end
			else if(B_ff_r ==8'd3)begin
				HEX0 = 7'b0110000;
			end
			else if(B_ff_r ==8'd4)begin
				HEX0 = 7'b0011001;
			end
			else if(B_ff_r ==8'd5)begin
				HEX0 = 7'b0010010;
			end
			else if(B_ff_r ==8'd6)begin
				HEX0 = 7'b0000011;
			end
			else if(B_ff_r ==8'd7)begin
				HEX0 = 7'b1011000;
			end
			else if(B_ff_r ==8'd8)begin
				HEX0 = 7'b0000000;
			end
			else if(B_ff_r ==8'd9)begin
				HEX0 = 7'b0011000;
			end
			else if(B_ff_r ==8'd10)begin
				HEX0 = 7'b0001000;
			end
			else if(B_ff_r ==8'd11)begin
				HEX0 = 7'b0000011;
			end
			else if(B_ff_r ==8'd12)begin
				HEX0 = 7'b1000110;
			end
			else if(B_ff_r ==8'd13)begin
				HEX0 = 7'b0100001;
			end
			else if(B_ff_r ==8'd14)begin
				HEX0 = 7'b0000110;
			end
			else if(B_ff_r ==8'd15)begin
				HEX0 = 7'b0001110;
			end
			else begin
				HEX0 = 7'b1000000;
			end
		end
		else begin
			if((D_ff_r ==8'd1))begin
				HEX0 = 7'b1111001;
			end
			else if(D_ff_r ==8'd2)begin
				HEX0 = 7'b0100100;
			end
			else if(D_ff_r ==8'd3)begin
				HEX0 = 7'b0110000;
			end
			else if(D_ff_r ==8'd4)begin
				HEX0 = 7'b0011001;
			end
			else if(D_ff_r ==8'd5)begin
				HEX0 = 7'b0010010;
			end
			else if(D_ff_r ==8'd6)begin
				HEX0 = 7'b0000011;
			end
			else if(D_ff_r ==8'd7)begin
				HEX0 = 7'b1011000;
			end
			else if(D_ff_r ==8'd8)begin
				HEX0 = 7'b0000000;
			end
			else if(D_ff_r ==8'd9)begin
				HEX0 = 7'b0011000;
			end
			else if(D_ff_r ==8'd10)begin
				HEX0 = 7'b0001000;
			end
			else if(D_ff_r ==8'd11)begin
				HEX0 = 7'b0000011;
			end
			else if(D_ff_r ==8'd12)begin
				HEX0 = 7'b1000110;
			end
			else if(D_ff_r ==8'd13)begin
				HEX0 = 7'b0100001;
			end
			else if(D_ff_r ==8'd14)begin
				HEX0 = 7'b0000110;
			end
			else if(D_ff_r ==8'd15)begin
				HEX0 = 7'b0001110;
			end
			else begin
				HEX0 = 7'b1000000;
			end
		end
	end
	else if(KEY[3]==0)begin
		if((result_r_0 ==8'd1))begin
			HEX0 = 7'b1111001;
		end
		else if(result_r_0 ==8'd2)begin
			HEX0 = 7'b0100100;
		end
		else if(result_r_0 ==8'd3)begin
			HEX0 = 7'b0110000;
		end
		else if(result_r_0 ==8'd4)begin
			HEX0 = 7'b0011001;
		end
		else if(result_r_0 ==8'd5)begin
			HEX0 = 7'b0010010;
		end
		else if(result_r_0 ==8'd6)begin
			HEX0 = 7'b0000011;
		end
		else if(result_r_0 ==8'd7)begin
			HEX0 = 7'b1011000;
		end
		else if(result_r_0 ==8'd8)begin
			HEX0 = 7'b0000000;
		end
		else if(result_r_0 ==8'd9)begin
			HEX0 = 7'b0011000;
		end
		else if(result_r_0 ==8'd10)begin
			HEX0 = 7'b0001000;
		end
		else if(result_r_0 ==8'd11)begin
			HEX0 = 7'b0000011;
		end
		else if(result_r_0 ==8'd12)begin
			HEX0 = 7'b1000110;
		end
		else if(result_r_0 ==8'd13)begin
			HEX0 = 7'b0100001;
		end
		else if(result_r_0 ==8'd14)begin
			HEX0 = 7'b0000110;
		end
		else if(result_r_0 ==8'd15)begin
			HEX0 = 7'b0001110;
		end
		else begin
			HEX0 = 7'b1000000;
		end
	end
	else begin
		HEX0 = 7'b1000000;
	end
end

endmodule

