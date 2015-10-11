function anoval
    % Author:         Anemone
    % Filename:       anoval.m
    % Last modified:  2015-09-09 19:06
    % E-mail:         x565178035@126.com

    x=[1620 1580 1460 1500 1670 1600 1540 1550 1700 1640 1620 1610 1750 1720 1680 1800];
    x=[x(1:4),x(16),x(5:8),x(9:11),x(12:15)];
    g=[ones(1,5),2*ones(1,4),3*ones(1,3),4*ones(1,4)];
    [p,t,st]=anova1(x,g)
    [c,m,h,nms] = multcompare(st);
    [nms num2cell(m)]
end

