module add_sub(
    input [7:0] num1,
    input [7:0] num2,
    output [8:0] result
    );
    wire [7:0] num2_a2;
    
  assign num2_a2 = ~num2 + 1;
  assign result = num1 - num2_a2;
endmodule