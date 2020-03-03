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


module SpeedControl(
    input inc,
    input dec,
    input en,
    output reg [15:0] div
    );
    always_ff @(posedge inc, dec) begin
        if (en) begin
            if (inc)
                div = div - 100;
            if (dec)
                div = div + 100;
        end
    end
endmodule
