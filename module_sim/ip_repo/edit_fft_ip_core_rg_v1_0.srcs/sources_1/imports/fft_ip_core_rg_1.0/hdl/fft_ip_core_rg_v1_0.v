
`timescale 1 ns / 1 ps

	module fft_ip_core_rg_v1_0 #
	(
		// Users to add parameters here
        parameter integer NUMBER_OF_INPUT_WORDS  = 16,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32,

		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready,

		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output wire  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid
	);
// Instantiation of Axi Bus Interface M00_AXIS
    wire [C_M00_AXIS_TDATA_WIDTH-1:0] Data_Out [0:NUMBER_OF_INPUT_WORDS-1]; 
    wire Valid;
    
	fft_ip_core_rg_v1_0_M00_AXIS # ( 
		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
	) fft_ip_core_rg_v1_0_M00_AXIS_inst (
	    .Data_Input(Data_Out),
	    .Valid,
		.M_AXIS_ACLK(m00_axis_aclk),
		.M_AXIS_ARESETN(m00_axis_aresetn),
		.M_AXIS_TVALID(m00_axis_tvalid),
		.M_AXIS_TDATA(m00_axis_tdata),
		.M_AXIS_TSTRB(m00_axis_tstrb),
		.M_AXIS_TLAST(m00_axis_tlast),
		.M_AXIS_TREADY(m00_axis_tready)
	);

// Instantiation of Axi Bus Interface S00_AXIS
    wire [C_M00_AXIS_TDATA_WIDTH-1:0] Data_In [0:NUMBER_OF_INPUT_WORDS-1];
	wire Done;

	fft_ip_core_rg_v1_0_S00_AXIS # ( 
		.C_S_AXIS_TDATA_WIDTH(C_S00_AXIS_TDATA_WIDTH)
	) fft_ip_core_rg_v1_0_S00_AXIS_inst (
	    .Data_Out(Data_In),
	    .Write_Done(Done),
		.S_AXIS_ACLK(s00_axis_aclk),
		.S_AXIS_ARESETN(s00_axis_aresetn),
		.S_AXIS_TREADY(s00_axis_tready),
		.S_AXIS_TDATA(s00_axis_tdata),
		.S_AXIS_TSTRB(s00_axis_tstrb),
		.S_AXIS_TLAST(s00_axis_tlast),
		.S_AXIS_TVALID(s00_axis_tvalid)
	);

	// Add user logic here
	logic [C_M00_AXIS_TDATA_WIDTH-1:0] Data [0:NUMBER_OF_INPUT_WORDS-1];
	
	always @(posedge s00_axis_aclk) begin
	   if(Done) begin
           for(int i = 0;i < NUMBER_OF_INPUT_WORDS;i = i + 1) begin
                Data[i] = Data_In[i];
           end
       end
	end
	
    Main_Module Main(
	   .clk(s00_axis_aclk),
	   .reset(s00_axis_aresetn),
	   .Data_Input(Data),
	   .Data_Output(Data_Out),
	   .Valid_Data(Valid),
	   .Valid_Input()
   );
	// User logic ends

	endmodule
