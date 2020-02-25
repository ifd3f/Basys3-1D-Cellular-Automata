module Conv#(parameter WIDTH=16)(
    input [WIDTH+1:0] si,
    input [7:0] rule,
    output logic [WIDTH-1:0] so
);

    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin : dff
            Step kernel(.si(si[i+2:i]), .rule(rule), .so(so[i])); 
        end
    endgenerate
    
endmodule

