function RES=GABP(P,T)
    inputNum=size(P,2);
    outputNum=size(T,2);
    P_T=[P T];
    [train,test]=ChooseData(P_T);
    trainX=train(:,1:inputNum);
    trainY=train(:,inputNum+1:end);
    testX=test(:,1:inputNum);
    testY=test(:,inputNum+1:end);
    hiddenNum=2*inputNum+1;
    w1num=inputNum*hiddenNum;
    w2num=outputNum*hiddenNum;
    N=w1num+hiddenNum+w2num+outputNum;

    bound=repmat([-0.5 0.5],N,1);
    [best,x]=EzGA(bound,@fun,100,{trainX,trainY,testX,testY});
    RES=EzBP(trainX,trainY,x,testX,testY);
end
