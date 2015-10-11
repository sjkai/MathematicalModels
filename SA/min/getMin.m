clear;
clc;
ObjectiveFunction=@myFirstSA;
x0=[0.5 0.5] %≥ı º÷µ
lb=[-10 -10];
ub=[10 10];
options=saoptimset('MaxIter',1e9,'StallIterLim',5000,'TolFun',1e-100,'AnnealingFcn',@annealingfast,'InitialTemperature',10000,'TemperatureFcn',@temperatureexp,'ReannealInterval',500,'PlotFcns',{@saplotbestx,@saplotbestf,@saplotf});
[x,fval]=simulannealbnd(ObjectiveFunction,x0,lb,ub,options)
