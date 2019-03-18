%%
clear;clc;format long
bcell=[9 9 9];%大胞
smcell=[1 1 1];%小胞
interval=[-0.15 0.35 -1 1 -0.01 1.8]';%%[x1min x1max x2min x2max x3min x3max]
MC=2;%蒙特卡洛模拟次数
t=0;%时间t
D=0.1;%噪声强度
h=0.1;%步长
OSS=2;%一步映射步长
MQ=OSS/h;%指的是计算一步映射时，需要的计算量
MemorySize=1e+8;%指的是CPU或GPU内存大小，如果计算量太大，运算可以分块进行，不同电脑此值不同
%% 
[cellnum,smcellnum,widght,CMQmat,CMQ]=GNN(bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS,"SDE");
%%
%矩阵分析算法模块——定量分析
P=MATANA(CMQmat,-100);%P=MATANA(CMQmat,-n,[感兴趣的胞的编号])    可以取为均匀分布，也可以取为集中在某些胞的分布

%只完成了一维的画图，如需修改，在GRA中修改即可
GRA(P,bcell,interval,widght,-1);%此模块为矩阵分析算法 由MATANA与GRA共同构成

%%
%图分析算法模块——定性分析
[Order,Part]=Gabow(CMQ);
[CMPCMQ,group,cgrouping,grouping,ID]=CMP(CMQ,Part);
TSTDTY=GSLY(CMPCMQ,cgrouping);
time=datevec(datestr(now));
eval(['save(''F:\code\GNN\cache\V_',num2str(length(bcell)),'_',num2str(bcell(1)),'_',num2str(smcell(1)),'_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'PP.mat'',''Part'',''CMPCMQ'',''group'',''grouping'',''TSTDTY'');']);
[FIR,SEC,D,trapD,D1,D2,SM,UM]=matly(TSTDTY,group,cgrouping,grouping);
%图分析算法画图，目前只有二维与三维的画图，如需修改，请在NEWplot中修改
NEWplot(FIR,SEC,D,trapD,D1,D2,SM,UM,interval,widght,bcell,cellnum);
saveas(gcf, ['C:/Users/admin/Desktop/picture' num2str(length(bcell)) '_' num2str(bcell(1)) '_' num2str(smcell(1)) '_' num2str(time(1)) '_' num2str(time(2)) '_' num2str(time(3)) '_' num2str(time(4)) '_' num2str(time(5)) '.fig']);
saveas(gcf, ['C:/Users/admin/Desktop/picture' num2str(length(bcell)) '_' num2str(bcell(1)) '_' num2str(smcell(1)) '_' num2str(time(1)) '_' num2str(time(2)) '_' num2str(time(3)) '_' num2str(time(4)) '_' num2str(time(5)) '.jpg']);
MailAddress = '707288044@qq.com';
password = 'hvybqbpqjmygbfic';  
subject = '程序结果已出';
content = '程序已经跑完了！';
MailServer='smtp.qq.com';
eval(['DataPath={''C:\Users\admin\Desktop\picture',num2str(length(bcell)),'_',num2str(bcell(1)),'_',num2str(smcell(1)),'_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'.jpg''};';])
mailTome(MailAddress,password,subject,content,MailServer,DataPath);
datevec(datestr(now))


%%
%需要修改对应的tode,CPU版本只需要修改V_tode即可，GPU版本没有进行整合，确定性系统修改V1_GPU_tode，随机系统修改V2_GPU_tode
%其他的不需要修改，只需要在此界面进行修改即可

%% 
%代码解释部分
% MQ含义需要迭代的次数越多，MQ越大，但是这个值没有考虑维数，高维可能不适用
%OSS指的是0:h:OSS,随机系统的映射步长就是迭代步长。自治系统的映射步长可以选取给定的时间，不同系统值不同。对非自治系统而言，周期系统的映射步长一般取周期，非周期系统可以任意给定
%cellnum指的是不包括陷胞的胞的数量，smcellnum指的是一个大胞中包含的小胞的数量，widght指的是大胞小胞的尺寸，CMQmat指的是一步转移概率矩阵，CMQ指的是一步转移概率矩阵对应的0-1矩阵
% CMPCMQ指的是压缩后的一步转移概率矩阵，group指的是所有胞的分类，cgrouping和grouping类似，TSTDTY指的是最终的胞的归宿
%FIR指的是吸引子，SEC指的是鞍，D指的是每个闭强连通分量的吸引域，trapD指的是陷胞吸引域，D1指的是闭强连通分量的吸引域（所有永久吸引子的吸引域）不包括陷胞的吸引域，但包括所有的边界
%D2指的是闭强连通分量的吸引域（所有永久吸引子的吸引域），不包括吸引域的边界，SM指的是稳定流形，UM指的是不稳定流形
% [cellnum,smcellnum,widght,CMQmat,CMQ,CMPCMQ]=GNN(bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS,"ODE" "SDE" "GPU" "MEMORY");
%P指的是n步迭代之后系统在状态空间的概率分布