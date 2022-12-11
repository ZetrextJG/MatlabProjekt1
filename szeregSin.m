function [y] = szeregSin(x,N)
% x to wektor wartosci
% N to liczba elementow do uzwglenienia
ns = [0:(N-1)];
cooeficients = (-1).^ns ./ factorial(2 .* ns + 1);
for i = ns
    A(i + 1, :) = (x.^(2 * i + 1));
end
for j = 1:length(x)
    A(:, j) = cooeficients' .* A(:, j);
end
y = sum(A);