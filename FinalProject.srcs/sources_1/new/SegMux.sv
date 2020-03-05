`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2020 12:23:30 AM
// Design Name: 
// Module Name: SegMux
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


module SegMux #(parameter DIV_DIG_WIDTH=16, DIV_DIG_N=16'd500)(
    input [27:0] seg_in,
    input clk,
    input [1:0] digit,
    output logic [6:0] seg,
    output logic [3:0] an,
    output dp
    );
    
    reg [1:0] drv = 0;
    reg [1:0] dp_sig = 0;
    ClockDivider #(.WIDTH(DIV_DIG_WIDTH)) div(.clkin(clk), .n(DIV_DIG_N));
    
    always_ff@(posedge div.clkout) begin
        dp_sig = ~dp_sig;
    end

    always_ff@(posedge clk) begin
        drv <= drv + 1;
    end
    
    assign dp = ~(dp_sig & (digit == drv));
    
    always_comb begin
        case (drv)
            2'd0: begin
                seg = seg_in[6:0];
                an = 4'b1110;
            end
            2'd1: begin
                seg = seg_in[13:7];
                an = 4'b1101;
            end
            2'd2: begin
                seg = seg_in[20:14];
                an = 4'b1011;
            end
            2'd3: begin
                seg = seg_in[27:21];
                an = 4'b0111;
            end 
        endcase
    end
endmodule
