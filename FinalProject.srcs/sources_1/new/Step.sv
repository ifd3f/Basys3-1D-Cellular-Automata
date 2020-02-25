module Step(
    input [2:0] si,
    input [7:0] rule,
    output so
);

    assign so = rule[si];

endmodule