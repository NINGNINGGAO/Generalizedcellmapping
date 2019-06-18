function [gtao,ginterval]=G(C_SE,interval,widght)
%--------------------------------------------------------------------------
%Convert coordinate number to coordinates
% 
%input argument
%           C_SE:coordinate number
%output argument
%           gtao:Coordinates of cell center
%           ginterval:Coordinates of cell vertices
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

[m,n]=size(C_SE);
gtao=zeros(m,n);
ginterval=zeros(m,2*n);
for i=1:n
    gtao(:,i)=interval(2*i-1)+(C_SE(:,i)-0.5)*widght(i);
    ginterval(:,2*i-1)=interval(2*i-1)+(C_SE(:,i)-1)*widght(i);
    ginterval(:,2*i)=interval(2*i-1)+(C_SE(:,i))*widght(i);
end