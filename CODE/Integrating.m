function [TSTDTY,group,cgrouping,grouping]=Integrating(CMQ)
%--------------------------------------------------------------------------
%Integration function 
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

[Order,Part]=Gabow(CMQ);
[CMPCMQ,group,cgrouping,grouping,ID]=CMP(CMQ,Part);
TSTDTY=GSLY(CMPCMQ,cgrouping);