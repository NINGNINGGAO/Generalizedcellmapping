function [CMQmat,CMQ]=V2_GPU_MAT(bcell,smcell,interval,cellnum,cellnumjy,smcellnum,widght,tp1,tp2,MC,t,D,h,OSS)
%--------------------------------------------------------------------------
%Computing SDE with GPU
% 
%input argument
%           cellnum: number of cell
%           cellnumjy:number of cell plus one
%           smcellnum:numer of small cell in a big cell
%           widght:cell size
%           tp1:number of block
%           tp2:numer of cell in a block
%output argument
%           CMQmat:One-step transition probability matrix
%           CMQ:One-step transition probability matrix,but value is one,
%                   not probability
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

io=size(bcell,2);
for i=1:tp2-1
    gttao=[(i-1)*tp1+1:i*tp1]';
    C_SE=Z_K(gttao,bcell,cellnum);
    [~,ginterval]=G(C_SE,interval,widght);
    cdnt=smG(ginterval,smcell,widght,smcellnum);
    cdnt=repelem(cdnt,MC,1);
    for j=1:io
        eval(['gpu_cdnt',num2str(j),'=gpuArray(cdnt(:,j));']);
    end
    [gpu_image_t1,gpu_image_t2]=arrayfun(@V2_GPU_mappingtest,gpu_cdnt1,gpu_cdnt2,t,D,h,OSS);
    image_t=zeros(size(cdnt));
    for j=1:io
        eval(['image_t(:,j)=gather(gpu_image_t',num2str(j),');']);
    end
    fttao=F(image_t,bcell,interval,widght,cellnumjy);
    temp1=tp1*smcellnum*MC;
    mid1=repelem(gttao,smcellnum*MC);
    unq=zeros(temp1,2);
    unq(:,1)=mid1;
    unq(:,2)=fttao;
    eval(['[xishu_',num2str(i),',~,midt_',num2str(i),']=unique(unq,''rows'');']);
    eval(['[lg(i),~]=size(xishu_',num2str(i),');']);
    eval(['midt',num2str(i),'=histc(midt_',num2str(i),',[1:lg(',num2str(i),')]'')/smcellnum*MC;']);
end
gttao=[(tp2-1)*tp1+1:cellnum]';
C_SE=Z_K(gttao,bcell,cellnum);
[~,ginterval]=G(C_SE,interval,widght);
cdnt=smG(ginterval,smcell,widght,smcellnum);
cdnt=repelem(cdnt,MC,1);
for j=1:io
    eval(['gpu_cdnt',num2str(j),'=gpuArray(cdnt(:,j));']);
end
[gpu_image_t1,gpu_image_t2]=arrayfun(@V2_GPU_mappingtest,gpu_cdnt1,gpu_cdnt2,t,D,h,OSS);
image_t=zeros(size(cdnt));
for j=1:io
    eval(['image_t(:,j)=gather(gpu_image_t',num2str(j),');']);
end
fttao=F(image_t,bcell,interval,widght,cellnumjy);
mid1=repelem(gttao,smcellnum*MC);
temp1=length(gttao)*smcellnum*MC;
unq=zeros(temp1,2);
unq(:,1)=mid1;
unq(:,2)=fttao;
eval(['[xishu_',num2str(tp2),',~,midt_',num2str(tp2),']=unique(unq,''rows'');']);
eval(['[lg(tp2),~]=size(xishu_',num2str(tp2),');']);
eval(['midt',num2str(tp2),'=histc(midt_',num2str(tp2),',[1:lg(',num2str(tp2),')]'')/smcellnum*MC;']);

l_g=sum(lg);
xishu1=zeros(l_g+1,3);
xishu2=zeros(l_g+1,3);
lg1=0;
for i=1:tp2
    eval(['xishu1(lg1+1:lg1+lg(i),1:2)=xishu_',num2str(i),';']);
    eval(['xishu1(lg1+1:lg1+lg(i),3)=midt',num2str(i),';']);
    lg1=lg1+lg(i);
end
xishu1(end,:)=[cellnumjy,cellnumjy,1];
xishu2(:,1:2)=xishu1(:,1:2);
xishu2(:,3)=1;
try
    CMQmat=sparse(xishu1(:,1),xishu1(:,2),xishu1(:,3));
    CMQ=sparse(xishu2(:,1),xishu2(:,2),xishu2(:,3));
catch
    error('Beyond the precision range, some calculation results are shown as NaN.')
    disp('inspect xishu1 and equation')   
    disp('If you want to ignore it, please uncomment it in F.m')
    disp('Remember to restore it')
end
