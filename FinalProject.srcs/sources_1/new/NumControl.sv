`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 12:44:57 AM
// Design Name: 
// Module Name: NumControl
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


module NumControl(
    input clk,
    input inc,
    input dec,
    input en,
    output reg [3:0] num = 0
    );
    
    always_ff @(posedge clk) begin
        if (en) begin
            if (inc)
                num <= num + 1;
            if (dec)
                num <= num - 1;
        end
    end

endmodule
