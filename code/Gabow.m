function [Order,Part]=Gabow(CMQ)
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
    [temp,mid,Order,Part,Path,Root]=Gabowwolf(CMQ,m,v,temp,mid,Order,Part,Path,Root);
end