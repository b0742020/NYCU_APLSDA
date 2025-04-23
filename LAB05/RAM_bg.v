module RAM(input CLOCK_50,
           input [9:0] SW,
           output  [9:0]LEDR,
           output reg [6:0]HEX0,HEX2,HEX3);


reg clk_slow;
reg[26:0]sys_cnt;
reg[4:0]addr;
reg [3:0]data_tmp[31:0];

wire [3:0]data;

ram_test u1 (
	.address(SW[4:0]),
	.clock(CLOCK_50),
	.data(SW[8:5]),
	.wren(SW[9]),
	.q(data));

assign LEDR[0] = (SW[9])?1'b1:1'b0;

always@(posedge CLOCK_50)begin
    if(sys_cnt <50000000)begin
        sys_cnt <= sys_cnt + 26'b1;
        clk_slow <= 1'b0;
        if (SW[9]) begin
            data_tmp[SW[4:0]] <= data;
        end
    end
    else begin
        sys_cnt <= 26'b0;
        clk_slow <= ~clk_slow;
    end
end

always@(posedge clk_slow)begin
    addr <= (addr == 5'd31)? 5'd0 : addr + 5'd1;
end


always@(*)begin
    case(addr[3:0])
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
    case(addr[4])
        1'b0: HEX3 = 7'b1000000;
        1'b1: HEX3 = 7'b1111001;
        default: HEX3 = 7'b1000000;
    endcase
end

always@(*)begin
    case(data_tmp[addr])
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


endmodule