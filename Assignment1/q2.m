% Question 2
T = 1/(25*10^3); % symbol period
w = (-40:40)/16; % frequency axis fT

% roll-off of 0.35
h1 = SRRC(T,0.35);
H1 = fftshift(fft(h1)); % centered at zero frequency
figure(1)
plot(w,20*log10(abs(H1/H1(41)))); % plots log(abs(H)) vs fT
title('SRRC pulse normalized freq response (\alpha = 0.35)')
xlabel('fT');
ylabel('20log_{10}H(f)');
grid;

% roll-off of 0.7
h2 = SRRC(T,0.7);
H2 = fftshift(fft(h2));
figure(2)
plot(w,20*log10(abs(H2/H2(41))));
title('SRRC pulse normalized freq response (\alpha = 0.7)')
xlabel('fT');
ylabel('20log_{10}H(f)');
grid;

% roll-off of 1
h3 = SRRC(T,1);
H3 = fftshift(fft(h3));
figure(3)
plot(w,20*log10(abs(H3/H3(41))));
title('SRRC pulse normalized freq response (\alpha = 1)')
xlabel('fT');
ylabel('20log_{10}H(f)');
grid;