% Define filter specifications
fs = 1000;             % Sampling frequency (Hz)
cutoff_freq = 100;     % Cutoff frequency (Hz)
filter_order = 100;     % Filter order

% Design the low-pass filter
filter_coefficients = fir1(filter_order, cutoff_freq / (0.5 * fs), 'low');

% Generate a sample signal
t = 0:1/fs:1;                 % Time vector
signal = sin(2*pi*50*t);       % 50 Hz sinusoidal signal
noise = 0.2*randn(size(t));  % Gaussian noise(standard deviation 0.2)
input_signal = signal+noise; % Combined signal with noise

% Apply the filter to the signal
filtered_signal = filter(filter_coefficients, 1, input_signal);

% Plot the original, noisy, and filtered signals
figure;
subplot(3,1,1);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot(t, input_signal);
title('Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,3);
plot(t, filtered_signal);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('21UEC118 Debajyoti Roy')