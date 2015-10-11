function res=EzSA(X,ObjFun,ArriseNew)
    [ra,co]=size(X);
    RES=[ObjFun(X)];  %每次迭代后的结果 
    temperature=100*co;      %初始温度
    iter=5e2;               %内部蒙特卡洛循环迭代次数

    h=waitbar(0,'SAing....');
    while temperature>1e-2    %停止迭代温度
        
        for i=1:iter     %多次迭代扰动，一种蒙特卡洛方法，温度降低之前多次实验
            len1=ObjFun(X);         %计算原路线总距离
            tmpX=ArriseNew(X);      %产生随机扰动
            len2=ObjFun(tmpX);     %计算新路线总距离
            
            delta_e=len2-len1;  %新老距离的差值，相当于能量
            if delta_e<0        %新路线好于旧路线，用新路线代替旧路线
                X=tmpX;
            else                        %温度越低，越不太可能接受新解；新老距离差值越大，越不太可能接受新解
                if exp(-delta_e/temperature)>rand() %以概率选择是否接受新解 p=exp(-ΔE/T)
                    X=tmpX;      %可能得到较差的解
                end
            end        
        end
        RES=[RES ObjFun(X)];
        temperature=temperature*0.99;   %温度不断下降
        waitbar((100*co-temperature)^4/(100*co)^4,h,sprintf('Now Temperature:%.2f',temperature));
    end  
    close(h)
    plot(RES);
    res={X,RES(end)};
end
