
f = @sin; % Funckja podcałkowa
calkaF = @cos; % Funckja pierwotna
a = -2; % Początek przedziału
b = 2; % Koniec przedzialu
n = 10; % Liczba węzłów

wezly = linspace(a,b,n); % Tworzenie wezłów
H = (b - a) / n; % Wyliczanie odległości między węzłami

% Wyznacznie kwadratury
[wynik, wysokosci, punkty] = kwadProst(wezly, f, KonceKwad.Lewy, H);

x = linspace(a, b, 1000);
y = f(x);

hold on;
xticks(wezly);

plot(x, y, LineWidth=2);
plot(punkty, wysokosci, "ro")

for i = 2:n
    xx = [wezly(i-1), wezly(i)];
    yy = [wysokosci(i-1), wysokosci(i-1)];
    plot(xx, yy, "g", LineWidth=1.5);
end

xline(0);
yline(0);

legend("y = sin x", "wezly", "wysokosci");
hold off;