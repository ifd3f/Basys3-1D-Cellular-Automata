`timescale 1ms / 1us
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
    
    Top d(.*);
    
    always begin
        clk = 1;
        #1;
        clk = 0;
        #1;
    end
    
    initial begin
        dig_next = 0;
        dig_prev = 0;
        inc = 0;
        dec = 0;
        reset = 0;
        sw = 16'b00000010011;
        
        #100;
        dig_next = 1;
        #200;
        dig_next = 0;
        #500;
        
        for (int i = 0; i < 7; i++) begin
            inc = 1;
            #200;
            inc = 0;
            #300;
        end
        
        #100;
        dig_prev = 1;
        #200;
        dig_prev = 0;
        #500;
        
        for (int i = 0; i < 2; i++) begin
            dec = 1;
            #200;
            dec = 0;
            #300;
        end
        
        #500;
        reset = 1;
        #100;
        reset = 0;

    end
endmodule
