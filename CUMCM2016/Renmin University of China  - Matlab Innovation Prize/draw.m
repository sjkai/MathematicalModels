load('60Dt.mat');
load('60Dt0.mat');
load('60dtDelta.mat');
Dt_60 = cell2mat(Dt);
Dt0_60 = cell2mat(Dt0);
DtDelta_60 = dtDelta;
load('80Dt.mat');
load('80Dt0.mat');
load('80dtDelta.mat');
Dt_80 = cell2mat(Dt);
Dt0_80 = cell2mat(Dt0);
DtDelta_80 = dtDelta;
load('100Dt.mat');
load('100Dt0.mat');
load('100dtDelta.mat');
Dt_100 = cell2mat(Dt);
Dt0_100 = cell2mat(Dt0);
DtDelta_100 = dtDelta;
load('120Dt.mat');
load('120Dt0.mat');
load('120dtDelta.mat');
Dt_120 = cell2mat(Dt);
Dt0_120 = cell2mat(Dt0);
DtDelta_120 = dtDelta;
load('140Dt.mat');
load('140Dt0.mat');
load('140dtDelta.mat');
Dt_140 = cell2mat(Dt);
Dt0_140 = cell2mat(Dt0);
DtDelta_140 = dtDelta;
load('160Dt.mat');
load('160Dt0.mat');
load('160dtDelta.mat');
Dt_160 = cell2mat(Dt);
Dt0_160 = cell2mat(Dt0);
DtDelta_160 = dtDelta;
load('180Dt.mat');
load('180Dt0.mat');
load('180dtDelta.mat');
Dt_180 = cell2mat(Dt);
Dt0_180 = cell2mat(Dt0);
DtDelta_180 = dtDelta;
load('200Dt.mat');
load('200Dt0.mat');
load('200dtDelta.mat');
Dt_200 = cell2mat(Dt);
Dt0_200 = cell2mat(Dt0);
DtDelta_200 = dtDelta;
x=1:500
plot(x, Dt_60,x, Dt_80,x, Dt_100,x, Dt_120,x, Dt_140,x, Dt_160,x, Dt_180,x, Dt_200);