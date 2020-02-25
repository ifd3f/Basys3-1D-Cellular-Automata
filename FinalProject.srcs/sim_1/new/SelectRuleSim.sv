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
    
    logic inc, dec, dig_next, dig_prev, digit;
    logic [7:0] rule;
    
    SelectRule select(.*);
    
    initial begin
        inc = 1;
        dec = 0;
        dig_next = 0;
        dig_prev = 0;
        #1;
        inc = 0;
        #1;
        
        dig_next = 1;
        #1;
        dig_next = 0;
        
        #1;
        dec = 1;
        #1;
        dec = 0;
    end

endmodule
