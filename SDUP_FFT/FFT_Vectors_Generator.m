Zeros = zeros(1,16);
Ones = ones(1,16);
Square = [1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0];
t = 15; %ilość próbek/długość wektora
dt = 0:1:t;
Cos = cos(2*pi*dt/t) + 1;
Sin = sin(2*pi*dt/t) + 1;
writematrix(dec2bin(Zeros,16), 'Input_Vectors.csv','Delimiter',' ');
writematrix(dec2bin(Ones,16), 'Input_Vectors.csv','Delimiter',' ','WriteMode', 'append');
writematrix(dec2bin(Square,16), 'Input_Vectors.csv','Delimiter',' ','WriteMode',' ','WriteMode', 'append'); 
writematrix(bin(fi(Cos,1,16,10).transpose), 'Input_Vectors.csv','Delimiter',' ','WriteMode',' ','WriteMode', 'append');
writematrix(bin(fi(Sin,1,16,10).transpose), 'Input_Vectors.csv','Delimiter',' ','WriteMode',' ','WriteMode', 'append');
%możesz zrobić w identyczny sposób z każdą daną/tablicą o typie double
FFT_Zeros = fft(Zeros);
FFT_Ones = fft(Ones);
FFT_Square = fft(Square);
FFT_Cos = fft(Cos);
FFT_Sin = fft(Sin);
writematrix(dec2bin(FFT_Zeros), 'Output_Vectors.csv','Delimiter',' ');
writematrix(dec2bin(FFT_Ones), 'Output_Vectors.csv','Delimiter',' ','WriteMode', 'append');
%writematrix(dec2bin(FFT_Square), 'Output_Vectors.csv','Delimiter',' ','WriteMode', 'append');
%writematrix(dec2bin(FFT_Cos), 'Output_Vectors.csv','Delimiter',' ','WriteMode', 'append');
%writematrix(FFT_Sin, 'Output_Vectors.csv','Delimiter',' ','WriteMode', 'append');
