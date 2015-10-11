function sortResult=FuzzySort(matrix,strict)
    % Author:         Anemone
    % Filename:       FuzzySort.m
    % Last modified:  2015-09-04 16:11
    % E-mail:         x565178035@126.com
    if nargin==1
        strict=0.998;
    end
    r=matrix;
    r1=hecheng(r);
    while ~all(r1==r)
        r=r1;
        r1=hecheng(r1);
    end
    dataNum=size(matrix,1);
    bh=zeros(dataNum);
    bh(find(r1>strict))=1;
    model=unique(bh','rows');
    num=size(model,1);
    sortResult=zeros(1,dataNum);
    for i=1:dataNum
        for j=1:num
            if all(bh(:,i)==model(j,:)')
                sortResult(i)=j;
            end
        end
    end
end

function rhat=hecheng(r);
    n=length(r);
    for i=1:n
        for j=1:n
            rhat(i,j)=max(min([r(i,:);r(:,j)']));
        end
    end
end
