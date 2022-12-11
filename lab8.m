x = -1:0.01:1;
f = @ tanDerivative;
y = f(x);

hold on;

% oryginał
plot(x, y, "--", DisplayName="f(x)");
text(getTextSpot(x), getTextSpot(y), "oryginał", Color="b")


% 3 węzły
x3 = linspace(-1, 1, 3);
plot(x3, f(x3), "ro", MarkerSize=10, DisplayName="x3");

p3 = polyfit(x3, f(x3), 2);
yy3 = polyval(p3, x);
plot(x, yy3, "r", LineWidth=0.3, DisplayName="p3");
text(getTextSpot(x), getTextSpot(yy3), "n = 3", Color="r")


% 7 wezłów
x7 = linspace(-1, 1, 7);
plot(x7, f(x7), "go", DisplayName="x7");

p7 = polyfit(x7, f(x7), 6);
yy7 = polyval(p7, x);
plot(x, yy7, "g", LineWidth=0.3, DisplayName="p7");
text(getTextSpot(x), getTextSpot(yy7), "n = 7", Color="g")


% 10 węzłów
x10 = linspace(-1, 1, 10);
plot(x10, f(x10), "bo", DisplayName="x10");

p10 = polyfit(x10, f(x10), 9);
yy10 = polyval(p10, x);
plot(x, yy10, "b", LineWidth=0.3, DisplayName="p10");
text(getTextSpot(x), getTextSpot(yy10), "n = 10", Color="b")


% spline
xs = -1:0.2:1;
ys = f(xs);
yys = spline(xs, ys, x);
plot(x, yys, Color="magenta", DisplayName="spline")
text(getTextSpot(x), getTextSpot(yys), "spline", Color="magenta")


hold off;
legend show;

title("Interpolacja function f(x) = 1 / (1 + 25x^2)")