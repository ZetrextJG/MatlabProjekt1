f = @exp; % Funckja podcalkowa
a = -2; % Początek przedzialu
b = 1; % Koniec przedzialu
n = 15; % Liczba wezlow
koniec = KonceKwad.Srodek; % Ktory koniec

wezly = linspace(a,b,n); % Tworzenie wezlow
H = (b - a) / n; % Wyliczanie odleglosci miedzy wezłami

% Wyznacznie kwadratury
[wynik, wysokosci, punkty] = kwadProst(wezly, f, koniec, H);

% Wartosci dla funkcji podcalkowej
x = linspace(a, b, 1000);
y = f(x);

hold on;
xticks(wezly);

% Plottowanie fukcji podcalkowej 
plot(x, y, LineWidth=2);

% Naniesienie wezłów
plot(punkty, wysokosci, "ro")

% Obrazowanie wysokosci i pola kazdego prosotkatow
for i = 2:n

    % Linia wysokosci prostokata
    xx = [wezly(i-1), wezly(i)];
    yy = [wysokosci(i-1), wysokosci(i-1)];
    plot(xx, yy, "g", LineWidth=1.5);
   
    dlg = wezly(i) - wezly(i - 1);
    wys = abs(wysokosci(i - 1));

    % Pole prostokata
    if wysokosci(i - 1) < 0
        pos = [wezly(i - 1), wysokosci(i - 1), dlg, wys];
    else
        pos = [wezly(i - 1), 0, dlg, wys];
    end
    rectangle("Position", pos, "FaceColor", [0 1 0 0.05]);

end

% Osie OX i OY
xline(0);
yline(0);

% Utworzenie legendy
legend("y = sin x", "wezly", "wysokosci");
hold off;