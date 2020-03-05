`timescale 100us / 100us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 09:55:55 AM
// Design Name: 
// Module Name: TopSim
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


module TopSim(

    );
    
    logic clk, dig_next, dig_prev, inc, dec, reset, dp;
    logic [15:0] sw, led;
    logic [6:0] seg;
    logic [3:0] an;
    
    Top topmod(.*);
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        dig_next = 0;
        dig_prev = 0;
        inc = 0;
        dec = 0;
        reset = 0;
        sw = 16'b00000010011;
        
        // Move to MSD rule
        #1000;
        dig_next = 1;
        #2000;
        dig_next = 0;
        #5000;
        
        // Increment (10)
        for (int i = 0; i < 1; i++) begin
            inc = 1;
            #2000;
            inc = 0;
            #3000;
        end
        #1000;
        
        // Move to LSD rule
        dig_prev = 1;
        #2000;
        dig_prev = 0;
        #5000;
        
        // Decrement (16)
        for (int i = 0; i < 10; i++) begin
            dec = 1;
            #2000;
            dec = 0;
            #3000;
        end
        #5000;
        
        // Begin simulating
        reset = 1;
        #1000;
        reset = 0;
        #50000
        
        // Move to speed        
        for (int i = 0; i < 2; i++) begin
            dig_next = 1;
            #2000;
            dig_next = 0;
            #3000;
        end
        #5000;
        
        // Make it go faster
        for (int i = 0; i < 10; i++) begin
            inc = 1;
            #2000;
            inc = 0;
            #48000;
        end
        
        #50000;
        
        // Make it go slower
        for (int i = 0; i < 20; i++) begin
            dec = 1;
            #2000;
            dec = 0;
            #48000;
        end
    end
endmodule
