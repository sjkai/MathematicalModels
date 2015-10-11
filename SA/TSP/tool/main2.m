n=20;
temperature=100*n;
iter=100;

global city
city=struct([]);
load 'city.mat'
X=1:n;
ObjectiveFunction=@computerTour;

options=saoptimset('MaxIter',5e8,'StallIterLim'5e5,'TolFun',1e-8,'AnnealingFcn',@perturbTour,'InitialTemperature',100*n,'TemperatureFcn',@temp99,'ReannealInterval',500,'PlotFcns',{@saplotbestx,@saplotbestfx,@saplotfx});

[x,fval]=simulannealbnd(ObjectiveFunction,X,[],[],options);
figure;
netplot(x)
    
