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
	parameter SIGN = M-1;

	parameter DEFAULT_OUTPUTS = 2**($clog2(DEFAULT_INPUTS)); // -1

	 // Direct Programming Interface
  	//import dpi task      C Name = SV function name
  	import "DPI-C" pure function real cos (input real rTheta);
 	import "DPI-C" pure function real sin (input real rTheta);
  	// import "DPI-C" pure function real log (input real rVal);
  	// import "DPI-C" pure function real log10 (input real rVal);

	typedef logic [M-1:-F] word_t;
	typedef logic [(2*M)-1:-(2*F)] long_word_t;

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
		long_word_t tempw [4];
		complex_t res;

		tempw[0] = sign_mult(a.Re, b.Re);
		tempw[1] = sign_mult(a.Im, b.Im);
		tempw[2] = sign_mult(a.Re, b.Im);
		$display("tempw[2], a.Re = %0h, b.Im = %0h", a.Re, b.Im);
		tempw[3] = sign_mult(a.Im, b.Re);
		res.Re = tempw[0] - tempw[1];

		res.Im = tempw[2] + tempw[3];
		$display("tempw[2] = %0h, tempw[3] = %0h, res.Im = %0h", tempw[2], tempw[3], res.Im);
		return res;
	endfunction : mult_comp

	function automatic word_t sign_mult (input word_t a, word_t b);
		word_t atemp, btemp;
		logic signa = 0; logic signb = 0;
		long_word_t res;
		$display("BEGIN WITH a = %0b, b = %0b", a , b);
		$display("a[Sign] = %0h, b[Sign] = %0h",a[SIGN] , b[SIGN]);
		if (a[SIGN] == 1) begin
			atemp = change_sign(a);
			signa = 1;
		end else begin 
			atemp = a;
		end

		if (b[SIGN] == 1) begin
			btemp = change_sign(b);
			signb = 1;
		end else begin 
			btemp = b; 
		end

		res = (atemp * btemp) >> F;
		$display("signa = %0h, bsign = %0h, bool = %0h", signa, signb, signa ^ signb);
		if ((signa ^ signb)) begin
			res = change_sign(res);
		end

		$display("END WITH atemp = %0b, btemp = %0b", atemp , btemp);

		return res;
	endfunction : sign_mult

	function automatic word_t change_sign (input word_t a);
		word_t res;
		res = ~a + 1;
		return res;
	endfunction : change_sign

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
			buffer[i] <= Input[i];
			buffer[i + (INPUT_NUM/2)] <= mult_comp(Input[i + (INPUT_NUM/2)], weights[i]); // use BRAM
			Output[i] <= add_comp(buffer[i], buffer[i + (INPUT_NUM/2)]);
			Output[i + (INPUT_NUM/2)] <= sub_comp(buffer[i], buffer[i + (INPUT_NUM/2)]);  
		end
	end

endmodule : fft_block

module rearrange_n_zero_padd#(
		parameter NUM_OF_WORDS = DEFAULT_INPUTS,
		parameter POWER = 2**($clog2(NUM_OF_WORDS))
	)(
		input logic clk,
		input logic reset,
		input logic [M-1:-F] Input [NUM_OF_WORDS],
		output complex_t Output [POWER]
	);

	typedef complex_t arr_t [POWER];

	logic [M-1:-F] input_real [POWER];
	logic [M-1:-F] zero_reg = 16'h0000;	// for zero padd
	complex_t rearr_reg [POWER];

	// zero padding
	always_comb begin
		input_real[0:(POWER-1)] = '{default:16'h0000};
		input_real[0:(NUM_OF_WORDS-1)] = Input;
		//input_real[NUM_OF_WORDS:(POWER-1)] = '{default:16'h0000};
	end

	// real to complex values
	always_ff @(posedge clk) begin 
		for (int j = 0; j < POWER; j++) begin
			rearr_reg[j].Re <= input_real[j];
			rearr_reg[j].Im <= zero_reg;
		end
	end

	// bit reversal rearrange of input
	assign Output = rearrange(rearr_reg);

	function arr_t rearrange(input complex_t a[POWER]);
		complex_t temp[POWER] = a;
		complex_t tempx;
		int n1, n2, j, i;
		j = 0;
		n2 = POWER/2;
		for (i = 1; i < POWER -1; i++) begin 
			n1 = n2;
			while (j >= n1) begin 
				j = j -n1;
				n1 = n1/2;
			end
			j = j + n1;
			if (i < j) begin 
				tempx = temp[i];
			    temp[i] = temp[j];
			    temp[j] = tempx;
			end
		end
		return temp;
	endfunction : rearrange

endmodule : rearrange_n_zero_padd


module butterfly_beh#(
		parameter NUM_OF_WORDS = DEFAULT_INPUTS,
		parameter DATA_PROCESS_TIME = 8, 	// minimum (NUM_OF_STAGES*2) + 1
		parameter POWER = 2**($clog2(NUM_OF_WORDS)),
		parameter NUM_OF_STAGES = $clog2(NUM_OF_WORDS),
		parameter BUFF_DELAY = DATA_PROCESS_TIME - (NUM_OF_STAGES*2),
		parameter BUFF_LENG = (NUM_OF_STAGES*2)+1+BUFF_DELAY
	)(
		input logic clk,
		input logic reset,
		input logic valid_in,
		input logic [M-1:-F] Input [NUM_OF_WORDS],
		output logic valid_out,
		// output logic [M-1:-F] Output [POWER]
		output complex_t Output [POWER]
	);

	complex_t x_input [POWER];
	complex_t internal_reg [NUM_OF_STAGES+1+BUFF_DELAY][POWER]; 	// internal memory
	logic valid_reg [BUFF_LENG];
	complex_t output_reg [POWER];
	//complex_t buffer_reg [BUFF_DELAY][POWER];


	rearrange_n_zero_padd #(.NUM_OF_WORDS(NUM_OF_WORDS)) rearrange_inst(
		.clk,
		.reset,
		.Input,
		.Output(x_input)
	);

	always_ff @(posedge clk) begin
		for (int i = 0; i < BUFF_LENG-1; i++) begin
			valid_reg [i + 1] <= valid_reg[i];
			valid_reg [0] <= valid_in;
			valid_out <= valid_reg[BUFF_LENG-1];
		end
	end

	for (genvar j = 0; j < POWER; j++) begin
		assign internal_reg[0][j] = x_input[j];
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
