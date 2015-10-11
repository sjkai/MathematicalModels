function y = fun(x,attach)
%函数用于计算粒子适应度值
%x           input           输入粒子 
%y           output          粒子适应度值 


bpRes=EzBP(attach{1},attach{2},x',attach{3},attach{4});
y=bpRes{3};
