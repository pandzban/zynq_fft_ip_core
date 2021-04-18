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

package fft_package;

	typedef struct packed{
		logic [15:0] Re;
		logic [15:0] Im;
	} complex_t;

	function automatic complex_t add_comp(input complex_t a, complex_t b);
		complex_t res;
		res.Re = a.Re + b.Re;
		res.Im = a.Im + b.Im;
		return res;
	endfunction : add_comp

	function automatic complex_t sub_comp(input complex_t a, complex_t b);
		complex_t res;
		res.Re = a.Re - b.Re;
		res.Im = a.Im - b.Im;
		return res;
	endfunction : sub_comp

	function automatic complex_t mult_comp(input complex_t a, complex_t b);
		complex_t res;
		res.Re = (a.Re * b.Re) - (a.Im * b.Im);
		res.Im = (a.Re * b.Im) + (a.Im * b.Re);
		return res;
	endfunction : mult_comp

endpackage : fft_package


import fft_package::*;


module butterfly_beh#(
		parameter NUM_OF_WORDS = 5,
		parameter POWER = 2**($clog2(NUM_OF_WORDS))
	)(
		input logic clk,
		input logic reset,
		input logic [15:0] Input [NUM_OF_WORDS],
		output logic [15:0] Output [POWER]
	);

	complex_t input_reg [POWER];
	complex_t x_input [POWER];
	logic [15:0] input_real [POWER];
	complex_t output_reg [POWER];
	logic [15:0] zero_reg = 16'h0000;


	initial begin
		$display("POWER = %0d", POWER);
	end

	always_comb begin
		input_real[0:(NUM_OF_WORDS-1)] = Input;
		input_real[NUM_OF_WORDS:(POWER-1)] = '{default:16'h0000};
	end

	always_ff @(posedge clk) begin 
		for (int j = 0; j < POWER; j++) begin
			input_reg[j].Re <= input_real[j];
			input_reg[j].Im <= zero_reg;
		end
	end

	always_ff @(posedge clk) begin
		for (int j = 0; j < POWER; j++) begin
			output_reg[j] <= x_input[j];
		end
	end

	always @(posedge clk) begin
		for (int i = 0; i < POWER; i++) begin
			$display("x_input[%0d] = %0h", i, x_input[i]);
			$display("x_input[%0d] = %0h", i, input_reg[i]);
			$display("input_reg[%0d] = %0h", i, input_reg[i]);
		end
	end

	// rearrange input
	for(genvar j = 0; j < (POWER/2); j++) begin
		assign x_input[j] = input_reg[2 * j];
		assign x_input[j + (POWER/2)] = input_reg[(2 * j) + 1];
	end

	for (genvar j = 0; j < POWER; j++) begin
		assign Output[j] = output_reg[j].Re;
	end

endmodule
