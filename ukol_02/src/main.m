h1 = figure();

Fs = 8000;

t = (0:199)*(1/Fs);
y1 = randn(1, 200);
y1 = y1./max(y1);
subplot(3, 2, 1);
stem(t, y1, '.');
title('normálové');

y2 = rand(1, 200) * 2 -1 ;
subplot(3, 2, 2);
stem(t, y2, '.');
title('rovnoměrné');

y3a = sin(2 * pi * 400 * t);
y3b = sin(2 * pi * 800 * t);
subplot(3,2,3);
plot(t, y3a);
title('harmonický');
subplot(3,2,4);
plot(t, y3a + y3b);
title('složený');

y4 = y3a + y2;
subplot(3,2,5);
plot(t, y4);
title('složení s šumem');


t = (0:399)*(1/Fs);
y5 = square(2 * pi * 400 * t);
subplot(3, 2, 6);
plot(t, y5);
a = axis;
a = [a(1) a(2)/4 2*a(3) 2*a(4)];
axis(a);
title('odélník');

saveas(h1, '1.png');


h2 = figure();

Fs = 1000;
t = 0:1/Fs:0.5 - 1/Fs;

sine_a = sin(2 * pi * 99 * t); 
sine_b = sin(2 * pi * 101 * t); 
sine_c = sine_a + sine_b;

subplot(3, 1, 1);
plot(t, sine_a);
title('Wave_A (F_a = 99Hz)');
subplot(3, 1, 2);
plot(t, sine_b);
title('Wave_B (F_b = 101Hz)');
subplot(3, 1, 3);
plot(t, sine_c);
title('Wave_C = Wave_A + Wave_B');

saveas(h2, '2.png');

h3 = figure();

Fs = 200;
t = 0:1/Fs:0.5 - 1/Fs;
y7 = sin(2 * pi * 99 * t); 

plot(t, y7);
title('F blízko k F_s');

saveas(h3, '3.png');

