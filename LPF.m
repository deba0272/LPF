


clc
clear
close all

N = input("Enter the value");
Wc = input("Enter the cutoff frequency");
alpha = (N-1) ./ 2;
n = 0:1:N-1;
Hd = (Wc ./ pi) * sinc(Wc * (n - alpha) ./ pi);

% Generate window functions
B1 = hamming(N);     % Hamming window
B2 = blackman(N);    % Blackman window
B3 = hann(N);        % Hann window

% Apply window functions to the ideal filter's impulse response
H1 = B1' .* Hd;
H2 = B2' .* Hd;
H3 = B3' .* Hd;

W = 0:0.01:pi;
h1 = freqz(H1, 1, W);
h2 = freqz(H2, 1, W);
h3 = freqz(H3, 1, W);

% Create subplots
subplot(3,2,1) 
plot(W/pi, 20*log(abs(h1)));
title('Hamming Window')

subplot(3,2,3) 
plot(W/pi, 20*log(abs(h2)));
title('Blackman Window')

subplot(3,2,5) 
plot(W/pi, 20*log(abs(h3)));
title('Hann Window')

subplot(3,2,2)
plot(W/pi, phase(h1));
xlabel('freq');
ylabel('phase');
title('phase of Hamming Window')

subplot(3,2,4)
plot(W/pi, phase(h2));
xlabel('freq');
ylabel('phase');
title('phase of Blackman Window');

subplot(3,2,6)
plot(W/pi, phase(h3));
xlabel('freq');
ylabel('phase');
title('phase of Hann Window');



% Adjust the spacing between subplots
sgtitle('Magnitude Response Comparison')

legend('21UEC118 Debajyoti Roy');

