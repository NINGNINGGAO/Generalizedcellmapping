function [cell,cellnum,cellnumjy,smcellnum,widght,tp1,tp2]=para(bcell,smcell,interval,MC,MQ,MemorySize)
%--------------------------------------------------------------------------
%argument calculation
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

cell=[bcell,smcell];
m=length(bcell);
cellnum=prod(bcell);
cellnumjy=cellnum+1;
smcellnum=prod(smcell);
widght=zeros(2*m,1);
for i=1:m
    widght(i)=(interval(2*i)-interval(2*i-1))/cell(i);
    widght(m+i)=widght(i)/cell(m+i);
end
tp1=fix(MemorySize/(smcellnum*MC*MQ));
tp2=ceil(cellnum/tp1);