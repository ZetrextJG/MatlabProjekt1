x = linspace(-pi, pi, 50);
y1 = sin(x);

subplot(2, 2, [1,3]);
plot(x, y1);
subtitle("Sin(x)")
values = [2:7];
for val = values
    hold on
    y2 = szeregSin(x, val);
    subplot(2, 2, 2);
    plot(x, y2, 'DisplayName', append("N = ", int2str(val)));
end
hold off
legend()
subtitle("Szergi")
for val = values
    hold on
    y2 = szeregSin(x, val);
    subplot(2, 2, 4);
    y3 = blad(y2, y1);
    plot(x, y3, 'DisplayName', append("N = ", int2str(val)));
end
hold off
legend()
subtitle("Błędy względne")
