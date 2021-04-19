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
// Revision 0.03 - added FFT blocks and other functions
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

package fft_package;

	real pi_const = 3.14159265;

	// from internet // Direct Programming Interface

  	//import dpi task      C Name = SV function name

  	import "DPI-C" pure function real cos (input real rTheta);

 	import "DPI-C" pure function real sin (input real rTheta);

  	// import "DPI" pure function real log (input real rVal);

  	// import "DPI" pure function real log10 (input real rVal);

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

	function complex_t calc_weight(input int n, input int Nt);
		complex_t res;
		real temp = real'(-2 * pi_const) * real'(n) / real'(Nt);
		$display("For n = %0d, N = %0d : temp = %0f, Re = %0f, Im = %0f", n, Nt, temp, cos(temp), sin(temp));
		res.Re = cos(temp); // * FRAC 
		res.Im = sin(temp); // * FRAC
		return res;
	endfunction : calc_weight

endpackage : fft_package


import fft_package::*;


module fft_block#(
		parameter STAGE = 0,
		parameter INPUT_NUM = 2 ** (STAGE+1)
	)(
		input logic clk,
		input logic reset,
		input complex_t Input [INPUT_NUM],
		output complex_t Output [INPUT_NUM]
	);

	// typedef so that function can return whole array
	typedef complex_t w_t [INPUT_NUM/2];

	complex_t buffer [INPUT_NUM]; 
	const w_t weights = fill_weights(); // constant values // need immidiate assignment

	function w_t fill_weights();
		for (int j = 0; j < (INPUT_NUM/2); j++) begin 
			fill_weights[j] = calc_weight(j, INPUT_NUM); // returned array
		end
	endfunction : fill_weights

	// two stage calculation => two clock cycles to complete one transfer 
	always_ff @(posedge clk) begin
		for (int i = 0; i < (INPUT_NUM/2); i++) begin
			buffer[i] <= add_comp(Input[i], Input[i + (INPUT_NUM/2)]);
			buffer[i + (INPUT_NUM/2)] <= sub_comp(Input[i], Input[i + (INPUT_NUM/2)]);
			Output[i] <= buffer[i];
			Output[i + (INPUT_NUM/2)] <= mult_comp(buffer[i + (INPUT_NUM/2)], weights[i]); 
		end
	end

endmodule : fft_block


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

	// complex_t cont = calc_weight(0, 8);
	// complex_t cont1 = calc_weight(1, 8);
	// complex_t cont2 = calc_weight(2, 8);
	// complex_t cont3 = calc_weight(3, 8);

	fft_block #(.STAGE(0)) block0(
		.clk,
		.reset,
		.Input(x_input[0:1]),
		.Output(output_reg[0:1])
	);

	fft_block #(.STAGE(0)) block1(
		.clk,
		.reset,
		.Input(x_input[2:3]),
		.Output(output_reg[2:3])
	);

	fft_block #(.STAGE(0)) block2(
		.clk,
		.reset,
		.Input(x_input[4:5]),
		.Output(output_reg[4:5])
	);

	fft_block #(.STAGE(0)) block3(
		.clk,
		.reset,
		.Input(x_input[6:7]),
		.Output(output_reg[6:7])
	);

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

	// always_ff @(posedge clk) begin
	// 	for (int j = 0; j < POWER; j++) begin
	// 		output_reg[j] <= x_input[j];
	// 	end
	// end

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

endmodule : butterfly_beh
