function newx=arrise(X)  
    n=20;
    currentx=X;
    newx=currentx;

    %随机置换两个不同的城市的坐标
    %产生随机扰动
    p1=randi(n,1,1);
    p2=randi(n,1,1);

    while p1==p2
        p1=randi(n,1,1);
        p2=randi(n,1,1);
    end
    
    newx(p1)=currentx(p2);
    newx(p2)=currentx(p1);
end
