`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 11:50:35 AM
// Design Name: 
// Module Name: SelectRuleSim
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


module SelectRuleSim(

    );
    
    logic clk, inc, dec, dig_next, dig_prev, digit, enter;
    logic [7:0] rule, active_rule;
    
    SelectRule select(.*);
    
    always begin
        clk = 1;
        #1;
        clk = 0;
        #1;
    end
    
    initial begin
        dec = 0;
        dig_next = 0;
        dig_prev = 0;
        inc = 0;
        enter = 0;
        #10;

        inc = 1;
        #1;
        inc = 0;
        #5;
        
        dig_next = 1;
        #1;
        dig_next = 0;
        #5;
        
        dec = 1;
        #1;
        dec = 0;
        #5;
        
        enter = 1;
        #1;
        enter = 0;
        #1;
    end

endmodule
