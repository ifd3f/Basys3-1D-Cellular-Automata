module DeclockedTop(
    input clk_sys,
    input dig_next,
    input dig_prev,
    input inc,
    input dec,
    input [15:0] sw,
    input reset,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output dp
    );
    
    logic clk;
    ClockDivider #(.WIDTH(32)) main_div(.n(32'd50000), .clkin(clk_sys), .clkout(clk));
    Top top(.*);
endmodule
