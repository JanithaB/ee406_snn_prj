`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 10:37:40 AM
// Design Name: 
// Module Name: snn_test
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


module snn_test;

  // Inputs
  reg clk;
  reg en;
  reg signed [7:0] weight0;
  reg signed [7:0] weight1;
  reg signed [7:0] data0;
  reg signed [7:0] data1;

  // Outputs
  wire signed [7:0] sum;
  wire out;

  // Instantiate the SimpleNeuron module
  snn_main dut (clk, en, weight0, weight1, data0, data1, sum, out);

  // Clock generation (50 MHz)
  initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
  end

  initial begin
    // Test case 1: Positive weighted sum (output should be 1)
    en <= 1'b1;
    weight0 <= 8'b01010000;  // Positive weight (40)
    weight1 <= 8'b00100000;  // Positive weight (16)
    data0 <= 8'b11111111;  // Maximum positive value
    data1 <= 8'b00000001;  // Minimum positive value
    #20;  // Wait for two clock cycles

    // Test case 2: Negative weighted sum (output should be 0)
    weight0 <= 8'b10110000;  // Negative weight (-40)
    weight1 <= 8'b11000000;  // Negative weight (-128)
    #20;  // Wait for two clock cycles

    // Test case 3: Zero weighted sum (output should be 0)
    weight0 <= 8'b00000000;  // Zero weight
    weight1 <= 8'b00000000;  // Zero weight
    #20;  // Wait for two clock cycles

    // More test cases can be added here

    $stop;
  end

  // Monitor signals
  always @(posedge clk) begin
    $display($time, " en=%b weight0=%d weight1=%d data0=%d data1=%d sum=%d out=%b", en, weight0, weight1, data0, data1, sum, out);
  end

endmodule

    

