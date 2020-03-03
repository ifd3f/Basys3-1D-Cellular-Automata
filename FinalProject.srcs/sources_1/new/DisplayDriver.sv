//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 02:27:31 PM
// Design Name: 
// Module Name: DisplayDriver
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


module DisplayDriver #(parameter DIV_DIG_WIDTH=16, DIV_DIG_N=2000)(
    input [7:0] rule,
    input clk,
    input digit,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    logic clk_div;
    reg dp_sig = 0;

    ClockDivider #(.WIDTH(DIV_DIG_WIDTH), .N(DIV_DIG_N)) div(.clkin(clk), .clkout(clk_div));
        
    always_ff @(posedge clk_div) begin
        dp_sig <= !dp_sig;
    end
    
    reg drv_digit = 0;
    always_ff @(posedge clk) begin
        drv_digit <= !drv_digit;
    end
    
    logic [3:0] drv_n = drv_digit ? rule[3:0] : rule[7:4];
    
    Seg7 dcdr(.num(drv_n), .display(seg));
    assign dp = ~((drv_digit == digit) & (digit == dp_sig));
    assign an = drv_digit ? 4'b1101 : 4'b1110; 
    
endmodule
