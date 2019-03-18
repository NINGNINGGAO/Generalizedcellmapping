function [image1,image2]=V1_GPU_tode(t,cdnt1,cdnt2)
% image=[10.*(cdnt(:,2)-cdnt(:,1)) cdnt(:,1).*(14-cdnt(:,3))-cdnt(:,2) cdnt(:,1).*cdnt(:,2)-8/3*cdnt(:,3)];
% image=[1.4-cdnt(:,1).^2+0.3.*cdnt(:,2) cdnt(:,1)];

% image1=cdnt2;
% image2=(2.5*cos(1.04*t)-0.32*cdnt2-cdnt1-0.05*cdnt1^3)/2.56;

image1=cdnt2;
image2=-0.5*sign(cdnt2).*cdnt2.^2+cdnt1-sign(cdnt1).*abs(cdnt1).^(4/3)+0.25*cos(t);