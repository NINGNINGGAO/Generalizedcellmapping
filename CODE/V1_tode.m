function image=V1_tode(t,cdnt,h)
% image=[10.*(cdnt(:,2)-cdnt(:,1)) cdnt(:,1).*(14-cdnt(:,3))-cdnt(:,2) cdnt(:,1).*cdnt(:,2)-8/3*cdnt(:,3)];
% image=[1.4-cdnt(:,1).^2+0.3.*cdnt(:,2) cdnt(:,1)];

image=[cdnt(:,2) (2.5*cos(1.04*t)-0.32*cdnt(:,2)-cdnt(:,1)-0.05*cdnt(:,1).^3)/2.56];

% image=[cdnt(:,2) -0.5*sign(cdnt(:,2)).*cdnt(:,2).^2+cdnt(:,1)-sign(cdnt(:,1)).*abs(cdnt(:,1)).^(4/3)+0.25*cos(t)];