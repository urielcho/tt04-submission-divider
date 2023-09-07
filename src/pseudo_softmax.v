`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 19:37:12
// Design Name: 
// Module Name: pseudo_softmax
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "FLP_adder_tree.v"
`include "subtractors_array.v"
`include "reciprocal_pwl.v"

module pseudo_softmax #(parameter NUM_INPUTS=1, parameter EXP_WIDTH=4, parameter MANT_WIDTH=3)(
  input clk,
  input [NUM_INPUTS*MANT_WIDTH-1:0] input_bus,
  output [MANT_WIDTH-1:0] mant_out,
  output [NUM_INPUTS*EXP_WIDTH-1:0] exp_out
//  output [NUM_INPUTS-1:0][EXP_WIDTH-1:0] exp_out

);

  wire [EXP_WIDTH-1:0] exp_sum;
  wire [MANT_WIDTH-1:0] mant_sum;
  wire [EXP_WIDTH*NUM_INPUTS-1:0] exp_out_wire;
  wire [MANT_WIDTH-1:0] mant_out_wire;


  
  FLP_adder_tree #(.NUM_INPUTS(NUM_INPUTS), .EXP_WIDTH(EXP_WIDTH), .MANT_WIDTH(MANT_WIDTH)) adder_tree(
    .clk(clk),
    .input_bus(input_bus),
    .exp(exp_sum),
    .mant(mant_sum)
  );

  subtractors_array #(.NUM_INPUTS(NUM_INPUTS), .EXP_WIDTH(EXP_WIDTH)) subtractors(
    .input_bus(input_bus),
    .exp_sum(exp_sum),
    .exp_out(exp_out_wire)
  );

  reciprocal_pwl #(.MANT_WIDTH(MANT_WIDTH)) pwl(
    .clk(clk),
    .in(mant_sum),
    .out(mant_out_wire)
  );
  
  assign exp_out = exp_out_wire;
  assign mant_out = mant_out_wire;

endmodule
