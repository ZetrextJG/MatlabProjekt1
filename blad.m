function [blad] = blad(fx, frx)
% Wylicza bład względny między wartościami fx
% a wartościami frx
blad = abs(fx - frx) ./ abs(frx);
end

