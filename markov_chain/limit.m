function x=limit(p)
    % Author:         Anemone
    % Filename:       limit.m
    % Last modified:  2015-08-30 14:57
    % E-mail:         x565178035@126.com

    p=[0.8 0.1 0.1;0.5 0.1 0.4;0.5 0.3 0.2];
    p=sym(p');
    [x,y]=eig(p);
    for i=1:3
        x(:,i)=x(:,i)/sum(x(:,i));
    end
    x=double(x);
    x(:,1)
end

