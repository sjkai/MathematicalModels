function [train,test]=ChooseData(data)
    % Author:         Anemone
    % Filename:       test.m
    % Last modified:  2015-09-02 20:39
    % E-mail:         x565178035@126.com
    feature=[];
    for eachCow=data
        [maxNum,maxPos]=max(eachCow);
        [minNum,minPos]=min(eachCow);
        feature=union(feature,maxPos);
        feature=union(feature,minPos);
    end
    dataNum=size(data,1);
    rand_=randperm(dataNum);
    needToChoose=floor(dataNum*0.9)
    train=union(feature,rand_(1:needToChoose));
    test=rand_(needToChoose:end);
    train=data(train,:);
    test=data(test,:);
end

