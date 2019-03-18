function [cell,cellnum,cellnumjy,smcellnum,widght,tp1,tp2]=para(bcell,smcell,interval,MC,MQ,MemorySize)
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
tp1=fix(MemorySize/(smcellnum*MC*MQ));%电脑的内存必须大，否则分块,取决于内存或者显卡内存，CPU推荐使用1e+7，GPU推荐使用3e+8
tp2=ceil(cellnum/tp1);