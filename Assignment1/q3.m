% Question 3
T = 1/(25*10^3); % symbol period

h1 = SRRC(T,0.35); % generate SRRC pulse
rc = conv(h1,h1); % raised cosine (RC) pulse is convolution of two SRRCs
rc = rc(41:121); % truncate to 81 samples

X = 1 - 2*randi([0,1],20,1); % random sequence of 20 bits
X1 = upsample(X,8); % 8x upsampling for pulse shaping
Xrc = conv(X1,rc); % pulse shaping with RC
X2 = Xrc(41:8:193); % taking values at symbol-spaced sampling points
                    % corresponding to peaks of RC pulses
err = abs(8*X-X2);% calculating error between original sequence
                  % and ideal sampling points
minerror = min(err);
maxerror = max(err);


figure(1)
plot((-40:40)*T/8,rc);grid % plotting RC pulse
title('RC pulse h(t)(\alpha=0.35)');
xlabel('time (sec)');
ylabel('h(t)');

figure(2)
plot((0:length(X1)-1)*T/8,X1);grid % plotting original sequence
title('20 bit random sequence of +1 -1 bits');
xlabel('time (sec)');
ylabel('x(t)');

figure(3)
plot((0:length(Xrc)-1)*T/8,Xrc);grid % plotting pulse-shaped sequence
title('Pulse shaped sequence X_{rc}(t)');
xlabel('time (sec)');
ylabel('X_{rc}(t)');

Xrc = Xrc(41:193);  % keeping only the time range for which RC peaks exist
eyediagram(Xrc,8) % eye diagram for pulse-shaped sequence

