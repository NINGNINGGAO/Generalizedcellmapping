function [temp,mid,Order,Part,Path,Root]=Gabowwolf(CMQ,m,v,temp,mid,Order,Part,Path,Root)
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

Order(v)=temp;
temp=temp+1;
Path=[Path;v];
Root=[Root;v];

[next,~]=find(CMQ(v,:)'==1);
if isempty(next)==0
    [n,~]=size(next);
    for i=1:n
        if Order(next(i))==-1
            [temp,mid,Order,Part,Path,Root]=Gabowwolf(CMQ,m,next(i),temp,mid,Order,Part,Path,Root);
        else
            if Part(next(i))==-1
                while Order(Root(end))>Order(next(i))
                    Root(end)=[];
                end
            end
        end
    end
end

if v==Root(end)
    Root(end)=[];
    mid=mid+1;
    while 1
        Top=Path(end);
        Part(Top)=mid;
        Path(end)=[];
        if Top==v
            break
        end
    end
end