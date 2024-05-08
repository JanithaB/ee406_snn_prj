`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 12:54:53 AM
// Design Name: 
// Module Name: lif_tb
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


module lif_tb;
 // Parameters
  parameter WIDTH = 8;
  parameter CLOCK_PERIOD = 10; // Clock period in ns
  
  // Signals
  reg clk;
  reg reset;
  reg en;
  reg signed [WIDTH-1:0] weight0;
  reg signed [WIDTH-1:0] weight1;
  reg signed [WIDTH-1:0] data0;
  reg signed [WIDTH-1:0] data1;
  wire signed [WIDTH-1:0] sum;
  wire out;
  wire [WIDTH-1:0] display_out;
  wire I_ext;
  wire spike;

  // Instantiate the DUT
  LIF_neuron dut (
    .clk(clk),
    .en(en),
    .weight0(weight0),
    .weight1(weight1),
    .data0(data0),
    .data1(data1),
    .sum(sum),
    .out(out),
    .display_out(display_out),
    .reset(reset),
    .I_ext(I_ext),
    .spike(spike)
  );

  // Clock generation
initial begin
    // Initialize clock signal
    clk = 0;

    // Toggle clock signal every 5 time units (for example)
    //forever #5 clk = ~clk;
end
  // Reset generation
  initial begin
    reset = 1;
    en = 1;
    #5; // Wait for 100 time units
    reset = 0;
  end

  // Test stimuli
  initial begin
    // Input weights and data
    weight0 = 2;
    weight1 = 1;
    data0 = 0;
    data1 = 0;
    #7;

    data0 = 3;
    data1 = 2;
    #7;

   data0 = 2;
   data1 = 1;
  #7; // Wait for 20 time units

    // Additional test stimuli can be added here

    // End simulation
    $finish;
  end

  // Display output
  always @(posedge clk) begin
    $display("Time: %t, Sum: %d, Output: %d, Spike: %b", $time, sum, out, spike);
  end

endmodule

