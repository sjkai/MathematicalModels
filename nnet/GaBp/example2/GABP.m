function RES=GABP(P,T)
    inputNum=size(P,2);
    outputNum=size(T,2);
    hiddenNum=2*inputNum+1;
    w1num=inputNum*hiddenNum;
    w2num=outputNum*hiddenNum;
    N=w1num+hiddenNum+w2num+outputNum;

    bound=repmat([-0.5 0.5],N,1);
    gaRes=EzGA(bound,@fun,20,{P,T});
    RES=EzBP(P,T,gaRes{2});
end
