function C_SE=Z_K(SE,bcell,cellnum)
%--------------------------------------------------------------------------
%Convert cell number to coordinate number
% 
%input argument
%           SE: cell number
%output argument
%           C_SE:coordinate number
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

n=length(SE);
m=length(bcell);
KN=zeros(n,m);
C_SE=zeros(n,m);
C_SE_1=zeros(n,m);
KN(:,m)=SE;
temp=cellnum;
for i=m:-1:2
    temp=temp/bcell(i);
    C_SE_1(:,i)=mod(KN(:,i),temp);
    [mid1,~]=find(C_SE_1(:,i)==0);
    [mid2,~]=find(C_SE_1(:,i)~=0);
    C_SE(mid1,i)=KN(mid1,i)/temp;
    C_SE(mid2,i)=fix(KN(mid2,i)/temp)+1;
    KN(:,i-1)=KN(:,i)-(C_SE(:,i)-1)*temp; 
end
C_SE(:,1)=KN(:,1);