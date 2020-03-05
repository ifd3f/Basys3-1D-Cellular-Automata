`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 11:31:17 AM
// Design Name: 
// Module Name: ClockDividerTest
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


module ClockDividerTest(

    );
    
    logic clkin, clkout;
    
    ClockDivider div(.n(3), .*);
    
    always begin
        clkin = 1;
        #1;
        clkin = 0;
        #1;
    end
endmodule
