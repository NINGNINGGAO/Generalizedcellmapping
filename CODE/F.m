function fttao=F(ftao,bcell,interval,widght,cellnumjy)
%--------------------------------------------------------------------------
%Convert coordinates of cell to cell number, Convert inf to coordinates of trap cell
% 
%input argument
%           ftao:coordinates of cell
%output argument
%           fttao:cell number
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

[n,m]=size(ftao);
mid=zeros(n,m);
fttao=zeros(n,1);
for i=1:m
    [temp1,~]=find(ftao(:,i)<=interval(2*i-1));
    [temp2,~]=find(ftao(:,i)>=interval(2*i));
    ftao(temp1,i)=inf;
    ftao(temp2,i)=inf;
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     BEGIN   
%     [temp3,~]=find(ftao(:,i)==nan);
%     [temp4,~]=find(ftao(:,i)==nan);
%     ftao(temp3,i)=inf;
%     ftao(temp4,i)=inf;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     END
    
    mid(:,i)=fix((ftao(:,i)-interval(2*i-1))/widght(i))+1;
end
fttao=K_Z(mid,bcell);
[temp3,~]=find(fttao==inf);
fttao(temp3)=cellnumjy;