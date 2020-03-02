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


module Debouncer (
    input d, clk,
    output q
    );
    
    reg prev = 0;
    assign q = d & ~prev;
    
    always_ff @(posedge clk) begin
        prev <= d;
    end
endmodule
