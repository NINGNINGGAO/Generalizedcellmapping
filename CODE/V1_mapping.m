function image=V1_mapping(cdnt,t,h,OSS)
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
    K1=V1_tode(t,image,h);
    K2=V1_tode(t+h/2,image+h/2*K1,h);
    K3=V1_tode(t+h/2,image+h/2*K2,h);
    K4=V1_tode(t+h,image+h*K3,h);
    t=t+h;
    image=image+h/6*(K1+2*K2+2*K3+K4);   
end