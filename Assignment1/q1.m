% Question 1(a)
t = (-499:500)*10^-2; % sampling rate of 100MHz (10 times carrier freq)
up = sinc(t).*cos(20*pi*t); % passband signal (t in microseconds)

figure(1)
plot(t,up);grid % plots the passband signal up
title('passband signal u_p(t) = sinc(t)cos(20*\pi*t)');
xlabel('time (\musec)');
ylabel('u_p(t)');

% Question 1(b)
x = 2*up.*cos(20*pi*t); % multiplying with cosine for downconversion
y = movmean(x,100);  % LPF simulated using moving average for 1us

figure(2)
plot(t,y);grid % plots filtered signal y
title('Downconverter LPF output y(t)');
xlabel('time (\musec)');
ylabel('y(t)')
