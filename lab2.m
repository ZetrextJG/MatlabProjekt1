x = [0:pi/6:2*pi];
h = [-20:2:2];
for i = 1:length(x)
    A(i, :) = pochodna(i, @fun_a, h);
end
A