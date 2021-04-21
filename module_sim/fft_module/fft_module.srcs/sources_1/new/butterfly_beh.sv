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

	parameter DEFAULT_INPUTS = 6;

	parameter M = 6;	// integer part
	parameter F = 10;	// fractional part

	parameter DEFAULT_OUTPUTS = 2**($clog2(DEFAULT_INPUTS-1));

	 // Direct Programming Interface
  	//import dpi task      C Name = SV function name
  	import "DPI-C" pure function real cos (input real rTheta);
 	import "DPI-C" pure function real sin (input real rTheta);
  	// import "DPI-C" pure function real log (input real rVal);
  	// import "DPI-C" pure function real log10 (input real rVal);

	typedef struct packed{
		logic [M-1:-F] Re;
		logic [M-1:-F] Im;
	} complex_t;

	typedef struct packed{
		logic [(2*M)-1:-(2*F)] Re;
		logic [(2*M)-1:-(2*F)] Im;
	} complex_mul_res_t;

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

	// function automatic complex_t mult_comp(input complex_t a, complex_t b);
	// 	complex_t res;
	// 	res.Re = (a.Re * b.Re) - ((a.Im * b.Im));
	// 	res.Im = (a.Re * b.Im) + ((a.Im * b.Re);
	// 	return res;
	// endfunction : mult_comp

	function automatic complex_t mult_comp(input complex_t a, complex_t b);
		complex_mul_res_t temp;
		complex_t res;
		temp.Re = ((a.Re * b.Re) >> F) - ((a.Im * b.Im) >> F);
		temp.Im = ((a.Re * b.Im) >> F) + ((a.Im * b.Re) >> F);
		res.Re = temp.Re;
		res.Im = temp.Im;
		return res;
	endfunction : mult_comp

	function complex_t calc_weight(input int n, input int Nt);
		complex_t res;
		real temp = real'(-2 * pi_const) * real'(n) / real'(Nt);
		$display("For n = %0d, N = %0d : temp = %0f, Re = %0f, Im = %0f", n, Nt, temp, cos(temp), sin(temp));
		res.Re = cos(temp) * (2**F); // * 2^FRAC 
		res.Im = sin(temp) * (2**F); // * 2^FRAC
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
		parameter NUM_OF_WORDS = DEFAULT_INPUTS,
		parameter POWER = 2**($clog2(NUM_OF_WORDS-1)),
		parameter NUM_OF_STAGES = $clog2(NUM_OF_WORDS-1),
		parameter BUFF_DELAY = 5
	)(
		input logic clk,
		input logic reset,
		input logic [M-1:-F] Input [NUM_OF_WORDS],
		// output logic [M-1:-F] Output [POWER]
		output complex_t Output [POWER]
	);

	logic [M-1:-F] input_real [POWER];
	logic [M-1:-F] zero_reg = 16'h0000;	// for zero padd
	complex_t input_reg [POWER];		// complex input			
	complex_t internal_reg [NUM_OF_STAGES+1+BUFF_DELAY][POWER]; 	// internal memory
	complex_t output_reg [POWER];
	//complex_t buffer_reg [BUFF_DELAY][POWER];

	// zero padding
	always_comb begin
		input_real[0:(POWER-1)] = '{default:16'h0000};
		input_real[0:(NUM_OF_WORDS-1)] = Input;
		//input_real[NUM_OF_WORDS:(POWER-1)] = '{default:16'h0000};
	end

	// real to complex values
	always_ff @(posedge clk) begin 
		for (int j = 0; j < POWER; j++) begin
			input_reg[j].Re <= input_real[j];
			input_reg[j].Im <= zero_reg;
		end
	end

	// rearrange input
	for (genvar j = 0; j < (POWER/2); j++) begin
		assign internal_reg[0][j] = input_reg[2 * j];
		assign internal_reg[0][j + (POWER/2)] = input_reg[(2 * j) + 1];
	end

	// generation of fft internal blocks and their connections
	for (genvar j = 0; j < NUM_OF_STAGES; j++) begin 
		for (genvar k = 0; k < 2**j; k++) begin
			fft_block #(.STAGE(NUM_OF_STAGES-j-1)) fft_block_inst(
				.clk,
				.reset,
				.Input(internal_reg[NUM_OF_STAGES-j-1][k*POWER/(2**j):((k+1)*POWER/(2**j))-1]),
				.Output(internal_reg[NUM_OF_STAGES-j][k*POWER/(2**j):((k+1)*POWER/(2**j))-1])
			);
		end
	end

	// buffer registers
	always_ff @(posedge clk) begin
		for (int i = 0; i < BUFF_DELAY; i++) begin 	
			for (int k = 0; k < POWER; k++) begin
				internal_reg[i+NUM_OF_STAGES+1][k] <= internal_reg[i+NUM_OF_STAGES][k];  
			end
		end
	end

	// connect internal memory matrix to output registers
	always_ff @(posedge clk) begin
		for (int j = 0; j < POWER; j++) begin
			output_reg[j] <= internal_reg[NUM_OF_STAGES+BUFF_DELAY][j];
		end
	end

	// only real outputs? -- for now
	for (genvar j = 0; j < POWER; j++) begin
		//assign Output[j] = output_reg[j].Re;
		assign Output[j] = output_reg[j];
	end

	initial begin
		$display("NUM_OF_WORDS = %0d, POWER = %0d, NUM_OF_STAGES = %0d", NUM_OF_WORDS, POWER, NUM_OF_STAGES);
	end

endmodule : butterfly_beh
