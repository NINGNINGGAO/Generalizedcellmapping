function [Order,Part]=Gabow(CMQ)
%--------------------------------------------------------------------------
%Gabow Algorithm
%
%input argument
%           CMQ:One-step transition probability matrix,but value is one,
%                   not probability
%output argument
%           Order:Access Sequence
%           Part:strongly connected components
%
%author:NINGNINGGAO
%--------------------------------------------------------------------------

[m,~]=size(CMQ);
Order=-ones(m,1);
Part=Order;
temp=1;
mid=0;

set(0,'RecursionLimit',1000);
while any(Order==-1)
    Path=[];
    Root=[];
    [v,~]=find(Order==-1,1);
    try
        [temp,mid,Order,Part,Path,Root]=Gabowwolf(CMQ,m,v,temp,mid,Order,Part,Path,Root);
    catch
        warning('insufficient memory')
        disp('This part of algorithm needs to be improved, or larger memory needs to be replaced, or the number of large cells needs to be reduced')
    end
end
end