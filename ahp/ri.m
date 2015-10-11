function RI=ri(n)
%   compute average random consistent index.

% check input
n=ceil(n);
if n<=0, error('the parameter must be a positive number.'); end
if n==0 || n==1, RI=0; return; end

%   initialize
times=10000;
scaler=[9 8 7 6 5 4 3 2 1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9];
A=zeros(n);
lamda=zeros(times,1);

%   generate 500 random judgement matrix
for num=1:times
    %   generate a random judgement matrix
    rank=ceil(17*rand(n));
    for i=1:n
        for j=i:n
            A(i,j)=scaler(rank(i,j));
            A(j,i)=1/A(i,j);
            A(i,i)=1;
        end
    end
    rigenvector=eig(A);
    lamda(num)=max(rigenvector);
end
lamda_average=sum(lamda)/times;
RI=(lamda_average-n)/(n-1);
