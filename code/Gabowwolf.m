function [temp,mid,Order,Part,Path,Root]=Gabowwolf(CMQ,m,v,temp,mid,Order,Part,Path,Root)
Order(v)=temp;
temp=temp+1;
Path=[Path;v];
Root=[Root;v];

[next,~]=find(CMQ(v,:)'==1);
if isempty(next)==0
    [n,~]=size(next);
    for i=1:n
        if Order(next(i))==-1
            [temp,mid,Order,Part,Path,Root]=Gabowwolf(CMQ,m,next(i),temp,mid,Order,Part,Path,Root);%%在此使用了递归
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

%{
author:GNN
gabow算法
代码说明：
步骤1：
在所有顶点中，找一个没有被访问过得结点v，以v为参数执行步骤2。否则完成。
步骤2：
记录v的访问顺序（Order）。
将v压入堆栈Path和Root。
如果v指向其他的邻接顶点，那么对于每个邻接顶点next：
1）如果没有访问过，则以next为参数，递归执行步骤2.
2）如果访问过，而且没有确定它属于哪个强连通分量，弹出Root栈中next之后所有的顶点。
如果Root栈的顶元素等于v，那么在Part中记录顶点对应的强连通分量。
最后递归返回。
%}
