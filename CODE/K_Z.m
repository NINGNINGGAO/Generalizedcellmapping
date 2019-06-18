function SE=K_Z(C_SE,bcell)
%--------------------------------------------------------------------------
%Convert coordinate number to cell number
% 
%input argument
%           C_SE:coordinate number
%output argument
%           SE: cell number
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

m=length(bcell);
temp=1;
SE=C_SE(:,1);
for i=2:m
    temp=temp*bcell(i-1);
    SE=SE+(C_SE(:,i)-1)*temp;
end