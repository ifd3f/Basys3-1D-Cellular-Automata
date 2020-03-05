`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 12:34:27 AM
// Design Name: 
// Module Name: SpeedControl
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


module SpeedControl (
    input clk,
    input inc,
    input dec,
    input en,
    output clkout 
    );
    
    // This is the current speed increment.
    reg [3:0] i = 8;
    
    // This is the current period.
    
    // These are values in the recursive function used to generate the cubic approximation of the rational function t = 1/freq
    // Output
    reg [15:0] s0 = 889;
    // First-order difference
    reg [15:0] s1 = -90;
    
    // Second-order difference
    reg [15:0] s2 = 13;
    
    // Third-order difference (constant)
    logic [15:0] s3 = -6;

    // The clock divider, finally
    ClockDivider #(.WIDTH(16)) div(.clkin(clk), .n(s0), .clkout(clkout));
    
    // On inc or dec, these will be the resulting values of t, s1, and s2. 
    logic [15:0] ds0, ds1, ds2, is0, is1, is2;
    assign is2 = s3 + s2;
    assign is1 = s2 + s1;
    assign is0 = s1 + s0;
    assign ds2 = s2 - s3;
    assign ds1 = s1 - ds2;
    assign ds0 = s0 - ds1;
    
    always_ff @(posedge clk) begin
        if (en) begin
            if (inc & i != 15) begin
                s2 <= is2;
                s1 <= is1;
                s0 <= is0;
                i <= i + 1;
            end
                
            if (dec & i != 0) begin
                s2 <= ds2;
                s1 <= ds1;
                s0 <= ds0;
                i <= i - 1;
            end
        end
    end
endmodule
