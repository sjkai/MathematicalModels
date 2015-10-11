function RES=EzBP(P,T,x,P_test,T_test)
    %%
    %x个体初始权值和阀值
    %P样本输入
    %T样本输出
    %hiddenNum隐藏层个数
    % X=mapminmax('apply',X,ps);
    % Y=mapminmax('reverse',Y,ts);
    
    nntwarn off
    P=P';
    T=T';
    [P,ps]=mapminmax(P);
    [T,ts]=mapminmax(T);
    [pr,pc]=size(P);
    [tr,tc]=size(T);
    %chooseTest=3901:4000;
    % chooseTest=randi(tc,1,floor(tc*0.1));
    % chooseTrain=1:tc;
    % chooseTrain=setdiff(chooseTrain,chooseTest);
    % P_test=P(:,chooseTest);
    % T_test=T(:,chooseTest);
    % P=P(:,chooseTrain);
    % T=T(:,chooseTrain);


    inputNum=pr;
    outputNum=tr;
    hiddenNum=2*inputNum+1;
    %net=newff(minmax(P),[hiddenNum,outputNum],{'tansig','tansig'},'trainlm'); %隐含层 输出层
    net=newff(minmax(P),[hiddenNum,outputNum],{'tansig','tansig'}); %隐含层 输出层


    
    net.trainParam.epochs=1e5;
    net.trainParam.goal=1e-5;
    net.trainParam.lr=0.05;
    net.trainParam.show=10;
    
    if nargin>=3
        net.trainParam.showwindow=false;
        net.trainParam.time=30;
        w1num=inputNum*hiddenNum;
        w2num=outputNum*hiddenNum;
        w1=x(1:w1num);
        B1=x(w1num+1:w1num+hiddenNum);
        w2=x(w1num+hiddenNum+1:w1num+hiddenNum+w2num);
        B2=x(w1num+hiddenNum+w2num+1:w1num+hiddenNum+w2num+outputNum);
        net.iw{1,1}=reshape(w1,hiddenNum,inputNum);
        net.lw{2,1}=reshape(w2,outputNum,hiddenNum);
        net.b{1}=reshape(B1,hiddenNum,1);
        net.b{2}=reshape(B2,outputNum,1);
    end

    net=train(net,P,T);
    
    % Y=sim(net,P_test);
    % Y=mapminmax('reverse',Y,ts);
    % T_test=mapminmax('reverse',T_test,ts);
    % err=norm(Y-T_test);
    %
    % Y=net(P_test);
    % perf=perform(net,t,y);

    if nargin==5
        P_test=mapminmax('apply',P_test',ps);
        T_test=mapminmax('apply',T_test',ts);
        perf = mse(net,P_test,T_test);
        RES={net,ps,ts,perf};
    else
        RES={net,ps,ts};
    end
    % RES={net,perf};
end
