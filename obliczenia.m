% Skrypt do szybkiego i dokładnego przeglądania wartości i błędów
% kwadratur prostokątów dla poszczególnych funckji 
% Większość z tych funkcji jest bezpośrednio wzięte z aplikacji GUI

% "sin x"
% f = @sin;
% F = @(x) -cos(x);
% "sin 2x"
% f = @(x) sin(2 * x);
% F = @(x) (-1/2) * cos(2 * x);
% "cos x"
% f = @cos;
% F = @(x) sin(x);
% "cos 2x"
% f = @(x) cos(2 * x);
% F = @(x) (1/2) * sin(2 * x);
% "e^x"
% f = @exp;
% F = @exp;
% "ln x"
% f = @log;
% F = @(x) (x .* log(x)) - x;
% "-ln x"
% f = @(x) -log(x);
% F = @(x) x - (x .* log(x));
% "1/x"
f = @(x) 1 ./ x;
F = @(x) log(abs(x));
% "x"
% f = @(x) x;
% F = @(x) (1/2) * (x.^2);
% "x^2"
% f = @(x) x.^2;
% F = @(x) (1/3) * (x.^3);
% "sqrt(x)"
% f = @sqrt;
% F = @(x) (2/3) * (sqrt(x)).^3;
% "1"
% f = @(x) 1;
% F = @(x) x;

a = 0.001; % Początek przedziału 
b = 10; % Koniec przedziału
n = [5 10 50 100 200 500 1000 10000]; % Ilości węzłów

[wyniki, bledy] = bledyKwad(f, F, a, b, n);

disp("Wyniki");
disp(wyniki);
disp("Bledy");
disp(bledy);
