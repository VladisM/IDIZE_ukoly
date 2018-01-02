mute = 1;
ukol1('Ukaz2Polon.wav', mute);
ukol2('Ukaz2Polon.wav', mute);
ukol3('Ukaz2Polon.wav', mute);

function ukol1(FileName, mute)
    %read file
    [ukazka_orig, Fs_orig] = audioread(FileName);
    
    %play original
    play_muteable(ukazka_orig, Fs_orig, mute);
    
    %filter it
    Fstop = [300 3400];
    [b, a] = cheby1(6, 3, (2/Fs_orig) .* Fstop, 'bandpass');
    y1 = filter(b, a, ukazka_orig);

    %play filtered
    play_muteable(y1, Fs_orig, mute);
    
    %make spectrograms
    make_specgram(ukazka_orig, '1_orig');
    make_specgram(y1, '1_filter');
    
    clear b a y1 ukazka_orig Fs_orig Fstop;
end

function ukol2(FileName, mute)
    [ukazka_orig, Fs_orig] = audioread(FileName);
    
    %decimate without lowpass
    y1 = my_decimate(ukazka_orig, 5);
    y1_fs = Fs_orig / 5;
    
    %decimate with lowpass
    y2 = decimate(ukazka_orig, 5);
    y2_fs = Fs_orig /5;
    
    %play everything
    play_muteable(ukazka_orig, Fs_orig, mute);
    play_muteable(y1, y1_fs, mute);
    play_muteable(y2, y2_fs, mute);
    
    %draw everything
    make_specgram(ukazka_orig, '2_orig');
    make_specgram(y1, '2_nofilter');
    make_specgram(y2, '2_filter');
    
    clear y1 y2 y1_fs y2_fs ukazka_orig Fs_orig;
end

function ukol3(FileName, mute)

    %read file
    [y_orig, Fs_orig] = audioread(FileName);

    %add noise
    t = (0:length(y_orig)-1)/Fs_orig;
    t = transpose(t);
    y_noise = y_orig + 0.25 .* sin(2 * pi * 2200 * t);
    
    %filter noise
    Fstop = [2190 2210];
    [b, a] = butter(1, (2/Fs_orig) .* Fstop, 'stop');
    y_filter = filter(b, a, y_noise);
    
    %draw specgrams
    make_specgram(y_orig, '3_orig');
    make_specgram(y_noise, '3_noise');
    make_specgram(y_filter, '3_filter');
    
    %play everything
    play_muteable(y_orig, Fs_orig, mute);
    play_muteable(y_noise, Fs_orig, mute);
    play_muteable(y_filter, Fs_orig, mute);
    
    clear y_orig y_noise y_filter Fs_orig t;
end

function audio = my_decimate(x, factor)
    n = 1:factor:length(x);
    audio = x(n);
end

function play_muteable(vector,Fs, mute)
    if mute == 0
        obj = audioplayer(vector,Fs);
        playblocking(obj);
        clear obj;
    end
end

function make_specgram(vector, FileName)
    h = figure();
    spectrogram(vector, 256, 10, 256);
    saveas(h, [FileName '.png']);
    close(h);
    clear h;
end