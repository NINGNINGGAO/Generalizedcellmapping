function [image1,image2]=V2_GPU_mappingtest(image1,image2,t,D,h,OSS)
%--------------------------------------------------------------------------
%warning:The number of inputs must be consistent with the order of the equation.
%               Because the GPU cannot use vectors
% 
%Image Points Obtained by Initial Value Using 4RK,after time OSS,GPU
%
%input argument
%           image:initial value
%output argument
%           image:image value
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

for i=0:h:OSS
    A=randn;
    [k11,k12]=V2_GPU_tode(t,image1,image2,D,h,A);
    [k21,k22]=V2_GPU_tode(t+h/2,image1+(h/2)*k11,image2+(h/2)*k12,D,h,A);
    [k31,k32]=V2_GPU_tode(t+h/2,image1+(h/2)*k21,image2+(h/2)*k22,D,h,A);
    [k41,k42]=V2_GPU_tode(t+h,image1+h*k31,image2+h*k32,D,h,A);
    t=t+h;
    image1=image1+(h/6)*(k11+2*k21+2*k31+k41);
    image2=image2+(h/6)*(k12+2*k22+2*k32+k42);
end