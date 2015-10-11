X=[
16.47,96.10
16.47,94.44
20.09,92.54
22.39,93.37
25.23,97.24
22.00,96.05
20.47,97.02
17.29,96.29
16.30,97.38
14.05,98.12
16.53,97.38
21.52,95.59
20.09,92.55];
NIND=1000;
MAXGEN=100;
Pc=0.9;
Pm=0.2;
GGAP=0.9;
D=Distance(X);
N=size(D,1);

Chrom=InitPop(NIND,N);

Rlength=PathLength(D,Chrom(1,:));

gen=0;
ObjV=PathLength(D,Chrom);
preObjV=min(ObjV);
while gen<MAXGEN
    ObjV=PathLength(D,Chrom);
%    min(ObjV)
    FitnV=Fitness(ObjV);
    SelCh=Select(Chrom,FitnV,GGAP);
    SelCh=Recombin(SelCh,Pc);
    SelCh=Mutate(SelCh,D);
    SelCh=Reverse(SelCh,D);
    Chrom=Reins(Chrom,SelCh,ObjV);
    gen=gen+1
end

ObjV=PathLength(D,Chrom);

[minObjV,minInd]=min(ObjV);
