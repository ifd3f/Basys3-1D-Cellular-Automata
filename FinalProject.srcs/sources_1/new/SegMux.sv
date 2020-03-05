module SegMux #(parameter DIV_DIG_WIDTH=16, DIV_DIG_N=16'd250)(
    input [27:0] seg_in,
    input clk,
    input [1:0] digit,
    output logic [6:0] seg,
    output logic [3:0] an,
    output dp
    );
    
    reg [1:0] drv = 0;
    ClockDivider #(.WIDTH(DIV_DIG_WIDTH)) div(.clkin(clk), .n(DIV_DIG_N), .clkout(dp_sig));

    always_ff@(posedge clk) begin
        drv <= drv + 1;
    end
    
    assign dp = ~(dp_sig & (digit == drv));
    
    always_comb begin
        case (drv)
            2'd0: begin
                seg = seg_in[6:0];
                an = 4'b1110;
            end
            2'd1: begin
                seg = seg_in[13:7];
                an = 4'b1101;
            end
            2'd2: begin
                seg = seg_in[20:14];
                an = 4'b1011;
            end
            2'd3: begin
                seg = seg_in[27:21];
                an = 4'b0111;
            end 
        endcase
    end
endmodule
