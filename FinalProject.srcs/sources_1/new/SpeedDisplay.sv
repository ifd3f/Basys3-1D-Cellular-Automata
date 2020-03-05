`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 12:34:46 AM
// Design Name: 
// Module Name: SpeedDisplay
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


module SpeedDisplay(
    input clk, 
    output logic [6:0] seg
    );
    reg [2:0] state = 0;
    
    always_ff @(posedge clk) begin
        if (state == 5)
            state <= 0;
        else
            state <= state + 1;
    end
    
    always_comb begin
        case (state)
            0: seg = 7'b1111110;
            1: seg = 7'b1111101;
            2: seg = 7'b1111011;
            3: seg = 7'b1110111;
            4: seg = 7'b1101111;
            default: seg = 7'b1011111;
        endcase
    end
endmodule
