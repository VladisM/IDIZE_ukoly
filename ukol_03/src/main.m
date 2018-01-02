mute = 0;
ukol1('Ukaz1.wav', mute);
ukol1('Ukaz2.wav', mute);
ukol2('Ukaz1.wav', mute);
ukol2('Ukaz2.wav', mute);

function ukol2(fileName, mute)
    
    disp(['File ' fileName]);
    
    [ukazka_orig, Fs] = audioread(fileName);
    
    disp('playing original');
    playerobj = audioplayer(ukazka_orig, Fs);    
    play_muteable(playerobj, mute);

    audio_6 = change_resolution(ukazka_orig, 6);
    disp('playing 6bit');
    playerobj = audioplayer(audio_6, Fs);
    play_muteable(playerobj, mute);

    audio_4 = change_resolution(ukazka_orig, 4);
    disp('playing 4bit');
    playerobj = audioplayer(audio_4, Fs);
    play_muteable(playerobj, mute);

    h = figure();
    subplot(2, 1, 1);
    plot((0:9999)*1/Fs, audio_6(1:10000));
    title('6bit');
    subplot(2, 1, 2);
    plot((0:9999)*1/Fs, audio_4(1:10000));
    title('4bit');
    saveas(h, strrep(fileName, '.wav', '.png'));
end

function ukol1(fileName, mute)
    
    disp(['File ' fileName]);
    
    [ukazka_orig, Fs_orig] = audioread(fileName);

    for factor = [1, 5, 10]
        disp(['playing Fs = Fs_orig/' int2str(factor)])
        audio = my_decimate(ukazka_orig, factor);
        playerobj = audioplayer(audio, Fs_orig / factor);
        play_muteable(playerobj, mute);
    end
end

function out = change_resolution(x, bits)
    koef = (2^(bits))/max(abs(x));
    out = (round(x * koef))/koef;
end
    
function audio = my_decimate(x, factor)
    n = 1:factor:length(x);
    audio = x(n);
end

function play_muteable(obj, mute)
    if mute == 0
        playblocking(obj);
    end
end
