function image=V2_mappingtest(cdnt,t,D,h,OSS)
%-------------------------------------------------------------------------- 
%Image Points Obtained by Initial Value Using 4RK,after time OSS
%
%input argument
%           cdnt:initial value
%output argument
%           image:image value
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

image=cdnt;
for i=0:h:OSS
    A=randn(size(image,1),1);
    K1=V2_tode(t,image,D,h,A);
    K2=V2_tode(t+h/2,image+(h/2)*K1,D,h,A);
    K3=V2_tode(t+h/2,image+(h/2)*K2,D,h,A);
    K4=V2_tode(t+h,image+h*K3,D,h,A);
    t=t+h;
    image=image+(h/6)*(K1+2*K2+2*K3+K4);
end