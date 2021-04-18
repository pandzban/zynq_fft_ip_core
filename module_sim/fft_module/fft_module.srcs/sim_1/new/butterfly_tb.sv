`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2021 20:38:47
// Design Name: 
// Module Name: butterfly_tb
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


class Input_vector;
	rand bit [15:0] x_input [5];
endclass : Input_vector

import fft_package::*;

module butterfly_tb;
	logic clk;
	logic reset;
	logic [15:0] Input [5];
	logic [15:0] Output [8];
	Input_vector input_rand;

	butterfly_beh uut(
	   .clk,
	   .reset,
	   .Input,
	   .Output
	);

	initial begin
		clk = 0;
		reset = 0;
		input_rand = new();
		input_rand.randomize();
		foreach(Input[i]) begin
			Input[i] = input_rand.x_input[i];
		end
		clk = 0;
		#5;
		clk = 1;
		#5;
		clk = 0;
		#5;
		clk = 1;
		#5;
		clk = 0;
		#5;
		clk = 1;
		$finish;
	end

endmodule
