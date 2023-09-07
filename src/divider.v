module Clock_divider(clk,cout1,cout2,cout3,cout4,cout5,cout6,cout7,cout8,cout9,cout10
    );
input clk; // input clock on FPGA
output reg cout1; // output clock after dividing the input clock by divisor
output reg cout2; // output clock after dividing the input clock by divisor
output reg cout3;
output reg cout4;
output reg cout5;
output reg cout6;
output reg cout7;
output reg cout8;

reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd2;
reg[27:0] counter2=28'd0;
parameter DIVISOR2 = 28'd4;
reg[27:0] counter3=28'd0;
parameter DIVISOR3 = 28'd8;
reg[27:0] counter4=28'd0;
parameter DIVISOR4 = 28'd16;
reg[27:0] counter5=28'd0;
parameter DIVISOR5 = 28'd32;
reg[27:0] counter6=28'd0;
parameter DIVISOR6 = 28'd64;
reg[27:0] counter7=28'd0;
parameter DIVISOR7 = 28'd128;
reg[27:0] counter8=28'd0;
parameter DIVISOR8 = 28'd256;

// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clk)
begin
 counter <= counter + 28'd1;
 if(counter>=(DIVISOR-1))
  counter <= 28'd0;
 cout1 <= (counter<DIVISOR/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter2 <= counter2 + 28'd1;
 if(counter2>=(DIVISOR2-1))
  counter2 <= 28'd0;
 cout2 <= (counter2<DIVISOR2/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter3 <= counter3 + 28'd1;
 if(counter3>=(DIVISOR3-1))
  counter3 <= 28'd0;
 cout3 <= (counter3<DIVISOR3/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter4 <= counter4 + 28'd1;
 if(counter4>=(DIVISOR4-1))
  counter4 <= 28'd0;
 cout4 <= (counter4<DIVISOR4/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter5 <= counter5 + 28'd1;
 if(counter5>=(DIVISOR5-1))
  counter5 <= 28'd0;
 cout5 <= (counter5<DIVISOR5/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter6 <= counter6 + 28'd1;
 if(counter6>=(DIVISOR6-1))
  counter6 <= 28'd0;
 cout6 <= (counter6<DIVISOR6/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter7 <= counter7 + 28'd1;
 if(counter7>=(DIVISOR7-1))
  counter7 <= 28'd0;
 cout7 <= (counter7<DIVISOR7/2)?1'b1:1'b0;
end

always @(posedge clk)
begin
 counter8 <= counter8 + 28'd1;
 if(counter8>=(DIVISOR8-1))
  counter8 <= 28'd0;
 cout8 <= (counter8<DIVISOR8/2)?1'b1:1'b0;
end




endmodule