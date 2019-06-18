function [FIR,SEC,D,trapD,D1,D2,SM,UM]=matly(TSTDTY,group,cgrouping,grouping)
%--------------------------------------------------------------------------
%Analytical Matrix TSTDTY
% 
%input argument
%           TSTDTY:destination and Road trip
%           group:Uncompressed cell
%           cgrouping:compressed cell
%           grouping:Compressed cell number
%output argument
%           FIR:attractor
%           SEC:saddle point
%           D:Attraction domains of each attractor,An attractor corresponds to a column
%           trapD:Attraction Domain of Trap Cells
%           D1:Attraction domains of each attractor,including borders
%           D2:Attraction domains of each attractor,excluding borders
%           SM:Stable manifold
%           UM:unstable manifold
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

% [temp1,~]=find(cgrouping==0);
[temp2,~]=find(cgrouping~=0);
% [temp3,~]=find(cgrouping<0);
[temp4,~]=find(cgrouping>0);
[temp5,~]=find(cgrouping<=0);
% [mid1,~]=size(temp1);
[mid2,~]=size(temp2);
% [mid3,~]=size(temp3);
[mid4,~]=size(temp4);
% [mid5,~]=size(temp5);

[m,~]=size(cgrouping);
ID=[1:m]';
ID1=ID(temp5);

FIR=find(group>0);
trapcell=FIR(end);
FIR(end)=[];
SEC=find(group<0);

dtag=TSTDTY(:,[1:mid4]);

dtag_1=TSTDTY(:,mid4);
[tempmid1,]=find(dtag_1(:,end)==1);
tempmid1=unique(tempmid1);
trapD_1=ID1(tempmid1);
trapD=FCMP(trapD_1,group,cgrouping,grouping);

tempmid6=sum(dtag,2);
[tempmid7,~]=find(tempmid6>1);
tempmid7=unique(tempmid7);
% Domainatt=ID1(tempmid7);
% Domainatt=FCMP(Domainatt,group,cgrouping,grouping);

D=dtag(:,[1:mid4-1]);
[tempmid2,~]=find(dtag(:,[1:mid4-1])==1);
tempmid3=unique(tempmid2);
D1=ID1(tempmid3);
D1=FCMP(D1,group,cgrouping,grouping);
[~,price1,~]=intersect(tempmid3,tempmid7);
tempmid3(price1)=[];
D2=ID1(tempmid3);
D2=FCMP(D2,group,cgrouping,grouping);

dtag1=TSTDTY(:,[mid4+1:mid2]);
[tempmid4,~]=find(dtag1==1);
tempmid5=unique(tempmid4);
SM=ID1(tempmid5);
SM=FCMP(SM,group,cgrouping,grouping);

dtag2=TSTDTY(:,[mid2+1:end]);
[tempmid8,~]=find(dtag2==1);
tempmid9=unique(tempmid8);
UM=ID1(tempmid9);
UM=FCMP(UM,group,cgrouping,grouping);
