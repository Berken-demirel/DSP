function helper_continuous_signal(data, Fs, real_Fs, plotHandle)

down_sample_rate = real_Fs / Fs;
data = downsample(data, down_sample_rate);

lengthOfData = length(data(:,1));
samples = 1:lengthOfData;
data_to_plot = data(:,1).';

set(plotHandle, 'ydata', data_to_plot, 'xdata', samples); % Updating the plot
drawnow; % Update the plot

end