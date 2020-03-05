module SelectRule(
    input clk, inc, dec, dig_next, dig_prev, enter,
    output [7:0] rule, 
    output reg [7:0] active_rule = 0,
    output clk_sim,
    output reg [1:0] digit = 0
    );
        
    NumControl lr(.clk(clk), .inc(inc), .dec(dec), .en(digit == 0), .num(rule[3:0]));
    NumControl ur(.clk(clk), .inc(inc), .dec(dec), .en(digit == 1), .num(rule[7:4]));
    SpeedControl sc(.clk(clk), .inc(inc), .dec(dec), .en(digit == 2), .clkout(clk_sim));

    always_ff @(posedge clk) begin
        if (dig_next)
            digit <= digit + 1;
        if (dig_prev)
            digit <= digit - 1;
        if (enter)
            active_rule <= rule;
    end
    
endmodule