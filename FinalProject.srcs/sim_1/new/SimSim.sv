`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2020 01:32:11 PM
// Design Name: 
// Module Name: SimSim
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


module SimSim(

    );
    
    logic [15:0] si;
    logic [7:0] rule;
    logic reset, clk;
    logic [15:0] so;
        
    Simulator sim(.*);
    
    initial begin
        clk = 0;
        si = 16'b00010011000;
        rule = 8'd110;
        reset = 1;
        #5;
        clk = 1;
        #5;
        clk = 0;
        reset = 0;
        #5;
        
        while (1) begin
            clk = 1;
            #2;
            clk = 0;
            #2;
        end
    end
endmodule
