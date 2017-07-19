% load('0.6Dt.mat');
% load('0.6Dt0.mat');
% load('0.6dtDelta.mat');
% Dt_06 = cell2mat(Dt);
% Dt0_06 = cell2mat(Dt0);
% DtDelta_06 = dtDelta;
% load('6Dt.mat');
% load('6Dt0.mat');
% load('6dtDelta.mat');
% Dt_6 = cell2mat(Dt);
% Dt0_6 = cell2mat(Dt0);
% DtDelta_6 = dtDelta;
% load('8Dt.mat');
% load('8Dt0.mat');
% load('8dtDelta.mat');
% Dt_8 = cell2mat(Dt);
% Dt0_8 = cell2mat(Dt0);
% DtDelta_8 = dtDelta;
load('10Dt.mat');
load('10Dt0.mat');
load('10dtDelta.mat');
Dt_10 = cell2mat(Dt);
Dt0_10 = cell2mat(Dt0);
DtDelta_10 = dtDelta;
x=1:500
%plot(x, Dt_60,x, Dt_80,x, Dt_100,x, Dt_120,x, Dt_140,x, Dt_160,x, Dt_180,x, Dt_200);
plot(x, Dt_10);
legend('Dt\_10','Location','best')