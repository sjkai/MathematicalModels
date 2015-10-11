function FuzzyDel(rawData,sortRes)
    % Author:         Anemone
    % Filename:       FuzzyDel.m
    % Last modified:  2015-09-04 17:38
    % E-mail:         x565178035@126.com
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

    err=wucha(a,t);
    tm=find(so(:,end)==min(so(:,end)));
    shanchu=so(tm,1:3)
end

function err=wucha(a,t);
    b=a;b(:,t)=[];
    mu1=mean(a,2);mu2=mean(b,2);
    err=sum((mu1-mu2).^2);
end
