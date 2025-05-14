module vga_top(

	input		wire			clk,    //板载50M时钟输入
	input		wire			rst_n,  //可以选择key0作为复位信号的输入
	
	output	wire		[11:0]		vga_rgb,
	output	wire				vga_hs,  //行同步信号
	output	wire				vga_vs   //场同步信号
);

	wire					clk_25m; //根据前面表格得知640x480@60的像素时钟是25M，所以用一个PLL 将50M分频得到25M
	wire					pll_locked;//当PLL稳定输出时该信号为高

	
	pll pll_inst (                                      //用来将50M分频得到25M的像素时钟            
	
		.areset 			( ~rst_n ),
		.inclk0 			( clk ),
		.c0				( clk_25m),
		.locked   		( pll_locked)
	);

	vga_ctrl vga_ctrl_inst (

		.clk				(clk_25m),
		.rst_n				(pll_locked),
                       
		.vga_rgb			(vga_rgb),
		.vga_hs				(vga_hs	),
		.vga_vs				(vga_vs	)
	);

endmodule