`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH University of Science and Technology in Krakow
// Engineers: Adam Gawlik & Dominique Rozycki
// 
// Create Date: 27.04.2021 01:02:41
// Design Name: Block for parallel calculations of FFT using Cooley-Tukey algorithm
// Module Name: fft_block_rtl
// Project Name: Gawlik-Rozycki Fast Fourier Transform IP-Core
// Target Devices: Zynq 7000 for Zedboard
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import fft_package::*;


  // Changes sign of 16 bit word in U2
 // 1 clock cycle delay
// takes 1 clk cycle to reset

module change_sign_rtl(
		input logic clk,
		input logic reset,
		input word_t in,
		output word_t result
	);

	word_t inv_res;
	word_t inc_res;

	always_comb begin 
		inv_res = ~in;
		inc_res = inv_res + 1;
	end

	always_ff @(posedge clk) begin
		if(reset) begin
			result <= 0;
		end else begin
			result <= inc_res;
		end
	end	

endmodule : change_sign_rtl


  // multiplies two 16-bit words with sign
 // 3 clock cycles delay
// takes 3 clk cycles to reset

module s_mult_rtl(
		input logic clk,
		input logic reset,
		input word_t a,
		input word_t b,
		output word_t result
    );

    logic sign_a;
    logic sign_b;
    logic sign_xor;
    logic sign_res;

    word_t a_neg_reg;
    word_t a_reg;
    word_t b_neg_reg;
    word_t b_reg;

    word_t a_fact;
    word_t b_fact;

    long_word_t res_full;
    word_t res;
    word_t res_neg_reg;
    word_t res_reg;

    change_sign_rtl change_sign_inst_a(
    	.clk,
    	.reset,
    	.in(a),
    	.result(a_neg_reg)
    );

    change_sign_rtl change_sign_inst_b(
    	.clk,
    	.reset,
    	.in(b),
    	.result(b_neg_reg)
    );

    change_sign_rtl change_sign_inst_res(
    	.clk,
    	.reset,
    	.in(res),
    	.result(res_neg_reg)
    );

    assign res_full = a_fact * b_fact;
    assign res = res_full[M:-F];
    assign result = sign_res ? res_neg_reg : res_reg;

    always_ff @(posedge clk) begin
		sign_xor <= sign_a ^ sign_b;
		sign_res <= sign_xor;
    	a_reg <= a;
    	b_reg <= b;
    	res_reg <= res;

    	if (reset) begin 
    		sign_a <= 1'b0;
    		sign_b <= 1'b0;
    	end else begin 
    		sign_a <= a[SIGN];
    		sign_b <= b[SIGN];
    	end

    	if (reset) begin 
    		a_fact <= 0;
    	end else if (sign_a) begin 
    		a_fact <= a_neg_reg;
    	end else begin 
    		a_fact <= a_reg;
    	end

    	if (reset) begin 
    		b_fact <= 0;
    	end else if (sign_b) begin 
    		b_fact <= b_neg_reg;
    	end else begin
    		b_fact <= b_reg;
    	end
    end

endmodule : s_mult_rtl


   // Multiplies two complex numbers
  // version without output reg
 // 3 clock cycles delay
// takes less than 3 clk cycles to reset

// module comp_mult_rtl(
// 		input logic clk,
// 		input logic reset,
// 		input complex_t a,
// 		input complex_t b,
// 		output complex_t result
//     );

// 	word_t mult_res_0;
// 	word_t mult_res_1;
// 	word_t mult_res_2;
// 	word_t mult_res_3;
	
// 	s_mult_rtl a_Re_b_Re_cmult(
// 		.clk,
// 		.reset,
// 		.a(a.Re),
// 		.b(b.Re),
// 		.result(mult_res_0)
// 	);

// 	s_mult_rtl a_Im_b_Im_cmult(
// 		.clk,
// 		.reset,
// 		.a(a.Im),
// 		.b(b.Im),
// 		.result(mult_res_1)
// 	);

// 	s_mult_rtl a_Re_b_Im_cmult(
// 		.clk,
// 		.reset,
// 		.a(a.Re),
// 		.b(b.Im),
// 		.result(mult_res_2)
// 	);

// 	s_mult_rtl a_Im_b_Re_cmult(
// 		.clk,
// 		.reset,
// 		.a(a.Im),
// 		.b(b.Re),
// 		.result(mult_res_3)
// 	);

// 	assign result.Re = mult_res_0 - mult_res_1;
// 	assign result.Im = mult_res_2 + mult_res_3;
	
// endmodule : comp_mult_rtl


   // Multiplies two complex numbers
  // version with output reg
 // 4 clock cycles delay
// takes less than 4 clk cycles to reset

module comp_mult_rtl(
		input logic clk,
		input logic reset,
		input complex_t a,
		input complex_t b,
		output complex_t result
    );

	word_t mult_res_0;
	word_t mult_res_1;
	word_t mult_res_2;
	word_t mult_res_3;
	complex_t res;
	
	s_mult_rtl a_Re_b_Re_cmult(
		.clk,
		.reset,
		.a(a.Re),
		.b(b.Re),
		.result(mult_res_0)
	);

	s_mult_rtl a_Im_b_Im_cmult(
		.clk,
		.reset,
		.a(a.Im),
		.b(b.Im),
		.result(mult_res_1)
	);

	s_mult_rtl a_Re_b_Im_cmult(
		.clk,
		.reset,
		.a(a.Re),
		.b(b.Im),
		.result(mult_res_2)
	);

	s_mult_rtl a_Im_b_Re_cmult(
		.clk,
		.reset,
		.a(a.Im),
		.b(b.Re),
		.result(mult_res_3)
	);

	assign res.Re = mult_res_0 - mult_res_1;
	assign res.Im = mult_res_2 + mult_res_3;
	
	always_ff @(posedge clk) begin
		if(reset) begin
			result <= 0;
		end else begin
			result <= res;
		end
	end

endmodule : comp_mult_rtl


   // Computes parallely two complex values at one cycle
  // includes multiplication with phase factors
 // 5 clock cycles delay for comp_mult_rtl with output reg
// takes less than 5 clk cycles to reset

module fft_block_rtl#(
		parameter BUFF_SIZE = 4 // num of cycles that comp_mult_rtl takes to transfer data
	)(
		input logic clk,
		input logic reset,
		input complex_t first,
		input complex_t second,
		input complex_t phase_factor,
		output complex_t first_out,
		output complex_t second_out
	);


	complex_t mult_fact1;
	complex_t mult_fact2;
	complex_t mult_res;
	complex_t first_input_buff[BUFF_SIZE];
	complex_t zero_reg = 0;
	complex_t sum_res;
	complex_t diff_res;

	 comp_mult_rtl complex_multiply_inst(
		.clk,
		.reset,
		.a(mult_fact1),
		.b(mult_fact2),
		.result(mult_res)
	);

	assign mult_fact1 = reset ? zero_reg : second;
	assign mult_fact2 = reset ? zero_reg : phase_factor;

	always_ff @(posedge clk) begin 

		if (reset) begin 
			first_input_buff[0] <= 0;
		end else begin 
			first_input_buff[0] <= first;
		end 

		for (int i = 1; i < BUFF_SIZE; i++) begin 
			first_input_buff[i] <= first_input_buff[i-1];
		end

		if (reset) begin
			first_out <= 0;;
			second_out <= 0;
		end else begin
			first_out <= sum_res;
			second_out <= diff_res;
		end
	end
	
	assign sum_res = first_input_buff[BUFF_SIZE-1] + mult_res;
	assign diff_res = first_input_buff[BUFF_SIZE-1] - mult_res;

endmodule : fft_block_rtl


   // Computes parallely two complex values at one cycle
  // without multiplication ~ first stage only
 // 5 clock cycles delay for comp_mult_rtl with output reg
// takes less than 5 clk cycles to reset

module fft_block_simplified_rtl#(
		parameter BUFF_SIZE = 4 // num of cycles that comp_mult_rtl takes to transfer data
	)(
		input logic clk,
		input logic reset,
		input complex_t first,
		input complex_t second,
		input complex_t phase_factor,
		output complex_t first_out,
		output complex_t second_out
	);

	complex_t first_input_buff[BUFF_SIZE];
	complex_t second_input_buff[BUFF_SIZE];
	complex_t sum_res;
	complex_t diff_res;

	always_ff @(posedge clk) begin 

		if (reset) begin 
			first_input_buff[0] <= 0;
			second_input_buff[0] <= 0;
		end else begin 
			first_input_buff[0] <= first;
			second_input_buff[0] <= second;
		end 

		for (int i = 1; i < BUFF_SIZE; i++) begin 
			first_input_buff[i] <= first_input_buff[i-1];
			second_input_buff[i] <= second_input_buff[i-1];
		end

		if (reset) begin
			first_out <= 0;;
			second_out <= 0;
		end else begin
			first_out <= sum_res;
			second_out <= diff_res;
		end
	end
	
	assign sum_res = first_input_buff[BUFF_SIZE-1] + second_input_buff[BUFF_SIZE-1];
	assign diff_res = first_input_buff[BUFF_SIZE-1] - second_input_buff[BUFF_SIZE-1];

endmodule : fft_block_simplified_rtl


// for rtl simulation purposes // don't use inside other modules

module fft_wrap(
		input logic clk,
		input logic reset,
		input logic [31:0] first,
		input logic [31:0] phase_factor,
		input logic [31:0] second,
		output logic [31:0] first_out,
		output logic [31:0] second_out
	);
	
	 fft_block_rtl uut(
		.clk,
		.reset,
		.first,
		.phase_factor,
		.second,
		.first_out,
		.second_out
	);

endmodule : fft_wrap