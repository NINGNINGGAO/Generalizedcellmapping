% function image=V1_mapping(cdnt)
format long
% bcell=[3 9 5];%空间中分布
% smcell=[3 1 5];%不用调，没影响
% cell=[bcell,smcell];
% interval=[-0.5 0.5 -10 10 -1 1]';%%[x1min x1max x2min x2max x3min x3max]
% m=length(bcell);
% celljy=bcell+1;
% cellnum=prod(bcell);
% cellnumjy=cellnum+1;
% smcellnum=prod(smcell);
% widght=zeros(2*m,1);
% for i=1:m
%     widght(i)=(interval(2*i)-interval(2*i-1))/cell(i);
%     widght(m+i)=widght(i)/cell(m+i);
% end
% gttao=[1:cellnum]';
% C_SE=Z_K(gttao,bcell,cellnum);
% [cdnt,~]=G(C_SE,interval,widght);
% % cdnt=smG(ginterval,smcell,widght,smcellnum);

cdnt=[0 0 0;0.35 0 0;0 -1 0;0 0 1.8];
h=0.1;
t=0;
D=0.1;%%噪声强度

image=cdnt;
% num=2*pi/1.0;
t=0;
% num=num/h;
num=2000;
io=size(cdnt,1);
sct_1=zeros(num/h,3,io);
d=1;
for i=0:h:num
    A=randn(io,1);
    K1=V2_tode(t,image,D,h,A);
    K2=V2_tode(t+h/2,image+h/2*K1,D,h,A);
    K3=V2_tode(t+h/2,image+h/2*K2,D,h,A);
    K4=V2_tode(t+h,image+h*K3,D,h,A);
    t=t+h;
    image=image+h/6*(K1+2*K2+2*K3+K4);
    sct_1(d,:,:)=reshape(image',1,3,io);
    d=d+1;
end
figure();
for j=1:io
    subplot(1,io,j);
    scatter3(sct_1(:,1,j),sct_1(:,2,j),sct_1(:,3,j));
    xlabel('x');
    ylabel('dx');
    zlabel('y');
end
figure();
for j=1:io
    subplot(io,3,3*(j-1)+1);
    plot([1:size(sct_1,1)],sct_1(:,1,j));
    axis([0 1.1*num -0.3 0.3])
    subplot(io,3,3*(j-1)+2);
    plot([1:size(sct_1,1)],sct_1(:,2,j));
    axis([0 1.1*num -0.5 0.5])
    title(num2str(cdnt(j,:)))
    subplot(io,3,3*(j-1)+3);
    plot([1:size(sct_1,1)],sct_1(:,3,j));
    axis([0 1.1*num -0.02 0.05])
end








