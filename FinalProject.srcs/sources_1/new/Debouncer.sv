`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2020 10:42:30 AM
// Design Name: 
// Module Name: Debouncer
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


module Debouncer #(WIDTH=8, N=50) (
    input d, clk,
    output reg q
    );
    
    reg [WIDTH-1:0] state = 0;
    logic signal = state != 0;
    reg prev = 0;
    
    always_ff @(posedge clk) begin
        if (d)  
            state <= N;
        else if (state != 0) 
            state <= state - 1;

        signal <= state != 0;
        prev <= signal;
        q <= signal & ~prev;
    end
endmodule
