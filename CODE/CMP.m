function [CMPCMQ,group,cgrouping,grouping,ID]=CMP(CMQ,Part)
%--------------------------------------------------------------------------
%Compressed digraph
% 
%input argument
%           CMQ:One-step transition probability matrix,but value is one,
%                   not probability
%           Part:strongly connected components
%output argument
%           CMPCMQ:Compressed digraph
%           group:Uncompressed cell
%           cgrouping:compressed cell
%           grouping:Compressed cell number
%           ID:Corresponding uncompressed cell number
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

[m,~]=size(CMQ);
grouping=[1:m]';
IDM=[1:m]';
group=zeros(m,1);
b=1;
d=-1;

temp=unique(Part);
temp1=histc(Part,temp);
[temp2,~]=find(temp1>1);

mid=diag(CMQ);
mid(end)=[];
[mid1,~]=find(mid==1);
[mid2,~]=size(mid1);
for j=1:mid2
    if ismember(Part(mid1(j)),temp2)
        continue
    else
        mid3=sum(CMQ(mid1(j),:));
        if mid3==1
            group(mid1(j))=b;
            b=b+1;
        else
            group(mid1(j))=d;
            d=d-1;
        end
    end
end


[n,~]=size(temp2);
for i=1:n
    [temp3,~]=find(Part==temp2(i));
    temp4=sum(CMQ(temp3,:),1)';
    temp5=sum(CMQ(:,temp3),2);
    temp4(temp4>1)=1;
    temp5(temp5>1)=1;
    
    [tempp1,~]=find(temp4==1);
    [tempp2,~]=find(temp5==1);
    tempp3=intersect(tempp1,tempp2);
    [p,~]=size(tempp1);
    [q,~]=size(tempp3);
    if p==q
        group(tempp3)=b;
        b=b+1;
    else
        group(tempp3)=d;
        d=d-1;
    end
    
    IDM(temp3)=temp3(1);
    CMQ(temp3(1),:)=temp4';
    CMQ(:,temp3(1))=temp5;
end

group(end)=b;

cgrouping=group;
[~,IC,ID]=unique(IDM,'stable');
if max(ID)<max(IDM)
    CMPCMQ=CMQ(IC,IC);
    grouping=grouping(IC);
    cgrouping=cgrouping(IC);
else
    CMPCMQ=CMQ;
end