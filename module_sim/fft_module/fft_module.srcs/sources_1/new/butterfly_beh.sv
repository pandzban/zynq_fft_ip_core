`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2021 20:37:17
// Design Name: 
// Module Name: butterfly_beh
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


module butterfly_beh#(
						parameter NUM_OF_WORDS = 5,
						parameter POWER = 2**($clog2(NUM_OF_WORDS))
					  )(
						input logic clk,
						input logic reset,
						input logic [15:0] Input [NUM_OF_WORDS],
						output logic [15:0] Output [POWER]
   	);

	logic [15:0] input_reg [POWER];
	logic [15:0] x_input [POWER];

	initial begin
		$display("POWER = %0d", POWER);
	end

	genvar j,i;

	always_ff @(posedge clk) begin
		input_reg[0:(NUM_OF_WORDS-1)] = Input;
		input_reg[NUM_OF_WORDS:(POWER-1)] = '{default:16'h0000};
	end

	always @(posedge clk) begin
		for (int i = 0; i < POWER; i++) begin
			$display("x_input[%0d] = %0h", i, x_input[i]);
			$display("x_input[%0d] = %0h", i, input_reg[i]);
			$display("input_reg[%0d] = %0h", i, input_reg[i]);
		end
	end

	generate
		for(j = 0; j < (POWER/2); j++) begin
			assign x_input[j] = input_reg[2 * j];
			assign x_input[j + (POWER/2)] = input_reg[(2 * j) + 1];
		end
	endgenerate	

	assign Output = x_input;

endmodule
