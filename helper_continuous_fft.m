function helper_continuous_fft(data, Fs, real_Fs, plotHandle, lowpass_filter)

down_sample_rate = real_Fs / Fs;
data = downsample(data, down_sample_rate);

data = filter(lowpass_filter,1,data);

helper_filtered_fft(data, Fs, plotHandle);

BPSK_mod(data, Fs);

end