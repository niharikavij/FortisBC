% Capstone Project - Harmonic Analysis and THD Calculation
% Author: Fiona Luo
% Date: Nov.19, 2024

% Load field data provided by FortisBC
% Testing with data from Simulink for now
load('test_data.mat');
signal = field_data(2,:);

% Sampling parameters
N = length(signal);  % Number of samples
t = field_data(1,:); % (s)
Fs = N/t(N-1);  % (Hz) Sampling Frequency

% Perform FFT
Y = fft(signal);
P2 = abs(Y/N);
P1 = P2(1:floor(N/2)+1);
P1(2:end-1) = 2*P1(2:end-1);

% Frequency
f = Fs*(0:(N/2))/N; % (Hz)

% Calculate Fundamental and Harmonics
fundamental_freq = 60;  % (Hz)
[~, idx_fundamental] = min(abs(f - fundamental_freq));
V1 = P1(idx_fundamental);  % Amplitude of the fundamental frequency

% Odd harmonics
harmonic_orders = [3, 5, 7, 9, 11, 13];
harmonic_amplitudes = zeros(1, length(harmonic_orders));

for i = 1:length(harmonic_orders)
    target_harmonic_frequency = harmonic_orders(i) * fundamental_freq;  % Harmonic frequency
    [~, idx_harmonic] = min(abs(f - target_harmonic_frequency));
    harmonic_amplitudes(i) = P1(idx_harmonic) / V1 *100;  % Percentage of the harmonic amplitude
end

% Calculate THD
harmonics_squared_sum = sum(harmonic_amplitudes.^2);
THD = sqrt(harmonics_squared_sum) / V1 * 100;

% Results
fprintf('Fundamental Amplitude (60 Hz): %.2f\n', V1);
fprintf('Harmonic Amplitudes (3rd, 5th, 7th, 9th, 11th, 13th): %.2f%%, %.2f%%, %.2f%%, %.2f%%, %.2f%%, %.2f%%\n', harmonic_amplitudes);
fprintf('Total Harmonic Distortion (THD): %.2f%%\n', THD);

% Plot
figure;
plot(f, P1);
title('Frequency Spectrum of the Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0, 800]);

