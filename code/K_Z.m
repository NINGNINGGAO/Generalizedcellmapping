function SE=K_Z(C_SE,bcell)%SE为一个数，C_SE为一个胞序号行向量
m=length(bcell);
temp=1;
SE=C_SE(:,1);
for i=2:m
    temp=temp*bcell(i-1);
    SE=SE+(C_SE(:,i)-1)*temp;
end