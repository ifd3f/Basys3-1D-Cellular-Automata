`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 09:47:54 AM
// Design Name: 
// Module Name: ClockDivider
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


module ClockDivider#(parameter WIDTH=8, N=20)(
    input clkin,
    output clkout
    );
    
    reg [WIDTH-1:0] state = 0;
    
    assign clkout = state == 0;
    
    always_ff @(posedge clkin) begin
        state <= state + 1;
        if (state == N)
            state <= '0;
    end
endmodule
