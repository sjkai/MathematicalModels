function net=EzCom(p,n)
    % Author:         Anemone
    % Filename:       EzCom.m
    % Last modified:  2015-08-29 22:13
    % E-mail:         x565178035@126.com
    % 提取结果:
    % t_sim_compet_1 = sim(net,P_train);
    % T_sim_compet_1 = vec2ind(t_sim_compet_1);
    p=p';
    P_train = mapminmax(p);
    % 训练集——35个样本

    %% 竞争神经网络创建、训练及仿真测试
    %
    % 创建网络
    net = newc(minmax(P_train),4,0.01,0.01);
    % 设置训练参数
    %
    if nargin<2
        net.trainParam.epochs = 500;
    end
    % 训练网络
    net = train(net,P_train);
end

