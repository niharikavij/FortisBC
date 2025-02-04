% Capstone Project - Harmonic Analysis with Fundamental Frequency Detection
% Author: Fiona Luo
% Date: Updated Feb. 1, 2025

clc; clear; close all;

% Load Data from Excel
filename = 'Tesla Gateway 3 Dataset.xlsx';
channel = 2; % Choosing channel here
time = xlsread(filename, channel, 'A:A'); % (ms)
time = time / 1000; % (s)
voltage = xlsread(filename, channel, 'B:B'); % (V)
current = xlsread(filename, channel, 'C:C'); % (A)

% Sampling parameters
N = length(time);  % Number of samples
Fs = 1 / (time(2) - time(1));  % Sampling Frequency (Hz)

% Perform FFT on voltage and current
Y_v = fft(voltage);
Y_i = fft(current);

% Compute Amplitudes
A1_v = abs(Y_v(1:floor(N/2)+1)) / N;
A1_v(2:end-1) = 2 * A1_v(2:end-1);

A1_i = abs(Y_i(1:floor(N/2)+1)) / N;
A1_i(2:end-1) = 2 * A1_i(2:end-1);

% Compute Phase Angles
P1_v = rad2deg(angle(Y_v(1:floor(N/2)+1)));
P1_i = rad2deg(angle(Y_i(1:floor(N/2)+1)));

% Frequency Vector
f = Fs * (0:(N/2)) / N; % Frequency (Hz)

% --- Detect Fundamental Frequency ---
[peaks_v, locs_v] = findpeaks(A1_v, f, 'MinPeakHeight', max(A1_v) * 0.1); 
fundamental_freq = locs_v(1); % First major peak is the fundamental

% --- Harmonics Definition ---
harmonics = [1, 3, 5, 7, 9, 11, 13]; % Fundamental + harmonic orders
harmonics = fundamental_freq * harmonics; % Harmonics based on detected fundamental
num_harmonics = length(harmonics);

% Initialize Storage for Results
harmonic_amp_v = zeros(1, num_harmonics);
harmonic_amp_i = zeros(1, num_harmonics);
harmonic_phases_v = zeros(1, num_harmonics);
harmonic_phases_i = zeros(1, num_harmonics);
harmonic_amp_v_percent = zeros(1, num_harmonics);
harmonic_amp_i_percent = zeros(1, num_harmonics);

% --- Fundamental Amplitude & Phase ---
[~, idx_fundamental] = min(abs(f - fundamental_freq));
fundamental_amp_v = A1_v(idx_fundamental);
fundamental_amp_i = A1_i(idx_fundamental);
fundamental_phase_v = P1_v(idx_fundamental);
fundamental_phase_i = P1_i(idx_fundamental);

% --- Harmonics Computation Using FFT Bins ---
for i = 2:num_harmonics  % Start from 2nd harmonic (skip fundamental)
    target_harmonic_freq = harmonics(i);
    
    % Find closest FFT bin
    [~, idx_closest] = min(abs(f - target_harmonic_freq));

    % Assign harmonic amplitudes and phases
    harmonic_amp_v(i) = A1_v(idx_closest);
    harmonic_amp_i(i) = A1_i(idx_closest);
    harmonic_phases_v(i) = P1_v(idx_closest) - fundamental_phase_v;
    harmonic_phases_i(i) = P1_i(idx_closest) - fundamental_phase_i;

    % Compute percentage of fundamental
    harmonic_amp_v_percent(i) = (harmonic_amp_v(i) / fundamental_amp_v) * 100;
    harmonic_amp_i_percent(i) = (harmonic_amp_i(i) / fundamental_amp_i) * 100;
end

% --- Display Results ---
fprintf('Fundamental Frequency: %.2f Hz\n', fundamental_freq);
fprintf('Fundamental Amplitude (V): %.2f, (I): %.2f\n', fundamental_amp_v, fundamental_amp_i);
fprintf('Harmonic Amplitudes (V): %.2f, %.2f, %.2f, %.2f, %.2f, %.2f\n', harmonic_amp_v(2:end));
fprintf('Harmonic Amplitudes (I): %.2f, %.2f, %.2f, %.2f, %.2f, %.2f\n', harmonic_amp_i(2:end));
fprintf('Harmonic Amplitudes Percentage (V): %.2f%%, %.2f%%, %.2f%%, %.2f%%, %.2f%%, %.2f%%\n', harmonic_amp_v_percent(2:end));
fprintf('Harmonic Amplitudes Percentage (I): %.2f%%, %.2f%%, %.2f%%, %.2f%%, %.2f%%, %.2f%%\n', harmonic_amp_i_percent(2:end));
fprintf('Harmonic Phases (V): %.2f, %.2f, %.2f, %.2f, %.2f, %.2f\n', harmonic_phases_v(2:end));
fprintf('Harmonic Phases (I): %.2f, %.2f, %.2f, %.2f, %.2f, %.2f\n', harmonic_phases_i(2:end));

% --- Plot ---
figure;
subplot(2,1,1);
plot(f, A1_v);
hold on;
plot(f(idx_fundamental), fundamental_amp_v, 'ro');  % Mark fundamental
title('Voltage Spectrum with Fundamental Frequency');
xlabel('Frequency (Hz)');
ylabel('Amplitude (V)');
xlim([0, 800]);

subplot(2,1,2);
plot(f, A1_i);
hold on;
plot(f(idx_fundamental), fundamental_amp_i, 'ro');  % Mark fundamental
title('Current Spectrum with Fundamental Frequency');
xlabel('Frequency (Hz)');
ylabel('Amplitude (A)');
xlim([0, 800]);
