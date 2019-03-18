function cdnt=smG(ginterval,smcell,widght,smcellnum)
m=length(smcell);
[n,~]=size(ginterval);
cdnt=zeros(n*smcellnum,m);
cdnt_1=zeros(n*smcellnum,m);
cdnt_2=zeros(n*smcellnum,m);
mid1=smcellnum;
mid2=1;
for i=1:m
    temp=[1:smcell(i)]';
    mid1=mid1/smcell(i);
    cdnt_1(:,i)=(repmat(repelem(repmat(temp,mid1,1),mid2),n,1)*2-1)*(widght(m+i)/2);
    mid2=mid2*smcell(i);  
    cdnt_2(:,i)=repelem(ginterval(:,2*i-1),smcellnum,1);
end
cdnt=cdnt_1+cdnt_2;