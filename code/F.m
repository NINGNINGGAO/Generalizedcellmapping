function fttao=F(ftao,bcell,interval,widght,cellnumjy)
[n,m]=size(ftao);
mid=zeros(n,m);
fttao=zeros(n,1);
for i=1:m
    [temp1,~]=find(ftao(:,i)<=interval(2*i-1));
    [temp2,~]=find(ftao(:,i)>=interval(2*i));
    ftao(temp1,i)=inf;
    ftao(temp2,i)=inf;
    mid(:,i)=fix((ftao(:,i)-interval(2*i-1))/widght(i))+1;
end
fttao=K_Z(mid,bcell);%fttao为一个数，mid为数组
[temp3,~]=find(fttao==inf);
fttao(temp3)=cellnumjy;