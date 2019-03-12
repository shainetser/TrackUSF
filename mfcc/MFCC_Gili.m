function [ MFCCs, FBEs, frames ] = MFCC_Gili(Speech_signal, Fs)
%   This script is a step by step walk-through of computation of the
%   mel frequency cepstral coefficients (MFCCs) from a speech signal
%   using the MFCC routine.
    
    % Define variables
    Tw = 6;                % analysis frame duration (ms) %%4%%
    Ts = 2;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 40;                 % number of filterbank channels - 20 
    C = 15;                 % number of cepstral coefficients -12
    L = 22;                 % cepstral sine lifter parameter -22
    LF = 5000;               % lower frequency limit (Hz) -3000
    HF = 100000;              % upper frequency limit (Hz) -3700

    % Feature extraction (feature vectors as columns)
    [ MFCCs, FBEs, frames ] = mfcc( Speech_signal, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );

    % Generate data needed for plotting 
    [ Nw, NF ] = size( frames );                % frame length and number of frames
    time_frames = [0:NF-1]*Ts*0.001+0.5*Nw/Fs;  % time vector (s) for frames 
    time = [ 0:length(Speech_signal)-1 ]/Fs;           % time vector (s) for signal samples 
    logFBEs = 20*log10( FBEs );                 % compute log FBEs for plotting
    logFBEs_floor = max(logFBEs(:))-50;         % get logFBE floor 50 dB below max
    logFBEs( logFBEs<logFBEs_floor ) = logFBEs_floor; % limit logFBE dynamic range


    % Generate plots
%     figure('Position', [30 30 800 600], 'PaperPositionMode', 'auto', ... 
%               'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
    hold on;
    subplot( 311 );
    plot( time, Speech_signal, 'k' );
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' ); 
    ylabel( 'Amplitude' ); 
    title( 'Speech waveform'); 

    subplot( 312 );
    imagesc( time_frames, [1:M], logFBEs ); 
    axis( 'xy' );
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' ); 
    ylabel( 'Channel index' ); 
    title( 'Log (mel) filterbank energies');

    subplot( 313 );
    %imagesc( time_frames, [1:C], MFCCs(2:end,:) ); % HTK's TARGETKIND: MFCC
    imagesc( time_frames, [1:C+1], MFCCs );       % HTK's TARGETKIND: MFCC_0
    axis( 'xy' );
    xlim( [ min(time_frames) max(time_frames) ] );
    xlabel( 'Time (s)' ); 
    ylabel( 'Cepstrum index' );
    title( 'Mel frequency cepstrum  coefficients (MFCCs) with feature vectors as columns' );

    % Set color map to grayscale
%     colormap( 1-colormap('gray') ); 

end