`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2021 17:28:59
// Design Name: 
// Module Name: rearrange_zero_padd
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

import fft_package::*;

module rearrange_zero_padd#(
		parameter NUM_OF_WORDS = DEFAULT_INPUTS,
		parameter POWER = 2**($clog2(NUM_OF_WORDS))
	)(
		input logic clk,
		input logic reset,
		input logic [M-1:-F] Input [NUM_OF_WORDS-1:0],
		output complex_t Output [POWER-1:0]
	);

	typedef complex_t arr_t [POWER-1:0];

	logic [M-1:-F] input_real [POWER-1:0];
	logic [M-1:-F] zero_reg = 16'h0000;	// for zero padd
	complex_t rearr_reg [POWER-1:0];

	// zero padding
	always_comb begin
		input_real[(POWER-1):0] = '{default:16'h0000};
		input_real[(NUM_OF_WORDS-1):0] = Input;
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

	function arr_t rearrange(input complex_t a[POWER-1:0]);
		complex_t temp[POWER-1:0] = a;
		complex_t tempx;
		int n1, n2, j, i;
		j = 0;
		n2 = POWER/2;
		for (i = 1; i < POWER -1; i++) begin 
			n1 = n2;
			while (j >= n1) begin 
				j = j - n1;
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

endmodule
