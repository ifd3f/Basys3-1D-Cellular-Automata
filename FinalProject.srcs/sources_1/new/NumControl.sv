module NumControl(
    input clk,
    input inc,
    input dec,
    input en,
    output reg [3:0] num = 0
    );
    
    always_ff @(posedge clk) begin
        if (en) begin
            if (inc)
                num <= num + 1;
            if (dec)
                num <= num - 1;
        end
    end

endmodule
