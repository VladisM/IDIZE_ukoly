Fs = 8000;                                         

t = 0:1/Fs:0.5-1/Fs;                              
y1 = sin(2 * pi * 400 * t);                       
h1 = plot(t(1:length(t)/25), y1(1:length(y1)/25));
sound(y1, Fs);                                    
saveas(h1, '1.png');                              

t = 0:1/Fs:4/400 - 1/Fs;
y2 = sin(2 * pi * 400 * t);
h2 = plot(t, y2);
saveas(h2, '2.png');

t = (0:24)/Fs;
y3 = sin(2 * pi * 400 * t);
h3 = stem(t, y3); 
saveas(h3, '3.png');

n = -10:10;
y4 = n == 0;
h4 = stem(n, y4);
saveas(h4, '4.png');

n = -10:10;
y5 = n >= 0;
h5 = stem(n, y5);
saveas(h5, '5.png');

t1 = 0:1/Fs:2/50 - 1/Fs;
t2 = 0:1/Fs:4/100 - 1/Fs;
y6 = sin(2 * pi * 50 * t1);
y6 = [y6 sin(2 * pi * 100 * t2)];
y6 = [y6 sin(2 * pi * 50 * t1)];
t = t1; 
t = [t (t2 + t1(length(t1)))];
t = [t (t1  + t2(length(t2)) + t1(length(t1)))];
h6 = plot(t, y6);
saveas(h6, '6.png');

t = 0:1/Fs:4/400 - 1/Fs;
y7 = sawtooth(2 * pi * 400 * t);
h7 = plot(t, y7);
saveas(h7, '7.png');