module vga(

    input     wire                    clk,//系统参考时钟
    input     wire                    rst_n,//复位
	 output    wire       [23:0]       vga_rgb,//输出给ADV7123的R、G、B三分量数据
    output    wire                    vga_hs,//行同步信号
    output    wire                    vga_vs,//场同步信号
	 output    wire                    vga_clk,//像素时钟
    output    wire                    vga_blank_n,//消隐信号
    output    wire                    vga_sync_n//复合同步控制IOG输入
);

    wire                    clk_25m;
    wire                    pll_locked;
    
    pll pll_inst (//例化PLL
    
        .rst             ( ~rst_n     ),
        .refclk         ( clk         ),
        .outclk_0    ( clk_25m    ),
        .locked       ( pll_locked)
    );

    vga_ctrl vga_ctrl_inst (//例化VGA控制模块

        .clk                    (clk_25m        ),
        .rst_n                (pll_locked    ),
                         
        .vga_rgb                (vga_rgb        ),
        .vga_hs                (vga_hs        ),
        .vga_blanck_n        (vga_blank_n),
        .vga_vs                (vga_vs        )
    );

//If not IOG, Sync input should be tied to 0;
assign vga_sync_n=1'b0;    
assign vga_clk=clk_25m;
 
endmodule