module SelectRule(
    input clk, inc, dec, dig_next, dig_prev, enter,
    output reg [7:0] active_rule = 0, rule = 0,
    output reg digit = 0
    );
    
    logic [7:0] delta;
    
    assign delta = digit ? 8'd16 : 8'd1;
    
    always_ff @(posedge clk) begin
        if (inc)
            rule <= rule + delta;
        if (dec)
            rule <= rule - delta;
        if (dig_next | dig_prev)
            digit <= ~digit;
        if (enter)
            active_rule <= rule;
    end
    
endmodule