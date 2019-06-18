function [image1,image2]=V1_GPU_mapping(cdnt1,cdnt2,t,h,OSS)
%--------------------------------------------------------------------------
%warning:The number of inputs must be consistent with the order of the equation.
%               Because the GPU cannot use vectors
%
%Image Points Obtained by Initial Value Using 4RK,after time OSS,GPU
%
%input argument
%           cdnt:initial value
%output argument
%           image:image value
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

image1=cdnt1;
image2=cdnt2;
for i=0:h:OSS
    [K11,K12]=V1_GPU_tode(t,image1,image2);
    [K21,K22]=V1_GPU_tode(t+h/2,image1+h/2*K11,image2+h/2*K12);
    [K31,K32]=V1_GPU_tode(t+h/2,image1+h/2*K21,image2+h/2*K22);
    [K41,K42]=V1_GPU_tode(t+h,image1+h*K31,image2+h*K32);
    t=t+h;
    image1=image1+h/6*(K11+2*K21+2*K31+K41);
    image2=image2+h/6*(K12+2*K22+2*K32+K42);
end