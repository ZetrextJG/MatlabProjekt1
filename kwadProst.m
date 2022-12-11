function [wynik, wysokosci, punkty] = kwadProst(wezly, f, koniec, H)
% Funkcja obliczająca złożoną kwadraturę prostokątów na wezłach (wezly), 
% będacych wektorem rosnących wartości,  
% fukncji f (f) z węzłem będącym lewym końcem / srodkiem / prawym końcem 
% w zależności od zmiennej (koniec)
%
% Jeżeli podana jest wartość H, wezły wyjmujemy za równoogległe z
% odległością dokładnie H.
% 
% Funckja zwraca wynik całkowania numerycznego (wynik) oraz wysokości
% kolejnych prostokątów (wysokosci) w postacji dwójki [a, b]
%

% Sprawdzamy czy zminne sa poprawnej formy
if isscalar(wezly)
    error("Zmienna wezly nie jest wektorem");
end

if ~isnumeric(wezly)
    error("Wektor welzy nie zawiera wartosci liczbowych")
end

if ~isa(f, "function_handle")
    error("Zmienna f nie jest referencja do funkcji")
end

if ~isenum(koniec) || ~isa(koniec, "KonceKwad")
    error("Nie poprawna zminna koniec. Podaj jedna z opcji klasy KonceKwad.")
end

wezlyLewe = wezly(1:(end - 1));
wezlyPrawe = wezly(2:end);

switch koniec
    case KonceKwad.Lewy
        punkty = wezlyLewe;
    case KonceKwad.Prawy
        punkty = wezlyPrawe;
    case KonceKwad.Srodek
        punkty = (wezlyLewe +  wezlyPrawe) / 2;
   otherwise
      error("Zmienna koniec nie jest poprawnie zdefiniowana. Użyj klasy enumeracyjnej KonceKwad.")
end

wysokosci = f(punkty);

if nargin < 4
    elementSumy = (wezlyPrawe - wezlyLewe) * wysokosci;
    wynik = sum(elementSumy);
else
    wynik = H * sum(wysokosci);
end

end
