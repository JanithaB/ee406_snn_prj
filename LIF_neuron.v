
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 02:46:34 PM
// Design Name: 
// Module Name: LIF_neuron
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


module LIF_neuron (
  
  input wire clk,          // Clock signal
  input en,  // Enable signal (optional)
  input signed [WIDTH-1:0] weight0,  // Weight for input 0
  input signed [WIDTH-1:0] weight1,  // Weight for input 1 (and so on...)
  input signed [WIDTH-1:0] data0,
  input signed [WIDTH-1:0] data1,  // Additional inputs can be added here
  output reg signed [WIDTH-1:0] sum,  // Weighted sum of inputs
  output reg out,
  output reg [WIDTH-1:0] display_out,  // Output for display
  
  input wire reset,        // Reset signal
  input wire I_ext,        // External input current
  output wire spike        // Spike output
  
);
 parameter WIDTH = 8; 
  // Parameters
  parameter tau_m = 100;   // Membrane time constant (in ms)
  parameter V_reset = 0;   // Reset potential (in mV)
  parameter V_th = 10;     // Threshold potential (in mV)
  
 

  // Internal signals
  reg [7:0] V;             // Membrane potential (8-bit representation)
  reg spike_reg;           // Spike register

  // Update membrane potential
  always @(*) begin
    if (reset) begin
      V <= V_reset;
      spike_reg = 0;
    end
     else
      begin
      V =  V + weight0 * data0 + weight1 * data1; 
      sum=V;
      if (V >= V_th) begin
        V = V_reset;
        spike_reg = 1;
        out=spike_reg;
        #5;
        spike_reg = 0;
      end
    end
  
  out=spike_reg;
  end

  // Output spike
  assign spike = spike_reg;

endmodule
