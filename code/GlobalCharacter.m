function [FIR_1,SEC_1,trapD_1,D1_1,D2_1]=GlobalCharacter(bcell,cellnum,interval,widght,FIR,SEC,trapD,D1,D2)
m=length(bcell);
group_1=zeros(cellnum+1,1);

[mid1,~]=size(FIR);
FIR_1=zeros(mid1,1);
for i=1:mid1
    C_SE=Z_K(FIR(i),bcell,cellnum);
    [image,~]=G(C_SE,interval,widght);
    Tp=zeros(1e+2,m+1);
    Tp(1,:)=[FIR(i),image];
    for j=2:1e+2
        image=V1_tode(image);
        fttao=F(image);
        Tp(j,:)=[fttao,image];
    end
    FIR_1(i)=Tp(end,1);
end
FIR_1=unique(FIR_1);
group_1(FIR_1)=1;


[mid1,~]=size(trapD);
[mid2,~]=size(D1);
trapD_1=zeros(mid1,1);
D1_1=zeros(2*mid2,1);
D1_1(1:mid2)=D1;
temp1=1;
temp2=mid2+1;
for i=1:mid1
    C_SE=Z_K(trapD(i),bcell,cellnum);
    [image,~]=G(C_SE,interval,widght);
    Tp=zeros(1e+4,m+1);
    Tp(1,:)=[trapD(i),image];
    for j=2:1e+4
        image=V1_tode(image);
        fttao=F(image);
        if group_1(fttao)>0&&fttao~=cellnumjy
            D1_1(temp2)=trapD(i);
            temp2=temp2+1;
        end
        Tp(j,:)=[fttao,image];
        D=Distance_1(Tp(j,2:end),Tp(j-1,2:end));
        if D>1e+4
            trapD_1(temp1)=trapD(i);
            temp1=temp1+1;
            break
        end
    end
end
temp4=find(trapD_1==0,1);
trapD_1=trapD_1(1:temp3-1);


[mid1,~]=size(D2);
D2_1=zeros(mid1,1);
temp_1=1;
ssmcell=[10,10,10];
ssmcellnum=prod(ssmcell);
smwidght=zeros(2*m,1);
for i=1:m
    smwidght(m+i)=widght(i)/ssmcell(i);
end
for i=1:mid1
    C_SE=Z_K(D2(i),bcell,cellnum);
    [~,ginterval]=G(C_SE,interval,widght);
    cdnt=smG(ginterval,ssmcell,smwidght,ssmcellnum);
    IL=zeros(ssmcellnum,1);
    for k=1:ssmcellnum
        image=cdnt(k,:);
        Tp=zeros(1e+2,m+1);
        Tp(1,:)=[D2(i),image];
        for j=2:1e+2
            image=V1_tode(image);
            fttao=F(image);
            Tp(j,:)=[fttao,image];
            if group_1(fttao)>0
                break
            end
        end
        temp=find(Tp(:,1)==0,1);
        IL(k)=Tp(temp-1,1);
    end
    IL_1=unique(IL);
    [mid1,~]=size(IL_1);
    if mid1=1
        temp1=find(D1_1==0,1);
        D1_1(temp1)=D2(i);
    else
        D2_1(temp_1)=D2(i);
        temp_1=temp_1+1;
    end
end
temp3=find(D1_1==0,1);
D1_1=D1_1(1:temp3-1);
temp3=find(D2_1==0,1);
D2_1=D2_1(1:temp3-1);



[mid1,~]=size(SEC);
SEC_1=zeros(mid1,1);
deltaT=2*pi;
h=0.01;
num=fix(deltaT/h);
temp=1;
for i=1:mid1
    C_SE=Z_K(SEC(i),bcell,cellnum);
    [image,~]=G(C_SE,interval,widght);
    Tp=zeros(1e+2,m+1);
    Tp(1,:)=[SEC(i),image];
    for j=2:num
        image=V1_tode(image);
        fttao=F(image);
        Tp(j,:)=[fttao,image];
    end
    if Tp(end,1)=SEC(i)
        SEC_1(temp)=SEC(i);
        temp=temp+1;
    end
end
temp1=find(SEC_1==0,1);
SEC_1=SEC_1(1:temp1-1);
group_1(SEC_1)=-1;

    
    
    
    
    
    
    