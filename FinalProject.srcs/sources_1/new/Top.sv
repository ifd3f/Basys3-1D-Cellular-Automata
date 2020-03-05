module Top(
    input clk,
    input dig_next,
    input dig_prev,
    input inc,
    input dec,
    input [15:0] sw,
    input reset,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output dp
    );
    
    logic [7:0] rule, active_rule;
    logic clk_sim;
    logic [1:0] digit;
        
    Debouncer db_inc(.clk(clk), .d(inc));
    Debouncer db_dec(.clk(clk), .d(dec));
    Debouncer db_reset(.clk(clk), .d(reset));
    Debouncer db_dnx(.clk(clk), .d(dig_next));
    Debouncer db_dpr(.clk(clk), .d(dig_prev));
    
    SelectRule sel_rule(.clk(clk), .enter(db_reset.q), .inc(db_inc.q), .dec(db_dec.q), .dig_next(db_dnx.q), .dig_prev(db_dpr.q), .clk_sim(clk_sim), .digit(digit), .active_rule(active_rule), .rule(rule));
    Simulator #(.WIDTH(16)) sim(.clk(clk_sim), .rule(active_rule), .si(sw), .reset(db_reset.q), .so(led));
    DisplayDriver drv(.rule(rule), .digit(digit), .clk(clk), .clk_sim(clk_sim), .seg(seg), .dp(dp), .an(an));
endmodule
