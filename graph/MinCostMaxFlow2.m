function [flow,val]=MinCostMaxFlow2(rongliang,cost,flowvalue);
    %第一个参数：容量矩阵；第二个参数：费用矩阵；
    %前两个参数必须在不通路处置零
    %第三个参数：指定容量值（可以不写，表示求最小费用最大流）
    %返回值flow 为可行流矩阵,val 为最小费用值
    num=length(rongliang);
    M=sum(sum(rongliang))*num^2;
    flow=zeros(size(rongliang));allflow=sum(flow(1,:));
    if nargin<3
        flowvalue=M;
    end
    while allflow<flowvalue
        w=(flow<rongliang).*cost-((flow>0).*cost)';
        path=floydpath(w,rongliang);%调用floydpath 函数
        if isempty(path)
            val=sum(sum(flow.*cost));
            return;
        end
        theta=min(min(path.*(rongliang-flow)+(path.*(rongliang-flow)==0).*M));
        theta=min([min(path'.*flow+(path'.*flow==0).*M),theta]);
        flow=flow+(rongliang>0).*(path-path').*theta;
        allflow=sum(flow(1,:));
    end
    val=sum(sum(flow.*cost));
end

function path=floydpath(w,u);
    num=length(w);
    M=sum(sum(u))*num^2;
    w=w+((w==0)-eye(num))*M;
    p=zeros(num);
    for k=1:num
        for i=1:num
            for j=1:num
                if w(i,j)>w(i,k)+w(k,j)
                    w(i,j)=w(i,k)+w(k,j);
                    p(i,j)=k;
                end
            end
        end
    end
    if w(1,num) ==M
        path=[];
    else
        path=zeros(num);
        s=1;t=num;m=p(s,t);
        while ~isempty(m)
            if m(1)
                s=[s,m(1)];t=[t,t(1)];t(1)=m(1);
                m(1)=[];m=[p(s(1),t(1)),m,p(s(end),t(end))];
            else
                path(s(1),t(1))=1;s(1)=[];m(1)=[];t(1)=[];
            end
        end
    end
end
