`timescale 100us / 100us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2020 05:10:57 PM
// Design Name: 
// Module Name: SpeedControlSim
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


module SpeedControlSim(

    );
    
    logic clk, inc, dec, en, clkout;

    SpeedControl ctrl(.*);
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        inc = 0;
        dec = 0;
        en = 0;
        #10000;
        
        inc = 1;
        #5;
        inc = 0;
        #9995;
        
        en = 1;
        #10000;
        
        for (int i = 0; i < 10; i++) begin
            inc = 1;
            #5;
            inc = 0;
            #9995;
        end
        
        #10000;
        
        for (int i = 0; i < 20; i++) begin
            dec = 1;
            #5;
            dec = 0;
            #9995;
        end
        
    end
endmodule
