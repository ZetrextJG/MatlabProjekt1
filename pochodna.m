function [yprzyb] = pochodna(x, f, h)
% Wylicza wartości pochodnej funckji f dla
% argumentu x
% Opcjonalnie można dodac wektor odstepu h
if nargin < 3
    h = 2.^[-20:2:2];
end
yprzyb = (f(x - h) + f(x + h)) ./ (2 * h);

