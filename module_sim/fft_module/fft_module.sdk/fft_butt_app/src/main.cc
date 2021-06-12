#include "FFT_Butterfly_Axi_Lite.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_printf.h"
#include <stdio.h>

#define FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG0_OFFSET 0
#define FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG1_OFFSET 4
#define FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG2_OFFSET 8
#define FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG3_OFFSET 12
#define FFT_BUTTERFLY_AXI_LITE_S00_AXI_BASE_ADRESS 0x43C00000



int main()
{
	u32 result;
	int32_t val;
	int16_t Data_Input[16] = {1024,1024,0,0,1024,1024,0,0,1024,1024,0,0,1024,1024,0,0};
	int32_t Data_Output[16];
	for (int i = 0; i <= 15; i++){
		val = Data_Input[i];
		xil_printf("%d", val);
	}
	print("\n");
	FFT_BUTTERFLY_AXI_LITE_mWriteReg(FFT_BUTTERFLY_AXI_LITE_S00_AXI_BASE_ADRESS,FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG2_OFFSET,1);
	for(int i=0;i <= 15; i++){
		FFT_BUTTERFLY_AXI_LITE_mWriteReg(FFT_BUTTERFLY_AXI_LITE_S00_AXI_BASE_ADRESS,FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG0_OFFSET,Data_Input[i]);
	}
	FFT_BUTTERFLY_AXI_LITE_mWriteReg(FFT_BUTTERFLY_AXI_LITE_S00_AXI_BASE_ADRESS,FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG2_OFFSET,0);
	while(FFT_BUTTERFLY_AXI_LITE_mReadReg(FFT_BUTTERFLY_AXI_LITE_S00_AXI_BASE_ADRESS, FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG3_OFFSET) == 0);
	for(int i=0; i <= 15;i++){
		Data_Output[i] = FFT_BUTTERFLY_AXI_LITE_mReadReg(FFT_BUTTERFLY_AXI_LITE_S00_AXI_BASE_ADRESS, FFT_BUTTERFLY_AXI_LITE_S00_AXI_SLV_REG1_OFFSET);
	}
	for (int i = 0; i <= 15; i++){
		val = ((Data_Output[i] & 0xFFFF0000)  >> 16);
		xil_printf("%d", val);
		print(" ");
	}
	print("\n");
}