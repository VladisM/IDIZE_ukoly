Fs = 10000;
t = 0:1/Fs:511/Fs;

%create original signal
y_orig = sin(2 * pi * 1000 * t); 
y_orig = y_orig + sin(2 * pi * 2000 * t); 
y_orig = y_orig + sin(2 * pi * 3000 * t);

%add another signals
y1 = y_orig + sin(2 * pi * 2100 * t);
y2 = y1 + sin(2 * pi * 3100 * t);

%calculate two filters
Fst1 = [2050 2150];
Fst2 = [3050 3150];
[b1,a1] = butter(8, (2/Fs) .* Fst1  , 'stop'); 
[b2,a2] = butter(8, (2/Fs) .* Fst2  , 'stop'); 

%filter first signal
y1_clean = filter(b1,a1,y1);

%filter second signal
y2_clean = filter(b1, a1, y2);
y2_clean = filter(b2, a2, y2_clean);

%print results
make_fft_graph(y_orig, t, Fs, 'orig');
make_fft_graph(y1, t, Fs, 'y1');
make_fft_graph(y2, t, Fs, 'y2');
make_fft_graph(y1_clean, t, Fs, 'y1_clean');
make_fft_graph(y2_clean, t, Fs, 'y2_clean');
make_freqz_graph(b1, a1, 'first');
make_freqz_graph(b2, a2, 'second');

function make_fft_graph(y, t, Fs, FileName)
    %calculate FFT
    y_spec = fft(y);
    y_spec=abs(fftshift(y_spec));
    f_spec = Fs/2 * linspace(-1, 1, length(y));
    
    %draw a graph
    h = figure();
    subplot(2, 1, 1);
    plot(t,y);
    title('time domain');
    xlabel('time [s]');
    grid on;
    a = axis;
    axis([0 0.05 a(3) a(4)]);
    subplot(2, 1, 2);
    plot(f_spec, y_spec);
    title('frequency domain');
    xlabel('frequency [Hz]');
    grid on;
    
    saveas(h, [FileName '.png']);
    close(h);
    clear h;
end

function make_freqz_graph(b, a, FileName)
    h = figure();
    freqz(b, a, 300);
    saveas(h, [FileName '.png']);
    close(h);
    clear h;
end