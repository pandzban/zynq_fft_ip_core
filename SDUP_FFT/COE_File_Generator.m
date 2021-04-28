n = 16; %liczba próbek
number_of_stages = log2(n);

%Create Coe files
file = fopen('Phase_Cos_Re_Factors_ROM_Init.coe','wt');
file_1 = fopen('Phase_Sin_Im_Factors_ROM_Init.coe','wt');
%Initialize files with "Headers"
fprintf(file,'%s\n','memory_initialization_radix=2;'); 
fprintf(file,'%s\n','memory_initialization_vector=');
fprintf(file_1,'%s\n','memory_initialization_radix=2;'); 
fprintf(file_1,'%s\n','memory_initialization_vector=');
%Iter from butterfly with highest number of inputs(last one)
%We abort factors for FFT_Block with only 2 inputs, beacause Cos(0) = 1,
%Sin(0) = 0
for stage=number_of_stages:-1:2
    number_of_inputs = 2^stage; %Count number of Inputs for FFT_Block in each stage
    for j=0:(number_of_inputs/2)-1 %Count number of factors for FFT_Block in each stage
        %Write to files values of factors in binary format fixed
        %point[6,10] np. 1 = 0000010000000000
        fprintf(file, '%s', bin(fi(cos(-2*pi*j/(number_of_inputs)),1,16,10)));
        fprintf(file_1, '%s', bin(fi(sin(-2*pi*j/(number_of_inputs)),1,16,10)));
        %Add at the end of file -> ;
        if((j==1) && (stage == 2))
            fprintf(file,'%s',';');
            fprintf(file_1,'%s', ';');
        else %Add at the end of each line -> ,
            fprintf(file,'%s\n',',');
            fprintf(file_1,'%s\n',',');
        end
    end
end
%Close files
fclose(file);
fclose(file_1);