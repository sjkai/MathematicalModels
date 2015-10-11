function len=PathLength(D,Chrom)
    [row,col]=size(D);
    NIND=size(Chrom,1);
    len=zeros(NIND,1);
    for i=1:NIND
        p=[Chrom(i,:) Chrom(i,1)];
        i1=p(1:end-1);
        i2=p(2:end);
        len(i,1)=sum(D((i1-1)*col+i2));
    end
end

