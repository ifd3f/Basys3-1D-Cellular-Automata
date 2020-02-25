module SelectRule(
    input inc, dec, dig_next, dig_prev,
    output reg [7:0] rule = 0,
    output reg digit = 0
    );
    
    logic [7:0] delta;
    
    assign delta = digit ? 8'd16 : 8'd1;
    
    always_ff @(posedge inc, posedge dec, posedge dig_next, posedge dig_prev) begin
        if (inc)
            rule <= rule + delta;
        if (dec)
            rule <= rule - delta;
        if (dig_next)
            digit <= !digit;
        if (dig_prev)
            digit <= !digit;
    end
    
endmodule