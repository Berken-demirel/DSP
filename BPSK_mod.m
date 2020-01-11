function BPSK_mod(data, fs)

LPC_output = LPC_tx_s(data);
% LPC output to -1 1
LPC_output = int16(LPC_output.');
LPC_output(LPC_output == 0) = -1; 
% Preamble Addition
bits_to_preamble = [1 -1 1 -1 1 -1 1 -1]; %Preamble bit sequence

Preamble_output = [bits_to_preamble LPC_output];
% Upsampling
L = 20;

Upsampling_output = upsample(Preamble_output,L);
% Tx Filter(RRC)
beta = 0.5;
span = 10;
p_n = rcosdesign(beta,span,L);

RRC_output = conv(p_n,Upsampling_output);
%% Multiply by carrier 
fc = 6000; %Carrier frequency
t1 = 1/fs:1/fs:(1/fs)* length(RRC_output);

output_of_carrier = RRC_output .* cos(2* pi * fc * t1);

soundsc(output_of_carrier, fs);

end