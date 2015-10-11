function [Alpha1,Alpha2,Alpha,Flag,B]=SVMNR(X,Y,Epsilon,C,TKF,Para1,Para2)
    %%
    % SVMNR.m
    % Support Vector Machine for Nonlinear Regression
    % All rights reserved
    %%
    % 支持向量机非线性回归通用程序
    % 程序功能：
    % 使用支持向量机进行非线性回归，得到非线性函数y=f(x1,x2,…,xn)的支持向量解析式，
    % 求解二次规划时调用了优化工具箱的quadprog函数。本函数在程序入口处对数据进行了
    % [-1,1]的归一化处理，所以计算得到的回归解析式的系数是针对归一化数据的，仿真测
    % 试需使用与本函数配套的Regression函数。
    % 输入参数列表
    % X 输入样本原始数据，n×l的矩阵，n为变量个数，l为样本个数
    % Y 输出样本原始数据，1×l的矩阵，l为样本个数
    % Epsilon ε不敏感损失函数的参数，Epsilon越大，支持向量越少
    % C 惩罚系数，C过大或过小，泛化能力变差
    % TKF Type of Kernel Function 核函数类型
    % TKF=1 线性核函数，注意：使用线性核函数，将进行支持向量机的线性回归
    % TKF=2 多项式核函数
    % TKF=3 径向基核函数
    % TKF=4 指数核函数
    % TKF=5 Sigmoid核函数
    % TKF=任意其它值，自定义核函数
    % Para1 核函数中的第一个参数
    % Para2 核函数中的第二个参数
    % 注：关于核函数参数的定义请见Regression.m和SVMNR.m内部的定义
    % 输出参数列表
    % Alpha1 α系数
    % Alpha2 α*系数
    % Alpha 支持向量的加权系数（α－α*）向量
    % Flag 1×l标记，0对应非支持向量，1对应边界支持向量，2对应标准支持向量
    % B 回归方程中的常数项
    %--------------------------------------------------------------------------

    %%
    %-----------------------数据归一化处理--------------------------------------
    nntwarn off
    X=premnmx(X);
    Y=premnmx(Y);
    %%
    %%
    %-----------------------核函数参数初始化------------------------------------
    switch TKF
    case 1
    %线性核函数 K=sum(x.*y)
    %没有需要定义的参数
    case 2
    %多项式核函数 K=(sum(x.*y)+c)^p
    c=Para1;%c=0.1;
    p=Para2;%p=2;
    case 3
    %径向基核函数 K=exp(-(norm(x-y))^2/(2*sigma^2))
    sigma=Para1;%sigma=6;
    case 4
    %指数核函数 K=exp(-norm(x-y)/(2*sigma^2))
    sigma=Para1;%sigma=3;
    case 5
    %Sigmoid核函数 K=1/(1+exp(-v*sum(x.*y)+c))
    v=Para1;%v=0.5;
    c=Para2;%c=0;
    otherwise
    %自定义核函数，需由用户自行在函数内部修改，注意要同时修改好几处！
    %暂时定义为 K=exp(-(sum((x-y).^2)/(2*sigma^2)))
    sigma=Para1;%sigma=8;
    end
    %%
    %%
    %-----------------------构造K矩阵-------------------------------------------
    l=size(X,2);
    K=zeros(l,l);%K矩阵初始化
    for i=1:l
    for j=1:l
    x=X(:,i);
    y=X(:,j);
    switch TKF%根据核函数的类型，使用相应的核函数构造K矩阵
    case 1
    K(i,j)=sum(x.*y);
    case 2
    K(i,j)=(sum(x.*y)+c)^p;
    case 3
    K(i,j)=exp(-(norm(x-y))^2/(2*sigma^2));
    case 4
    K(i,j)=exp(-norm(x-y)/(2*sigma^2));
    case 5
    K(i,j)=1/(1+exp(-v*sum(x.*y)+c));
    otherwise
    K(i,j)=exp(-(sum((x-y).^2)/(2*sigma^2)));
    end
    end
    end
    %%
    %%
    %------------构造二次规划模型的参数H,Ft,Aeq,Beq,lb,ub------------------------
    %支持向量机非线性回归，回归函数的系数，要通过求解一个二次规划模型得以确定
    Ft=[Epsilon*ones(1,l)-Y,Epsilon*ones(1,l)+Y];
    Aeq=[ones(1,l),-ones(1,l)];
    Beq=0;
    ub=C*ones(2*l,1);
    %%
    %%
    %--------------调用优化工具箱quadprog函数求解二次规划------------------------
    OPT=optimset;
    OPT.LargeScale='off';
    OPT.Display='off';
    %%
    %%
    %------------------------整理输出回归方程的系数------------------------------
    Alpha1=(Gamma(1:l,1))';
    Alpha2=(Gamma((l+1):end,1))';
    Alpha=Alpha1-Alpha2;
    Flag=2*ones(1,l);
    %%
    %%
    %---------------------------支持向量的分类----------------------------------
    Err=0.000000000001;
    for i=1:l
    AA=Alpha1(i);
    BB=Alpha2(i);
    if (abs(AA-0)<=Err)&&(abs(BB-0)<=Err)
    Flag(i)=0;%非支持向量
    end
    if (AA>Err)&&(AA<C-ERR)&&(ABS(BB-0)<=ERR)
    Flag(i)=2;%标准支持向量
    end
    if (abs(AA-0)<=Err)&&(BB>Err)&&(BB<C-ERR)
    Flag(i)=2;%标准支持向量
    end
    if (abs(AA-C)<=Err)&&(abs(BB-0)<=Err)
    Flag(i)=1;%边界支持向量
    end
    if (abs(AA-0)<=Err)&&(abs(BB-C)<=Err)
    Flag(i)=1;%边界支持向量
    end
    end
    %%
    %%
    %--------------------计算回归方程中的常数项B---------------------------------
    B=0;
    counter=0;
    for i=1:l
    AA=Alpha1(i);
    BB=Alpha2(i);
    if (AA>Err)&&(AA<C-ERR)&&(ABS(BB-0)<=ERR)
    %计算支持向量加权值
    SUM=0;
    for j=1:l
    if Flag(j)>0
    switch TKF
    case 1
    SUM=SUM+Alpha(j)*sum(X(:,j).*X(:,i));
    case 2
    SUM=SUM+Alpha(j)*(sum(X(:,j).*X(:,i))+c)^p;
    case 3
    SUM=SUM+Alpha(j)*exp(-(norm(X(:,j)-X(:,i)))^2/(2*sigma^2));
    case 4
    SUM=SUM+Alpha(j)*exp(-norm(X(:,j)-X(:,i))/(2*sigma^2));
    case 5
    SUM=SUM+Alpha(j)*1/(1+exp(-v*sum(X(:,j).*X(:,i))+c));
    otherwise
    SUM=SUM+Alpha(j)*exp(-(sum((X(:,j)-X(:,i)).^2)/(2*sigma^2)));
    end
    end
    end
    b=Y(i)-SUM-Epsilon;
    B=B+b;
    counter=counter+1;
    end
    if (abs(AA-0)<=Err)&&(BB>Err)&&(BB<C-ERR)
    SUM=0;
    for j=1:l
    if Flag(j)>0
    switch TKF
    case 1
    SUM=SUM+Alpha(j)*sum(X(:,j).*X(:,i));
    case 2
    SUM=SUM+Alpha(j)*(sum(X(:,j).*X(:,i))+c)^p;
    case 3
    SUM=SUM+Alpha(j)*exp(-(norm(X(:,j)-X(:,i)))^2/(2*sigma^2));
    case 4
    SUM=SUM+Alpha(j)*exp(-norm(X(:,j)-X(:,i))/(2*sigma^2));
    case 5
    SUM=SUM+Alpha(j)*1/(1+exp(-v*sum(X(:,j).*X(:,i))+c));
    otherwise
    SUM=SUM+Alpha(j)*exp(-(sum((X(:,j)-X(:,i)).^2)/(2*sigma^2)));
    end
    end
    end
    b=Y(i)-SUM+Epsilon;
    B=B+b;
    counter=counter+1;
    end
    end
    if counter==0
    B=0;
    else
    B=B/counter;
end
