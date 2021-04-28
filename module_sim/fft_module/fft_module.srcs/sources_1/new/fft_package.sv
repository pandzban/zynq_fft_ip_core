`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2021 16:30:56
// Design Name: 
// Module Name: fft_package
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
	real pi_const = 3.14159265;

	parameter DEFAULT_INPUTS = 16;

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
endpackage

//module fft_package();
//endmodule
