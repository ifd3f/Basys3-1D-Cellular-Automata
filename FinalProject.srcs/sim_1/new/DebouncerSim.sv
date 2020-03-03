`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 09:14:19 AM
// Design Name: 
// Module Name: DebouncerSim
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


module DebouncerSim(

    );
    
    logic clk, d, q;
    
    Debouncer #(.N(8'd8)) db(.*);
    
    always begin
        clk = 1;
        #1;
        clk = 0;
        #1;
    end
    
    initial begin
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #20;
        
        d = 1;
        #1;
        d = 0;
        #1;
        d = 1;
        #3;
        d = 0;
        #3
        d = 1;
        #1;
        d = 0;
        #20;
        
        d = 1;
        #20;
        d = 0;
        #100;
    end   
endmodule
