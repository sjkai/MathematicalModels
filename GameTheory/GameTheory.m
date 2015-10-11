function [x,y]=GameTheory(c1,c2)
    % Author:         Anemone
    % Filename:       GameTheory.m
    % Last modified:  2015-08-30 20:43
    % E-mail:         x565178035@126.com
    % eg.
    % c1=[14,13,12;13,12,12;12,12,13];
    % c2=[13,14,15;14,15,15;15,15,14];
    % [x,y]=gt(c1,c2)
    
    [row,cow]=size(c1);
    x=sdpvar(1,row);
    y=sdpvar(1,cow);
    F=[];
    for i=c1'
        F=[F y*i<=x*c1*y'];
    end
    for i=c2
        F=[F x*i<=x*c2*y'];
    end
    F=[F sum(x)==1 sum(y)==1 x>=0 y>=0];
    optimize(F);
    x=value(x);
    y=value(y);
    x=double(x);
    y=double(y);
end

