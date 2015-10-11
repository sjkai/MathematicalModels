function res=StepFit(test,score)
    [b,se,pval,inmodel,stats]=stepwisefit(test,score,'display','off');
    in=find(inmodel==1);
    inw=b(in);
    choose=[in;inw'];
    stateNum=stats.intercept;
    P=stats.pval;
    res={choose,stateNum,P};
end

