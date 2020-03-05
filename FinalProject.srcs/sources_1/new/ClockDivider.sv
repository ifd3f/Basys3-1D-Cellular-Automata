module ClockDivider#(parameter WIDTH=8)(
    input clkin,
    input [WIDTH-1:0] n,
    output clkout
    );
    
    reg [WIDTH-1:0] state = 0;
    reg toggle = 0;  // for 50% duty cycle
    
    assign clkout = toggle;
    
    always_ff @(posedge clkin) begin
        if (state >= n) begin
            state <= 0;
            toggle = ~toggle;
        end else
            state <= state + 1;
    end
endmodule
