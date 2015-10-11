function cpmtest
    % Author:         Anemone
    % Filename:       cpmtest.m
    % Last modified:  2015-08-29 14:46
    % E-mail:         x565178035@126.com

    s=[ 1, 1, 1,2,3,3, 4, 5, 5, 5,6, 6, 7 ];
    e=[ 2, 3, 4,5,4,5, 6, 6, 7, 8,7, 8, 8 ];
    t=[ 5,10,11,4,4,0,15,21,25,35,0,20,15 ];
    st=[5, 8, 8,3,4,0,15,16,22,30,0,16,12 ];
  free=[inf,700,400,450,inf,inf,inf,600,300,500,400,500,400];

    [a,b]=OptimCPM(s,e,t,st,free,49)
    % earlyStart=double(earlyStart);
end

function [pos,obj]=OptimCPM(s,e,t,st,free,d)
    pointNum=max(e);
    x=sdpvar(1,pointNum);
    y=sdpvar(1,length(s));
    obj=sum(y.*free);
    F=[x>=0 x(pointNum)<=d y>=0];
    for i=1:length(s)
        F=[F x(e(i))-x(s(i))>=t(i)-y(i)];
    end
    for i=1:length(s)
        F=[F y(i)<=t(i)-st(i)];
    end
    optimize(F,obj);
    pos=value(y);
    obj=double( value(obj) );
end
