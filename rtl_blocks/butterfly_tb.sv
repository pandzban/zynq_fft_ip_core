`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH University of Science and Technology in Krakow
// Engineers: Adam Gawlik & Dominique Rozycki
// 
// Create Date: 27.04.2021 01:02:41
// Design Name: Simulation of parallel calculations of FFT using Cooley-Tukey algorithm
// Module Name: butterfly_tb
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


// change_sign simulation - uncomment to test module

// class Input_vector;
// 	rand bit [10-1:-6] x_input [10];
// 	// constraint input_cstr {
// 	// 	foreach (x_input[i]){
// 	// 		x_input[i][M-1:0] == 0; // below 1.0
// 	// 	}
// 	// }
// endclass : Input_vector

// // `include "fft_package.sv"
// import fft_package::*;

// module butterfly_tb;
//     parameter NUM_OF_VECTORS = 3;
// 	logic clk;
// 	logic reset;
// 	Input_vector input_rand;
// 	logic [10-1:-6] Input;
// 	logic [10-1:-6] Output;
// 	parameter SIM_TIME = 20;	// in clk cycles

// 	task delay(input int value);
//     	for (int i = 0; i < value; i++) begin 
//     		#5;
// 		    clk = ~clk;
//         	#5;
//         	clk = ~clk;
//     	end  
//  	endtask
    
//     initial begin
// 		clk = 0;
// 		Input = 0;
// 		reset = 0;
// 		delay(1);
// 		reset = 1;
// 		delay(10);
// 		reset = 0;
// 		delay(1);
// 		input_rand = new();
// 		input_rand.randomize();
// 		foreach(Input[i]) begin
// 			#4;
// 			Input = input_rand.x_input[i]; 
// 			#1;
//         	clk = ~clk;
//         	#5;
//         	clk = ~clk;

// 		end
// 		$finish;
// 	end
    
//  //    initial begin 
// 	// 	for (int i = 0; i < SIM_TIME; i++) begin 
// 	// 		@(posedge clk);
// 	// 	end
// 	// 	$finish;
// 	// end
    
//     //Clock
//  //    always begin
//  //        #5; 
//  //        clk = ~clk;
// 	// end


// 	change_sign_rtl uut(
// 	    .clk,
// 	    .reset,
// 		.in(Input),
// 		.result(Output)
// 	);

// endmodule


// s_mult_rtl - uncomment to test module

// class Input_vector;
// 	rand bit [6-1:-10] x_input [10];
// 	rand bit [6-1:-10] y_input [10];
// 	constraint input_cstr {
// 		// foreach (x_input[i]){
// 		// 	x_input[i][M-2:3] > -4; // below 1.0
// 		// }
// 		// foreach (y_input[i]){
// 		// 	y_input[i][M-2:3] == 0; // below 1.0
// 		// }
// 		foreach (x_input[i]){
// 			x_input[i] > -4; // below 1.0
// 			x_input[i] < 4;
// 		}
// 		foreach (y_input[i]){
// 			y_input[i] > -4; // below 1.0
// 			y_input[i] < 4;
// 		}
// 	}
// endclass : Input_vector

// // `include "fft_package.sv"
// import fft_package::*;

// module butterfly_tb;
//     parameter NUM_OF_VECTORS = 3;
// 	logic clk;
// 	logic reset;
// 	Input_vector input_rand;
// 	logic [6-1:-10] Input_a;
// 	logic [6-1:-10] Input_b;
// 	real a_real[] = {2.4, -1, 0.15, 1.43, 0, 0.85};
// 	real b_real[] = {0.5, -1.56, -0.78, -1.43, 0, 2.95};
// 	logic [6-1:-10] Output;
// 	parameter SIM_TIME = 20;	// in clk cycles

// 	task delay(input int value);
//     	for (int i = 0; i < value; i++) begin 
//     		#5;
// 		    clk = ~clk;
//         	#5;
//         	clk = ~clk;
//     	end  
//  	endtask
    
//  	function logic [15:0] to_fix(input real re);
//  		return re * (2**F);
//  	endfunction

//     initial begin
// 		clk = 0;
// 		Input_a = 16'h0fff;
// 		Input_b = 16'h0fff;
// 		reset = 0;
// 		delay(4);
// 		reset = 1;
// 		delay(4);
// 		reset = 0;
// 		delay(1);
// 		Input_a = 0;
// 		Input_b = 0;
// 		delay(1);
// 		// input_rand = new();
// 		// input_rand.randomize();
// 		foreach(a_real[i]) begin
// 			#2;
// 			Input_a = to_fix(a_real[i]);
// 			Input_b = to_fix(b_real[i]); 
// 			$display("correct: %0f", a_real[i] * b_real[i]);
// 			#3;
//         	clk = ~clk;
//         	#5;
//         	clk = ~clk;

//   		end

// 		delay(5);
// 		$finish;
// 	end

// 	s_mult_rtl uut(
// 		.clk,
// 		.reset,
// 		.a(Input_a),
// 		.b(Input_b),
// 		.result(Output)
// 	);

// endmodule


// comp_mult_rtl simulation - uncomment to test module

// class Input_vector;
// 	rand bit [6-1:-10] x_input [10];
// 	rand bit [6-1:-10] y_input [10];
// 	constraint input_cstr {
// 		// foreach (x_input[i]){
// 		// 	x_input[i][M-2:3] > -4; // below 1.0
// 		// }
// 		// foreach (y_input[i]){
// 		// 	y_input[i][M-2:3] == 0; // below 1.0
// 		// }
// 		foreach (x_input[i]){
// 			x_input[i] > -4; // below 1.0
// 			x_input[i] < 4;
// 		}
// 		foreach (y_input[i]){
// 			y_input[i] > -4; // below 1.0
// 			y_input[i] < 4;
// 		}
// 	}
// endclass : Input_vector

// // `include "fft_package.sv"
// import fft_package::*;

// module butterfly_tb;
//     parameter NUM_OF_VECTORS = 3;
// 	logic clk;
// 	logic reset;
// 	Input_vector input_rand;
// 	complex_t Input_a;
// 	complex_t Input_b;
// 	real a_real[] = {-2.4, -1, -0.15, 1.43, 0, 0.85};
// 	real a_imag[] = {0.4, 0.1, 0.356, -1.02, -0.165, -0.85};
// 	real b_imag[] = {0.5, -1.56, 0.78, -1.43, 0, 2.95};
// 	real b_real[] = {1.3, 0.56, -0.23, -0.96, 0.21, -0.15};
// 	real result[2];
// 	complex_t Output;
// 	parameter SIM_TIME = 20;	// in clk cycles

// 	task delay(input int value);
//     	for (int i = 0; i < value; i++) begin 
//     		#5;
// 		    clk = ~clk;
//         	#5;
//         	clk = ~clk;
//     	end  
//  	endtask
//     typedef struct packed{
// 		logic [M-1:-F] Re;
// 		logic [M-1:-F] Im;
// 	} complex_t;

// 	function mult_comp(input real a_re, input real a_im,
// 								 input real b_re, input real b_im, output real res[2]);
// 		res[0] = (a_re * b_re) - (a_im * b_im);
// 		res[1] = (a_re * b_im) + (a_im * b_re);
// 	endfunction
    
//  	function logic [15:0] to_fix(input real re);
//  		return re * (2**F);
//  	endfunction

//  	comp_mult_rtl uut(
// 		.clk,
// 		.reset,
// 		.a(Input_a),
// 		.b(Input_b),
// 		.result(Output)
// 	);

//     initial begin
// 		clk = 0;
// 		Input_a = 32'h0fff_ffff;
// 		Input_b = 32'h0fff_ffff;
// 		reset = 0;
// 		delay(5);
// 		reset = 1;
// 		delay(5);
// 		reset = 0;
// 		delay(2);
// 		Input_a = 0;
// 		Input_b = 0;
// 		delay(2);
// 		// input_rand = new();
// 		// input_rand.randomize();
// 		foreach(a_real[i]) begin
// 			#2;
// 			Input_a.Re = to_fix(a_real[i]);
// 			Input_a.Im = to_fix(a_imag[i]);
// 			Input_b.Re = to_fix(b_real[i]); 
// 			Input_b.Im = to_fix(b_imag[i]);
// 			mult_comp(a_real[i], a_imag[i], b_real[i], b_imag[i], result);
// 			$display("correct: Re = %0f, Im = %0f", result[0], result[1]);
// 			#3;
//         	clk = ~clk;
//         	#5;
//         	clk = ~clk;

//   		end

// 		delay(5);
// 		$finish;
// 	end

// endmodule


// fft_block_rtl simulation - uncomment to test module

class Input_vector;
	rand bit [6-1:-10] x_input [10];
	rand bit [6-1:-10] y_input [10];
	constraint input_cstr {
		// foreach (x_input[i]){
		// 	x_input[i][M-2:3] > -4; // below 1.0
		// }
		// foreach (y_input[i]){
		// 	y_input[i][M-2:3] == 0; // below 1.0
		// }
		foreach (x_input[i]){
			x_input[i] > -4; // below 1.0
			x_input[i] < 4;
		}
		foreach (y_input[i]){
			y_input[i] > -4; // below 1.0
			y_input[i] < 4;
		}
	}
endclass : Input_vector

// `include "fft_package.sv"
import fft_package::*;

module butterfly_tb;
    parameter NUM_OF_VECTORS = 3;
	logic clk;
	logic reset;
	Input_vector input_rand;
	complex_t Input_a;
	complex_t Phase_fact;
	complex_t Input_b;
	real a_real[] = {-2.4, -1, -0.15, 1.43, 0, 0.85};
	real a_imag[] = {0.4, 0.1, 0.356, -1.02, -0.165, -0.85};
	real p_real[] = {-0.4, -0.24, 0.28, 1.01, 1.5, 0};
	real p_imag[] = {0.1, -0.13, -0.356, 1.06, -0.165, 0.23};
	real b_imag[] = {0.5, -1.56, 0.78, -1.43, 0, 2.95};
	real b_real[] = {1.3, 0.56, -0.23, -0.96, 0.21, -0.15};
	real result[4];
	complex_t Output[2];
	parameter SIM_TIME = 20;	// in clk cycles

	task delay(input int value);
    	for (int i = 0; i < value; i++) begin 
    		#5;
		    clk = ~clk;
        	#5;
        	clk = ~clk;
    	end  
 	endtask

    typedef struct packed{
		logic [M-1:-F] Re;
		logic [M-1:-F] Im;
	} complex_t;

	function mult_comp(input real a_re, input real a_im,
								 input real b_re, input real b_im, output real res[2]);
		res[0] = (a_re * b_re) - (a_im * b_im);
		res[1] = (a_re * b_im) + (a_im * b_re);
	endfunction


	function fft(input real a_real, real a_imag, real phase_real, real phase_imag, real b_real,
				 real b_imag, output real out1[2], output real out2[2]);
		real temp[2];
		mult_comp(b_real, b_imag, phase_real, phase_imag, temp);
		// $display("a: Re = %0f, Im = %0f; phase: Re = %0f, Im = %0f", a_real, a_imag, phase_real, phase_imag);
		// $display("mult result: Re = %0f, Im = %0f", temp[0], temp[1]);
		out1[0] = a_real + temp[0];
		out1[1] = a_imag + temp[1];
		out2[0] = a_real - temp[0];
		out2[1] = a_imag - temp[1];
	endfunction

	// function fft(input real a[2], input real phase[2], input real b[2],
	// 			output real out1[2], output real out2[2]);
	// 	real temp[2];
	// 	mult_comp(a[0], a[1], phase[0], phase[1], temp);
	// 	out1[0] = temp[0] - b[0];
	// 	out1[1] = temp[1] - b[1];
	// 	out2[0] = temp[0] + b[0];
	// 	out2[0] = temp[1] + b[1];
	// endfunction
    
 	function logic [15:0] to_fix(input real re);
 		return re * (2**F);
 	endfunction

 	fft_wrap uut(
		.clk,
		.reset,
		.first(Input_a),
		.phase_factor(Phase_fact),
		.second(Input_b),
		.first_out(Output[0]),
		.second_out(Output[1])
	);

    initial begin
		clk = 0;
		Input_a = 32'h0f5f_05ff;
		Input_b = 32'h0f3f_00ff;
		Phase_fact = 32'h0f0f_03ff;
		reset = 0;
		delay(6);
		reset = 1;
		delay(6);
		reset = 0;
		Input_a = 0;
		Input_b = 0;
		Phase_fact = 0;
		delay(1);
		reset = 0;
		delay(2);
		// input_rand = new();
		// input_rand.randomize();
		foreach(a_real[i]) begin
			#2;
			Input_a.Re = to_fix(a_real[i]);
			Input_a.Im = to_fix(a_imag[i]);
			Input_b.Re = to_fix(b_real[i]); 
			Input_b.Im = to_fix(b_imag[i]);
			Phase_fact.Re = to_fix(p_real[i]);
			Phase_fact.Im = to_fix(p_imag[i]);
			fft(a_real[i], a_imag[i], p_real[i], p_imag[i], b_real[i], b_imag[i], 
				result[0:1], result[2:3]);
			//mult_comp(a_real[i], a_imag[i], b_real[i], b_imag[i], result);
			$display("correct: res1: Re = %0f, Im = %0f;   res2: Re = %0f, Im = %0f", 
						result[0], result[1], result[2], result[3]);
			#3;
        	clk = ~clk;
        	#5;
        	clk = ~clk;

  		end

		delay(5);
		$finish;
	end

endmodule


//  fft_block_simplified_rtl simulation

// class Input_vector;
// 	rand bit [6-1:-10] x_input [10];
// 	rand bit [6-1:-10] y_input [10];
// 	constraint input_cstr {
// 		// foreach (x_input[i]){
// 		// 	x_input[i][M-2:3] > -4; // below 1.0
// 		// }
// 		// foreach (y_input[i]){
// 		// 	y_input[i][M-2:3] == 0; // below 1.0
// 		// }
// 		foreach (x_input[i]){
// 			x_input[i] > -4; // below 1.0
// 			x_input[i] < 4;
// 		}
// 		foreach (y_input[i]){
// 			y_input[i] > -4; // below 1.0
// 			y_input[i] < 4;
// 		}
// 	}
// endclass : Input_vector

// // `include "fft_package.sv"
// import fft_package::*;

// module butterfly_tb;
//     parameter NUM_OF_VECTORS = 3;
// 	logic clk;
// 	logic reset;
// 	Input_vector input_rand;
// 	complex_t Input_a;
// 	complex_t Phase_fact;
// 	complex_t Input_b;
// 	real a_real[] = {-2.4, -1, -0.15, 1.43, 0, 0.85};
// 	real a_imag[] = {0.4, 0.1, 0.356, -1.02, -0.165, -0.85};
// 	real p_real[] = {-0.4, -0.24, 0.28, 1.01, 1.5, 0};
// 	real p_imag[] = {0.1, -0.13, -0.356, 1.06, -0.165, 0.23};
// 	real b_imag[] = {0.5, -1.56, 0.78, -1.43, 0, 2.95};
// 	real b_real[] = {1.3, 0.56, -0.23, -0.96, 0.21, -0.15};
// 	real result[4];
// 	complex_t Output[2];
// 	parameter SIM_TIME = 20;	// in clk cycles

// 	task delay(input int value);
//     	for (int i = 0; i < value; i++) begin 
//     		#5;
// 		    clk = ~clk;
//         	#5;
//         	clk = ~clk;
//     	end  
//  	endtask

//     typedef struct packed{
// 		logic [M-1:-F] Re;
// 		logic [M-1:-F] Im;
// 	} complex_t;

// 	function mult_comp(input real a_re, input real a_im,
// 								 input real b_re, input real b_im, output real res[2]);
// 		res[0] = (a_re * b_re) - (a_im * b_im);
// 		res[1] = (a_re * b_im) + (a_im * b_re);
// 	endfunction


// 	function fft(input real a_real, real a_imag, real phase_real, real phase_imag, real b_real,
// 				 real b_imag, output real out1[2], output real out2[2]);
// 		// $display("a: Re = %0f, Im = %0f; phase: Re = %0f, Im = %0f", a_real, a_imag, phase_real, phase_imag);
// 		// $display("mult result: Re = %0f, Im = %0f", temp[0], temp[1]);
// 		out1[0] = a_real + b_real;
// 		out1[1] = a_imag + b_imag;
// 		out2[0] = a_real - b_real;
// 		out2[1] = a_imag - b_imag;
// 	endfunction

// 	// function fft(input real a[2], input real phase[2], input real b[2],
// 	// 			output real out1[2], output real out2[2]);
// 	// 	real temp[2];
// 	// 	mult_comp(a[0], a[1], phase[0], phase[1], temp);
// 	// 	out1[0] = temp[0] - b[0];
// 	// 	out1[1] = temp[1] - b[1];
// 	// 	out2[0] = temp[0] + b[0];
// 	// 	out2[0] = temp[1] + b[1];
// 	// endfunction
    
//  	function logic [15:0] to_fix(input real re);
//  		return re * (2**F);
//  	endfunction

//  	fft_wrap uut(
// 		.clk,
// 		.reset,
// 		.first(Input_a),
// 		.phase_factor(Phase_fact),
// 		.second(Input_b),
// 		.first_out(Output[0]),
// 		.second_out(Output[1])
// 	);

//     initial begin
// 		clk = 0;
// 		Input_a = 32'h0f5f_05ff;
// 		Input_b = 32'h0f3f_00ff;
// 		Phase_fact = 32'h0f0f_03ff;
// 		reset = 0;
// 		delay(6);
// 		reset = 1;
// 		delay(6);
// 		reset = 0;
// 		Input_a = 0;
// 		Input_b = 0;
// 		Phase_fact = 0;
// 		delay(1);
// 		reset = 0;
// 		delay(2);
// 		// input_rand = new();
// 		// input_rand.randomize();
// 		foreach(a_real[i]) begin
// 			#2;
// 			Input_a.Re = to_fix(a_real[i]);
// 			Input_a.Im = to_fix(a_imag[i]);
// 			Input_b.Re = to_fix(b_real[i]); 
// 			Input_b.Im = to_fix(b_imag[i]);
// 			Phase_fact.Re = to_fix(p_real[i]);
// 			Phase_fact.Im = to_fix(p_imag[i]);
// 			fft(a_real[i], a_imag[i], p_real[i], p_imag[i], b_real[i], b_imag[i], 
// 				result[0:1], result[2:3]);
// 			//mult_comp(a_real[i], a_imag[i], b_real[i], b_imag[i], result);
// 			$display("correct: res1: Re = %0f, Im = %0f;   res2: Re = %0f, Im = %0f", 
// 						result[0], result[1], result[2], result[3]);
// 			#3;
//         	clk = ~clk;
//         	#5;
//         	clk = ~clk;

//   		end

// 		delay(5);
// 		$finish;
// 	end

// endmodule





