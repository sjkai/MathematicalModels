function r=GrayCorr(bj,ck,rho)
    % Author:         Anemone
    % Filename:       GrayCorr.m
    % Last modified:  2015-09-06 19:19
    % E-mail:         x565178035@126.com
    % e.g.
    % ck=data(6:end,:);
    % bj=data(1:5,:);
    % GrayCorr(ck,bj,0.5)
    % GrayCorr(ck,bj)
    % GrayCorr(data)
    
    if nargin==1
        rho=0.5;
        ck=bj;
    end
    if nargin==2
        rho=0.5;
    end
    n=size(bj,1);
    for i=1:n
        bj(i,:)=bj(i,:)/bj(i,1); %标准化数据
    end
    n=size(ck,1);
    for i=1:n
        ck(i,:)=ck(i,:)/ck(i,1); %标准化数据
    end

    m1=size(ck,1);
    m2=size(bj,1);
    for i=1:m1
        for j=1:m2
            t(j,:)=bj(j,:)-ck(i,:);
        end
        jc1=min(min(abs(t')));jc2=max(max(abs(t')));
        ksi=(jc1+rho*jc2)./(abs(t)+rho*jc2);
        rt=sum(ksi')/size(ksi,2);
        r(i,:)=rt;
    end
    r=r';
end

