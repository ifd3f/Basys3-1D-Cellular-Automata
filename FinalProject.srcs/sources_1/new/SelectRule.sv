module SelectRule(
    input clk, inc, dec, dig_next, dig_prev, enter,
    output [7:0] rule, 
    output reg [7:0] active_rule = 0,
    output [15:0] div,
    output reg [1:0] digit = 0
    );
        
    NumControl lr(.inc(inc), .dec(dec), .en(digit == 0), .num(rule[3:0]));
    NumControl ur(.inc(inc), .dec(dec), .en(digit == 1), .num(rule[7:4]));
    SpeedControl sc(.inc(inc), .dec(dec), .en(digit == 2), .div(div));

    always_ff @(posedge clk) begin
        if (dig_next)
            digit <= digit + 1;
        if (dig_prev)
            digit <= digit - 1;
        if (enter)
            active_rule <= rule;
    end
    
endmodule