n=20;
load 'city.mat'
global city
X=1:n;
res=EzSA(X,@computerTour,@arrise);
figure;
