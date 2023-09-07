
module shift_reg #(parameter DATA_WIDTH = 8)(
  input clk,
  input [DATA_WIDTH-1:0] data_in,
  input [DATA_WIDTH-1:0] shift_in,
  output reg [DATA_WIDTH-1:0] data_out
);
  always @(posedge clk) begin
    data_out <= data_in >> shift_in;
  end
endmodule
