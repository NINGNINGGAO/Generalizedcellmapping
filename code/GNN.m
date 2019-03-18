function varargout=GNN(varargin)
% [cellnum,smcellnum,widght,CMQmat,CMQ,CMPCMQ,group,cgrouping,grouping,TSTDTY]=GNN(bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS,"ODE" "SDE" "GPU" "MEMORY");
% [cellnum,smcellnum,widght,CMQmat,CMQ]=GNN(bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS,"ODE" "SDE" "GPU" "MEMORY");
%第二个不运行图分析算法模块
nrhs=nargin;
minArgs=11;
maxArgs=13;
narginchk(minArgs,maxArgs)
[bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS]=JD(varargin{1:10});
flagvals = ["ODE" "SDE" "GPU" "MEMORY"];
flaginds = zeros(1,length(flagvals));
for i=11:nrhs
    flag=varargin{i};
    if ~isstring(flag)
        error('INPUT ERROR');
    end
    foundflag=startsWith(flagvals,flag,'IgnoreCase',true);
    if sum(foundflag) ~= 1
        error('INPUT ERROR');
    end
    if flaginds(foundflag)
        error('INPUT ERROR');
    end
    flaginds(foundflag)=1;
end
if sum(flaginds(1:2))==0 || sum(flaginds(1:2))==2
    error('TO MUCH INPUT')
end    
[cell,cellnum,cellnumjy,smcellnum,widght,tp1,tp2]=para(bcell,smcell,interval,MC,MQ,MemorySize);
if flaginds(3)
    if flaginds(1)
    [CMQmat,CMQ]=V1_GPU_MAT(bcell,smcell,interval,cellnum,cellnumjy,smcellnum,widght,tp1,tp2,t,h,OSS);
    end
    if flaginds(2)
    [CMQmat,CMQ]=V2_GPU_MAT(bcell,smcell,interval,cellnum,cellnumjy,smcellnum,widght,tp1,tp2,MC,t,D,h,OSS);
    end
else
    if flaginds(1)
        [CMQmat,CMQ]=V1_MAT(bcell,smcell,interval,cellnum,cellnumjy,smcellnum,widght,tp1,tp2,t,h,OSS);
    end
    if flaginds(2)
        [CMQmat,CMQ]=V2_MAT(bcell,smcell,interval,cellnum,cellnumjy,smcellnum,widght,tp1,tp2,MC,t,D,h,OSS);
    end
end
% if nargout==18
%     [Order,Part]=Gabow(CMQ);
%     [CMPCMQ,group,cgrouping,grouping,ID]=CMP(CMQ,Part);
%     TSTDTY=GSLY(CMPCMQ,cgrouping);
%     [FIR,SEC,D,trapD,D1,D2,SM,UM]=matly(TSTDTY,group,cgrouping,grouping);
% end
if flaginds(4)==1
    time=datevec(datestr(now));
    eval(['save(''F:\code\GNN\cache\V_',num2str(length(bcell)),'_',num2str(bcell(1)),'_',num2str(smcell(1)),'_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'P.mat'',''bcell'',''smcell'',''interval'',''widght'',''CMQmat'',''CMQ'');']);
    %将映射信息存入cache，命名规则为eg:V1_3_1000_2018_12_7P.mat
%     if nargout==10
%         eval(['save(''F:\code\GNN\cache\V_',num2str(length(bcell)),'_',num2str(bcell(1)),'_',num2str(smcell(1)),'_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'P.mat'',''Part'',''CMPCMQ'',''group'',''grouping'',''TSTDTY'',''-append'');']);
%     end
end
varargout{1}=cellnum; varargout{2}=smcellnum; varargout{3}=widght; varargout{4}=CMQmat; varargout{5}=CMQ; 
% if nargout==18
%     varargout{6}=CMPCMQ; varargout{7}=group; varargout{8}=cgrouping; varargout{9}=grouping; varargout{10}=TSTDTY; varargout{11}=FIR; varargout{12}=SEC; varargout{13}=D; varargout{14}=trapD; varargout{15}=D1; varargout{16}=D2; varargout{17}=SM; varargout{18}=UM;
% end
datevec(datestr(now))