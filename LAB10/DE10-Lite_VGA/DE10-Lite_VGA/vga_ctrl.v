`define VGA_640x480x60					// choose different video standard,revise PLL clk ,alter cnt WIDTH
//`define VGA_640X480X75
//`define VGA_800X600X60
//`define VGA_800X600X75
//`define VGA_1024X768X60
//`define VGA_1024X768X75
//`define VGA_1280X1024X60
//`define VGA_1280X800X60
//`define VGA_1440X900X60

module vga_ctrl (

	input		wire				clk,
	input		wire				rst_n,

	output	reg		[11:0]	                vga_rgb,//定义为12位是因为DE0-CV和DE10-Lite的VGA 都是RGB444
	output	reg			 		vga_hs,
	output	reg					vga_vs
);

//================ VGA_640X480X60 =========================================================

`ifdef VGA_640x480x60 // PLL clk = 25M = 640x480x60

	localparam			HS_A	=	96;	// 行同步
	localparam			HS_B	=	48;	// 行显示后沿
	localparam			HS_C	=	640;	// 行有效数据
	localparam			HS_D	=	16;	// 行显示前沿
	localparam			HS_E	=	800;	// 行扫描周期

	localparam			VS_A	=	2;		// 场同步
	localparam			VS_B	=	33;   // 场显示后沿
	localparam			VS_C	=	480;	// 场有效数据
	localparam			VS_D	=	10;   // 场显示前沿
	localparam			VS_E	=	525;	// 场扫描周期
	
	localparam			HS_WIDTH	=	10;
	localparam			VS_WIDTH	=	10;

`endif


	parameter			CNT_VS_R	= 195;				// 195 = 2+33+160, 35~195 is red 有效数据q段是480行，第一个160行是红
	parameter			CNT_VS_G	= 355;				//	195~355 is green 第二个160行是绿，剩下的就是蓝了
	
	reg		[HS_WIDTH - 1:0]		cnt_hs;				// counter for vertical synchronous signal
	reg		[VS_WIDTH - 1:0]		cnt_vs;				// counter for horizontal synchrous signal
	
	wire					en_hs;								//	dsiplay horizontal enable
	wire					en_vs;								// display vertical enable
	wire					en;									// effective display zone
	
	wire					en_vs_r;								// red stripe enable
	wire					en_vs_g;								// green stripe enable
	
	//行计数器，对像素时钟计数
	always @ (posedge clk, negedge rst_n)
		if (!rst_n)
			cnt_hs <= 0;
		else
			if (cnt_hs < HS_E - 1)
				cnt_hs <= cnt_hs + 1'b1;
			else
				cnt_hs <= 0;
				
	//场计数器，对行计数			
	always @ (posedge clk, negedge rst_n)
		if (!rst_n)
			cnt_vs <= 0;
		else
			if (cnt_hs == HS_E - 1)
				if (cnt_vs < VS_E - 1)
					cnt_vs <= cnt_vs + 1'b1;
				else
					cnt_vs <= 0;
			else
				cnt_vs <= cnt_vs;
				
	always @ (posedge clk, negedge rst_n)
		if (!rst_n)
			vga_hs <= 1'b1;
		else
			if (cnt_hs < HS_A - 1) //同步之前vga_hs信号都是低， 同步之后（a）vga_hs信号是高
				vga_hs <= 1'b0;
			else
				vga_hs <= 1'b1;
				
	always @ (posedge clk, negedge rst_n)
		if (!rst_n)
			vga_vs <= 1'b1;
		else
			if (cnt_vs < VS_A - 1) //同步之前vga_vs 信号都是低， 同步之后（a）vga_vs 信号是高
				vga_vs <= 1'b0;
			else
				vga_vs <= 1'b1;
		
	assign en_hs = (cnt_hs > HS_A + HS_B - 1)&& (cnt_hs < HS_E - HS_D);//en_hs 将有效数据c段标出来了，有效数据c段en_hs 才为高，否则为低
	assign en_vs = (cnt_vs > VS_A + VS_B - 1) && (cnt_vs < VS_E - VS_D);//en_vs 将有效数据q段标出来了，有效数据q段en_hs 才为高，否则为低
	assign en_vs_r = (cnt_vs > VS_A + VS_B  - 1) && (cnt_vs < CNT_VS_R);//场同步的第一个160行
	assign en_vs_g = (cnt_vs > CNT_VS_R  - 1) && (cnt_vs < CNT_VS_G);   //场同步的第二个160行
	assign en = en_hs && en_vs;//将vga显示的有效像素点位置全部标注出来了

	always @ (posedge clk, negedge rst_n)
		if (!rst_n)
			vga_rgb <= 12'b0000_0000_0000;
		else
			if (en)
				if (en_vs_r)
					vga_rgb <= 12'b0000_0000_1111;					// 红
				else
					if (en_vs_g)
						vga_rgb <= 12'b0000_1111_0000;				// 绿
					else
						vga_rgb <= 12'b1111_0000_0000;				// 蓝
			else
				vga_rgb <= 12'b0000_0000_0000;

endmodule