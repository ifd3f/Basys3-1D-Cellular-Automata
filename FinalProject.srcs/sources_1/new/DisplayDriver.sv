module DisplayDriver(
    input [7:0] rule,
    input clk,
    input clk_sim,
    input [1:0] digit,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    SpeedDisplay spd(.clk(clk_sim));
    Seg7 ur(.num(rule[7:4]));
    Seg7 lr(.num(rule[3:0]));
    
    SegMux mux(.seg_in({7'b1111111, spd.seg, ur.seg, lr.seg}), .clk(clk), .digit(digit), .seg(seg), .an(an), .dp(dp));
endmodule
