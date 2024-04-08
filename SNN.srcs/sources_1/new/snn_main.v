`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2024 07:54:45 AM
// Design Name: 
// Module Name: snn_main
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


module snn_main(

  input clk,
  input en,  // Enable signal (optional)
  input signed [WIDTH-1:0] weight0,  // Weight for input 0
  input signed [WIDTH-1:0] weight1,  // Weight for input 1 (and so on...)
  input signed [WIDTH-1:0] data0,
  input signed [WIDTH-1:0] data1,  // Additional inputs can be added here
  output reg signed [WIDTH-1:0] sum,  // Weighted sum of inputs
  output reg out
);

  parameter WIDTH = 8;  // Change this to adjust the data width

  always @(posedge clk) begin
    if (en) begin  // Check enable signal (optional)
      sum <= weight0 * data0 + weight1 * data1;  // Calculate weighted sum
      out <= (sum >= 0);  // Output 1 if sum is non-negative (adjustable threshold)
    end
  end

endmodule

