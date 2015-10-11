function Chrom=InitPop(NIND,N)
    %NIND 种群大小
    %N 单个染色体长度(城市个数)
    Chrom=zeros(NIND,N);
    for i=1:NIND
        Chrom(i,:)=randperm(N); %随机产生种群
    end
end
