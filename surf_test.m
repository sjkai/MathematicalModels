x=-2:0.1:2;
y=-4:0.1:4;
[X,Y]=meshgrid(x,y);
Z=sin(X.*Y);
surf(X,Y,Z)
pause
