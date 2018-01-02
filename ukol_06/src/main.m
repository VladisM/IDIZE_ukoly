%butter aproximation
for n = 4:2:10
    Wp=[0.3 0.5];
    [b,a] = butter(n, Wp, 'stop'); 
    
    h = figure();
    freqz(b, a, 300);
    
    saveas(h, ['butter_n' int2str(n) '.png']);
    close(h);
    clear h;
end

%cheby 1 aproximation
for n = 4:2:10
    Wp = [0.3 0.5];
    Rp = 6;

    [b,a] = cheby1(n, Rp, Wp, 'stop');
    
    h = figure();
    freqz(b, a, 300);
    
    saveas(h, ['cheby1_n' int2str(n) '.png']);
    close(h);
    clear h;
end

%cheby 2 aproximation
for n = 4:2:10
    Wp = [0.3 0.5];
    Rs = 100;

    [b,a] = cheby2(n, 100, Wp, 'stop');
    
    h = figure();
    freqz(b, a, 300);
    
    saveas(h, ['cheby2_n' int2str(n) '.png']);
    close(h);
    clear h;
end

%elliptic aproximation
for n = 4:2:10
    Wp = [0.3 0.5];
    Rs=100;
    Rp=8;
    
    [b,a] = ellip(n, Rp, Rs, Wp, 'stop');
    
    h = figure();
    freqz(b, a, 300);
    
    saveas(h, ['ellip_n' int2str(n) '.png']);
    close(h);
    clear h;
end

