clear;
N = 100; % ilość podprzedziałów
y = zeros(N,1);
t = zeros(N,1);

e = @(t) (exp(t)); % dokładne rozwiązanie
f = @(t,y) (y);    % funkcja prawej strony
y(1) = 1; % warunek...
t(1) = 0; % ...początkowy
t(N) = 0.5; % koniec przedziału

h = (t(N)-t(1))/N; % ilość podprzedziałów

figure(1); hold on;

axis([t(1) t(N) 0 1]);

[y(2:N), t(2:N)] = adamsbash(f, y(1), t(1), h, N-1);
plot(t, y, 'b-');

[y(2:N), t(2:N)] = euler(f, y(1), t(1), h, N-1);
plot(t, y, 'g-');

[y(2:N), t(2:N)] = adamsmoul(f, y(1), t(1), h, N-1);
plot(t, y, 'k-');

plot(t, e(t), 'r-');

legend('Adams-Bashford', 'Euler', 'Adams-Moulton', 'Exact solution'); hold off;
title('Rozwiazanie rownania: dy/dt = y, dla h = 0.05, warunku poczatkowego y(0) = 1');
