function res=MainEle(gj)
    % res{1} 排名 分数
    % df 各指标得分
    [r c]=size(gj);
    gj=zscore(gj); %数据标准化
    r=corrcoef(gj); %计算相关系数矩阵
    [x,y,z]=pcacov(r);

    disp('Total Variance Explained:');
    I=1:c;
    acc=cumsum(z);
    TVE=[I' y z acc]

    mainEleIndex=find(acc<99);

    disp('Main Element:');
    ME=x(:,mainEleIndex)'
    disp('Main Element Module:');
    MIM=z(mainEleIndex)'

    f=repmat(sign(sum(x)),size(x,1),1);
    x=x.*f;
    df=gj*x(:,mainEleIndex);
    tf=df*z(mainEleIndex)/100;
    [standScore,index]=sort(tf,'descend');
    res={[index,standScore],df};
    celldisp(res)
end
