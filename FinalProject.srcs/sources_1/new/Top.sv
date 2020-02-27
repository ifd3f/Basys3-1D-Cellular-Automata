`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2020 09:04:46 AM
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,
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
    
    logic [7:0] rule;
    logic clk_sim;
    logic digit;
    
    SelectRule sel_rule(.clk(clk), .inc(inc), .dec(dec), .dig_next(dig_next), .dig_prev(dig_prev), .digit(digit), .rule(rule));
    ClockDivider #(.WIDTH(16), .N(200)) div(.clkin(clk), .clkout(clk_sim));    
    Simulator #(.WIDTH(16)) sim(.clk(clk_sim), .rule(rule), .si(sw), .reset(reset), .so(led));
    DisplayDriver drv(.rule(rule), .digit(digit), .clk(clk), .seg(seg), .dp(dp), .an(an));
endmodule
