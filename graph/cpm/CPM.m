function [earlyStart,lateStart,delay,critical]=CPM(s,e,t)
    % Author:         Anemone
    % Filename:       CPM.m
    % Last modified:  2015-08-29 16:29
    % E-mail:         x565178035@126.com
    % eg.
    % s=[ 1, 1, 1,2,3,3, 4, 5, 5, 5,6, 6, 7 ];
    % e=[ 2, 3, 4,5,4,5, 6, 6, 7, 8,7, 8, 8 ];
    % t=[ 5,10,11,4,4,0,15,21,25,35,0,20,15 ];
    % [e,l,d,c]=CPM(s,e,t)

    pointNum=max(e);
    x=sdpvar(1,pointNum);
    obj=sum(x);
    F=[x>=0];
    % obj=-sum(x);
    % F=[x>=0 x(8)==51];
    for i=1:length(s)
        F=[F x(e(i))>=x(s(i))+t(i)];
    end
    optimize(F,obj);
    earlyStart=value(x);
    earlyStart=double(earlyStart);
    
    y=sdpvar(1,pointNum);
    obj=-sum(y);
    F=[y>=0 y(end)==earlyStart(end)];
    % obj=-sum(x);
    % F=[x>=0 x(8)==51];
    for i=1:length(s)
        F=[F y(e(i))>=y(s(i))+t(i)];
    end
    optimize(F,obj);
    lateStart=value(y);
    lateStart=double(lateStart);
    delay=lateStart-earlyStart;
    critical=find(delay==0);
end
    
