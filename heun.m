function [y, t] = heun(f, y0, t0, h, N)
    % y0 i t0 - to warunki pocz¹tkowe,
    % h - to d³ugoœæ kroku (ogólnie: [t(N) - t(1)/N])
    % N - to liczba kroków
    y = zeros(N+1,1);
    t = zeros(N+1,1);
    
    y(1) = y0;
    t(1) = t0;
    n = 1;
    while n < N+1 % wykonaj N kroków
        % policz y z nastêpnego kroku
        y(n+1) = y(n) + h*(f(t(n),y(n))+f(t(n)+h,y(n)+f(t(n),y(n))*h))/2;
        % policz t z nastêpnego kroku
        t(n+1) = t(n) + h;
        n = n + 1;
    end
    % Zwróæ tylko nowopoliczone wartoœci
    y = y(2:N+1);
    t = t(2:N+1);
end
