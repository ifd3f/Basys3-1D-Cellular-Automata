`timescale 1us / 1us
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
    
    logic [7:0] rule, active_rule;
    logic clk_sim;
    logic digit;
        
    Debouncer db_inc(.clk(clk), .d(inc));
    Debouncer db_dec(.clk(clk), .d(dec));
    Debouncer db_reset(.clk(clk), .d(reset));
    Debouncer db_dnx(.clk(clk), .d(dig_next));
    Debouncer db_dpr(.clk(clk), .d(dig_prev));
    
    SelectRule sel_rule(.clk(clk), .enter(db_reset.q), .inc(db_inc.q), .dec(db_dec.q), .dig_next(db_dnx.q), .dig_prev(db_dpr.q), .digit(digit), .active_rule(active_rule), .rule(rule));
    
    ClockDivider #(.WIDTH(16), .N(500)) div_sim(.clkin(clk), .clkout(clk_sim));    
    Simulator #(.WIDTH(16)) sim(.clk(clk_sim), .rule(active_rule), .si(sw), .reset(db_reset.q), .so(led));
    DisplayDriver drv(.rule(rule), .digit(digit), .clk(clk), .seg(seg), .dp(dp), .an(an));
endmodule
