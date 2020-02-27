module Simulator#(parameter WIDTH=16)(
    input clk, reset,
    input [WIDTH-1:0] si,
    input [7:0] rule,
    input left = 0, right = 0,
    output reg [WIDTH-1:0] so = 0
    );
    
    logic [WIDTH-1:0] convOut;
    
    Conv conv(.si({left, so, right}), .rule(rule), .so(convOut));
    
    always_ff @(posedge clk, posedge reset) begin
        if (reset) 
            so <= si;
        else if (clk)
            so <= convOut;
    end
endmodule