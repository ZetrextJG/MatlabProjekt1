function [] = dwaWykresy(numpoints)
% Rysuje wykresy cos(2x-5) oraz sin(1/2 * x + 2) w przestrzeni 3D
% numpoints suggest the number of points of the plot
if nargin < 1
    numpoints = 100000;
end

x = linspace(0,4*pi,numpoints);

y0 = cos(2*x - 5);
z0 = zeros(numpoints,1);

y1 = sin((1/2) * x + 2);
z1 = ones(numpoints,1);


plot3(x,z0,y0,'Color','none');
plot3(x,z1,y1,'Color','none');
grid on;
axis([0,4*pi,0-0.5,1+0.5,-1,1])

h = animatedline('Color','r','LineWidth',1, 'LineStyle', "--");
for k = 1:numpoints
    addpoints(h,x(k),z1(k),y1(k));
    drawnow limitrate
end

h = animatedline('Color','b','LineWidth',2);
for k = 1:numpoints
    addpoints(h,x(k),z0(k),y0(k));
    drawnow limitrate
end

end

