%3.1 
%3.1.1

A1 = 1; %Amplitude 1
A2 = 2; %Amplitude 2
f1 = 1000; %Frequence 1
f2 = 3000; %Frequence 2
Fe = 10000;
T1 = 1/f1; %Periode 1
T2 = 1/f2; %Periode 2
Te = 1/Fe;
N = 100; %Nombre d'echantillon
a
temps  = [0:Te:(N-1)*Te];
x1 = A1*cos(2*pi*f1*temps);
x2 = A2*cos(2*pi*f2*temps);
x = x1+x2;

%3.1.2
figure(1)
plot(temps, x);
grid;
xlabel("Temps (s)");
ylabel("x(t) en V");
title("Trace la somme de deux sinus x1 (f=1000, A=1) et x2 (f=3000, A = 2)")

%3.1.3: Representation spectrale
% Avec la TFD
figure(2)
%X = fft(x); 
fft(x, 4096) % ZeroPadding pour avoir une meilleurs resolution frequenciel
% linspace(1er val, derniere val, nbr pts)
plot(linspace(-Fe/2, Fe/2, length(x)), fftshift(abs(X)));
xlabel("Frequence (Hz)");
ylabel("|TFD(x)(f)|");
% Avec la DSP

%3.2
%3.2.1


