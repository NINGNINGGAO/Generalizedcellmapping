%%
clear;clc;
format long
bcell = [200 200];%big cell
smcell = [2 2];%small cell
interval = [-2 2 -2 2]';%%[x1min x1max x2min x2max x3min x3max]
MC = 1;%Monte Carlo
t = 0;%time t
D = 0;%Noise
h = 0.01;%step
OSS = 0.01;%one step mapping
MQ = OSS/h;%calculating number
MemorySize = 1e+8;%CPU or GPU Computing Volume
DL = 0;%quantitative analysis 0/1
DX = 1;%qualitative analysis 0/1
mailme = 0;%mail 0/1

if mailme
    MailAddress = '707288044@qq.com';
    password = 'hvybqbpqjmygbfic';%Non-login password
end

%% core
warning('require more than 2017 version!')
[cellnum,smcellnum,widght,CMQmat,CMQ]=gnn(bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS,"ODE");

%%
%%quantitative analysis
if DL
    P=MATANA(CMQmat,-100);%P=MATANA(CMQmat,-n,[Cells of concern])    uniform distribution or Centralized distribution
    GRA(P,bcell,interval,widght,-1);%%only one-dimensional drawings
end
%%
%%qualitative analysis
if DX
    [TSTDTY,group,cgrouping,grouping]=Integrating(CMQ);
    [FIR,SEC,D,trapD,D1,D2,SM,UM]=matly(TSTDTY,group,cgrouping,grouping);
    NEWplot(FIR,SEC,D,trapD,D1,D2,SM,UM,interval,widght,bcell,cellnum);%%only two-dimensional and three-dimensional drawings
end
%%
if mailme
    time=datevec(datestr(now));
    saveas(gcf, ['data/picture/picture_' num2str(length(bcell)) '_' num2str(bcell(1)) '_' num2str(smcell(1)) '_' num2str(time(1)) '_' num2str(time(2)) '_' num2str(time(3)) '_' num2str(time(4)) '_' num2str(time(5)) '.fig']);
    saveas(gcf, ['data/picture/picture_' num2str(length(bcell)) '_' num2str(bcell(1)) '_' num2str(smcell(1)) '_' num2str(time(1)) '_' num2str(time(2)) '_' num2str(time(3)) '_' num2str(time(4)) '_' num2str(time(5)) '.jpg']);
    eval(['DataPath={''.\data\picture\picture_',num2str(length(bcell)),'_',num2str(bcell(1)),'_',num2str(smcell(1)),'_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'.jpg''};';])
    mailTome(MailAddress,password,DataPath);
    datevec(datestr(now))
end