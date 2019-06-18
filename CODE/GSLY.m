function TSTDTY=GSLY(CMPCMQ,cgrouping)
%--------------------------------------------------------------------------
%destination and Road trip
% 
%input argument
%           CMPCMQ:Compressed digraph
%           cgrouping:compressed cell
%output argument
%           TSTDTY:destination and Road trip
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

[m,~]=size(CMPCMQ);
sign=zeros(m,1);

[temp1,~]=find(cgrouping~=0);
% [temp2,~]=find(cgrouping==0);
[temp3,~]=find(cgrouping<0);
[temp4,~]=find(cgrouping>0);
[temp5,~]=find(cgrouping<=0);
[mid1,~]=size(temp1);
% [mid2,~]=size(temp2);
[mid3,~]=size(temp3);
[mid4,~]=size(temp4);
[mid5,~]=size(temp5);

GS=CMPCMQ;%%destination
LY=CMPCMQ';%%Road trip

sign(temp5)=[1:mid5]';

TSTDTY1=zeros(mid5,mid1);
TSTDTY2=zeros(mid3,mid5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%start       destination
for i=1:mid1
    if i<=mid4
        A1=temp4(i);
    else
        A1=temp3(i-mid4);
    end
    STG=[];
    while 1
        [tempmid1,~]=find(GS(:,A1)==1);
        tempmid2=unique(tempmid1);
        
        [~,tempmid3,~]=intersect(tempmid2,temp4);
        [~,tempmid_3,~]=intersect(tempmid2,A1);
        tempmid3=[tempmid3;tempmid_3];
        tempmid3=unique(tempmid3);
        tempmid2(tempmid3)=[];
        
        A2=tempmid2;
        STG=[STG;A2];
        if isempty(A2)
            break
        end
        A1=A2;
    end
%     tempmid5=unique(STG);
    STG1=sign(STG);
    TSTDTY1(STG1,i)=1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%start       Road trip
for j=1:mid3
    A1=temp3(j);
    STG=[];
    while 1
        [midtemp1,~]=find(LY(:,A1)==1);
        midtemp2=unique(midtemp1);
        
        [~,midtemp3,~]=intersect(midtemp2,temp4);
        [~,midtemp_3,~]=intersect(midtemp2,A1);
        midtemp3=[midtemp3;midtemp_3];
        midtemp3=unique(midtemp3);
        midtemp2(midtemp3)=[];
        
        A2=midtemp2;
        STG=[STG;A2];
        if isempty(A2)
            break
        end
        A1=A2;
    end
    midtemp5=unique(STG);
    STG2=sign(midtemp5);
    TSTDTY2(j,STG2)=1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end
TSTDTY=[TSTDTY1,TSTDTY2'];    


















