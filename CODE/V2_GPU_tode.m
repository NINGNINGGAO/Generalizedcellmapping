function [image1,image2]=V2_GPU_tode(t,y1,y2,D,h,A)
image1=y2;
image2=-0.5*sign(y2).*y2.^2+y1-sign(y1).*abs(y1).^(4/3)+0.25*cos(t)+sqrt(2*0.006)*sqrt(2*D/h)*A;