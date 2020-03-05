`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 12:34:27 AM
// Design Name: 
// Module Name: SpeedControl
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


module SpeedControl #(parameter T_WIDTH=12, DEFAULT_T = 550, STEP = 50, MAX = 2000, MIN = 250) (
    input clk,
    input inc,
    input dec,
    input en,
    output clkout 
    );
    
    reg [T_WIDTH-1:0] t = DEFAULT_T;
    ClockDivider #(.WIDTH(T_WIDTH)) div(.clkin(clk), .n(t), .clkout(clkout));
    
    logic [T_WIDTH-1:0] next_inc, next_dec;
    assign next_inc = t - STEP;
    assign next_dec = t + STEP;
    
    always_ff @(posedge clk) begin
        if (en) begin
            // inc and dec look like they're in reverse, but inc means to increase speed (decrease period) and 
            // dec means to decrease speed (increase period)
            
            if (inc)
                if (next_inc < MIN | next_inc > t)
                    t <= MIN;
                else
                    t <= next_inc;
                
            if (dec)
                if (next_dec > MAX | next_dec < t)
                    t <= MAX;
                else
                    t <= next_dec;
        end
    end
endmodule
