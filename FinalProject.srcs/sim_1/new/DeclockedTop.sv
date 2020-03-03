`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 09:33:10 AM
// Design Name: 
// Module Name: DeclockedTop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
    ClockDivider #(.WIDTH(32), .N(100000)) main_div(.clkin(clk_sys), .clkout(clk));
    Top top(.*);
endmodule
