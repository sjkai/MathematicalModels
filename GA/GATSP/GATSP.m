function [minObj,x]=GATSP(N,attach,NIND)
    % Author:         Anemone
    % Filename:       GATSP.m
    % Last modified:  2015-08-31 15:26
    % E-mail:         x565178035@126.com

    MAXGEN=200;
    if nargin<3
        NIND=100;
    end
    Pc=0.9;
    Pm=0.2;
    GGAP=0.9;

    Chrom=InitPop(NIND,N);
    % Rlength=PathLength(D,Chrom(1,:));
    gen=0;
    % ObjV=PathLength(D,Chrom);
    % preObjV=min(ObjV);
    history=[];
    h=waitbar(0,'Evolving....');
    while gen<MAXGEN
        ObjV=PathLength(attach,Chrom);
    %    min(ObjV)
        FitnV=Fitness(ObjV);
        SelCh=Select(Chrom,FitnV,GGAP);
        SelCh=Recombin(SelCh,Pc);
        SelCh=Mutate(SelCh,Pm);
        SelCh=Reverse(SelCh,attach);
        Chrom=Reins(Chrom,SelCh,ObjV);
        history=[history min(ObjV)];
        gen=gen+1;
        waitbar(gen/MAXGEN,h,sprintf('Now Generation:%d',gen));
        if gen>30
            if sum(diff(history(end-30:end)))==0
                break
            end
        end
    end
    close(h)

    ObjV=PathLength(attach,Chrom);
    plot(history)
    title('Fitness curve','fontsize',12);
    xlabel('Evolutionary generation','fontsize',12);ylabel('Option','fontsize',12);
    % axis([0,MAXGEN,0,1])

    [minObj,minInd]=min(ObjV);
    x=Chrom(minInd,:);

end

