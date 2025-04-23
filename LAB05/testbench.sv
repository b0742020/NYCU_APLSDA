module tb();
wire CLOCK_50;
wire [9:0]SW;
reg [9:0]LEDR ;
reg [6:0]HEX0,HEX2,HEX3 ;

RAM dut(
    .CLOCK_50(CLOCK_50),
    .SW(SW),
   .LEDR(LEDR),
   .HEX0(HEX0),
   .HEX2(HEX2),
    .HEX3(HEX3)
);


initial begin
    CLOCK_50 = 0;
    forever begin
        #20 CLOCK_50 = ~CLOCK_50;
    end
end




endmodule