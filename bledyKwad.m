function [wyniki, bledy] = bledyKwad(f, F, a, b, n)
% Funkcja oblicza dla każdej wartości w wektorze (n) wartości
% oszacowania pola pod powierzchnią funkcji (f) na przedziale ((a), (b))
% używając kwadratury prostokątów z n-węzłami. Obliczamy także błęd bezwzględne tych
% oszacowań w porówaniu z dokładną wartością całki używając fukcji
% pierwotnej (F)
% Zwarcamy dwie macierze [wyniki, bledy]
% każda z tych macierzy jest wymairu n x 3
% z 3 kolumnami (z lewym węzłem, z środkiem, z prawym węzłem)
% natomiast wierszami są kolejne wartości wybrane z n

if b <= a
    error("Przedzial musi miec dodatnia dlugosc");
end

if ~isnumeric(n)
    error("Wektor n nie zawiera wartosci liczbowych")
end

if ~isa(f, "function_handle")
    error("Zmienna f nie jest referencja do funkcji")
end

if ~isa(F, "function_handle")
    error("Zmienna F nie jest referencja do funkcji")
end

dokladny = F(b) - F(a);
H = (b - a) ./ n;

if isscalar(n)

end

wyniki = zeros(length(n), 3);
bledy = zeros(length(n), 3);

for i = 1:length(n)
    wezly = linspace(a, b, n(i));
   
    [wynikL, ~, ~] = kwadProst(wezly, f, KonceKwad.Lewy, H(i));
    [wynikS, ~, ~] = kwadProst(wezly, f, KonceKwad.Srodek, H(i));
    [wynikP, ~, ~] = kwadProst(wezly, f, KonceKwad.Prawy, H(i));

    wyniki(i, :) = [wynikL, wynikS, wynikP];

    bladL = abs(wynikL - dokladny);
    bladS = abs(wynikS - dokladny);
    bladP = abs(wynikP - dokladny);

    bledy(i, :) = [bladL, bladS, bladP];
end

