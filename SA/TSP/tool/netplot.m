function netplot(X)        %连线各城市，将路线画出来
    n=20;
    hold on;
    global city
    for i=1:n-1
        plot(city(X(i)).x,city(X(i)).y,'r*');  
        line([city(X(i)).x city(X(i+1)).x],[city(X(i)).y city(X(i+1)).y]);  %只连线当前城市和下家城市     
    end

    plot(city(X(n)).x,city(X(n)).y,'r*');  
    line([city(X(n)).x city(X(1)).x],[city(X(n)).y city(X(1)).y]);     %最后一家城市连线第一家城市
    hold off;
end
