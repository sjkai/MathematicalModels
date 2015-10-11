function main
    % Author:         Anemone
    % Filename:       main.m
    % Last modified:  2015-09-04 16:18
    % E-mail:         x565178035@126.com
    
    load data1
    r1=hecheng(r)
    r2=hecheng(r1)
    r3=hecheng(r2)
    bh=zeros(12);
    bh(find(r2>0.998))=1
    pause
    load data1
    ind1=[1,5];ind2=[2:3,6,8:11];ind3=[4,7];
    so=[];
    for i=1:length(ind1)
        for j=1:length(ind3)
            for k=1:length(ind2)
                t=[ind1(i),ind3(j),ind2(k)];
                err=wucha(a,t);
                so=[so;[t,err]];
            end
        end
    end
    so
    tm=find(so(:,4)==min(so(:,4)));
    shanchu=so(tm,1:3)
end

function err=wucha(a,t);
    b=a;b(:,t)=[];
    mu1=mean(a,2);mu2=mean(b,2);
    err=sum((mu1-mu2).^2);
end

function rhat=hecheng(r);
    n=length(r);
    for i=1:n
        for j=1:n
            rhat(i,j)=max(min([r(i,:);r(:,j)']));
        end
    end
end
