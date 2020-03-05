`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 10:54:55 AM
// Design Name: 
// Module Name: SpeedDisplaySim
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


module SpeedDisplaySim(

    );
    
    logic clk; 
    logic [6:0] seg;
    
    SpeedDisplay sds(.*);

    always begin
        clk = 0;
        #1;
        clk = 1;
        #1;
    end
    
endmodule
