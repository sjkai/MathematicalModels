function [bestfitness,x]=EzGA(bound,OptFun,sizepop,attach)
    %% 初始化遗传算法参数
    %初始化参数
    maxgen=50;                         %进化代数，即迭代次数
    if nargin<3
        sizepop=500;
    end
    sizepop
    pcross=0.7;                       %交叉概率选择，0和1之间
    pmutation=0.2;                    %变异概率选择，0和1之间
    
    [ra co]=size(bound);

    lenchrom=ones(1,ra);          %每个变量的字串长度，如果是浮点变量，则长度都为1


    individuals=struct('fitness',zeros(1,sizepop), 'chrom',[]);  %将种群信息定义为一个结构体
    avgfitness=[];                      %每一代种群的平均适应度
    bestfitness=[];                     %每一代种群的最佳适应度
    bestchrom=[];                       %适应度最好的染色体

    %% 初始化种群计算适应度值
    % 初始化种群
    for i=1:sizepop
        %随机产生一个种群
        individuals.chrom(i,:)=Code(lenchrom,bound);   
        x=individuals.chrom(i,:);
        %计算适应度
        if nargin==4
            individuals.fitness(i)=OptFun(x,attach);   %染色体的适应度
        else
            individuals.fitness(i)=OptFun(x);   %染色体的适应度
        end
    end
    %找最好的染色体
    [bestfitness bestindex]=min(individuals.fitness);
    bestchrom=individuals.chrom(bestindex,:);  %最好的染色体
    avgfitness=sum(individuals.fitness)/sizepop; %染色体的平均适应度
    % 记录每一代进化中最好的适应度和平均适应度
    traceA=[avgfitness bestfitness]; 
%y=x(1)^2-10*cos(2*pi*x(1))+10+x(2)^2-10*cos(2*pi*x(2))+10;

    %% 迭代寻优
    % 进化开始
    h=waitbar(0,'Evolving....');
    for i=1:maxgen
        % 选择
        individuals=Select(individuals,sizepop); 
        avgfitness=sum(individuals.fitness)/sizepop;
        %交叉
        individuals.chrom=Cross(pcross,lenchrom,individuals.chrom,sizepop,bound);
        % 变异
        individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop,[i maxgen],bound);
        
        % 计算适应度 
        for j=1:sizepop
            x=individuals.chrom(j,:); %解码
            if nargin==4
                individuals.fitness(j)=OptFun(x,attach);   %染色体的适应度
            else
                individuals.fitness(j)=OptFun(x);   %染色体的适应度
            end
        end
        
      %找到最小和最大适应度的染色体及它们在种群中的位置
        [newbestfitness,newbestindex]=min(individuals.fitness);
        [worestfitness,worestindex]=max(individuals.fitness);
        % 代替上一次进化中最好的染色体
        if bestfitness>newbestfitness
            bestfitness=newbestfitness;
            bestchrom=individuals.chrom(newbestindex,:);
        end
        individuals.chrom(worestindex,:)=bestchrom;
        individuals.fitness(worestindex)=bestfitness;
        
        avgfitness=sum(individuals.fitness)/sizepop;
        
        traceA=[traceA;avgfitness bestfitness]; %记录每一代进化中最好的适应度和平均适应度
        waitbar(i/maxgen,h,sprintf('Now Generation:%d',i));
        if i>30
            if sum(diff(traceA(end-30:end,2)))==0
                break
            end
        end
    end
    close(h)
    %进化结束

    %% 结果分析
    [r c]=size(traceA);
    plot([1:r]',traceA(:,2),'r-');
    title('Fitness curve','fontsize',12);
    xlabel('Evolutionary generation','fontsize',12);ylabel('Fitness','fontsize',12);
    axis([0,maxgen,0,1])
    x=bestchrom;
    % 窗口显示
end
