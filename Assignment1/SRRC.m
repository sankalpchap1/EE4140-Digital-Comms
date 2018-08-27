function [ h ] = SRRC( T,a )
%SRRC Square root raised cosine (SRRC) impulse response
%   Generates the SRRC impulse response for a given symbol time T and
%   roll-off factor a

t = (-40:40)*T/8; % 10 symbols and 8x oversampling rate

hn = ((sin(pi*(1-a)*t/T))+((4*a*t/T).*cos(pi*(1+a)*t/T))); % numerator
hd = pi*(t/T).*(1-(4*a*t/T).^2); % denominator
h = hn./hd;

h(41) = 1-a+4*a/pi; % h(t=0)
h(~isfinite(h)) = a/2^0.5*((1+2/pi)*sin(0.25*pi/a)...
+(1-2/pi)*cos(0.25*pi/a)); % h(|t|=T/(4*a))

end

