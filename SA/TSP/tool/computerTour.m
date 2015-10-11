function len=computerTour(X)   %计算路线总长度，每个城市只计算和下家城市之间的距�??
    len=0;
    global city
    n=20;
    for j=1:n-1
        len=len+sqrt((city(X(j)).x-city(X(j+1)).x)^2+(city(X(j)).y-city(X(j+1)).y)^2);        
    end
    len=len+sqrt((city(X(n)).x-city(X(1)).x)^2+(city(X(n)).y-city(X(1)).y)^2);
end
