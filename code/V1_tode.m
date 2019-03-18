function image=V1_tode(t,cdnt,D,h,A)
% image=[10.*(cdnt(:,2)-cdnt(:,1)) cdnt(:,1).*(14-cdnt(:,3))-cdnt(:,2) cdnt(:,1).*cdnt(:,2)-8/3*cdnt(:,3)];
% image=[1.4-cdnt(:,1).^2+0.3.*cdnt(:,2) cdnt(:,1)];

image=[cdnt(:,2) (2.5*cos(1.04*t)-0.32*cdnt(:,2)-cdnt(:,1)-0.05*cdnt(:,1).^3)/2.56];

% image=[cdnt(:,2) -0.5*sign(cdnt(:,2)).*cdnt(:,2).^2+cdnt(:,1)-sign(cdnt(:,1)).*abs(cdnt(:,1)).^(4/3)+0.25*cos(t)];

% p=0.1;
% phi=0.1;
% lambda=1.0815;
% D=0.1;
% c=0.1;
% a1=0.6+3*lambda^(-6)+8.4*lambda^(-2)-2*p*lambda-3*phi*lambda^2;
% a2=-8.4*lambda^(-2);
% a3=-9*lambda^(-7)-21*lambda^(-3)-p-3*phi*lambda;
% a4=25.2*lambda^(-3);
% a5=-4.2*lambda^(-3);
% a6=21*lambda^(-8)+49*lambda^(-4)-phi;
% a7=-11.2*lambda^(-4);
% a8=84*lambda^(-4);
% a9=84*lambda^(-4);
% a10=-p*lambda^2;
% a11=-2*p*lambda;
% a12=-1;
% b1=1/14;
% b2=-1/14;
% b3=-3/28*lambda^(-1);
% b4=3/14*lambda^(-1);
% b5=3/28*lambda^(-1);
% b6=5/21*lambda^(-2);
% b7=-17/28*lambda^(-2);
% b8=1/2*lambda^(-2);
% b9=-11/84*lambda^(-2);
% % cdnt(:,3)=1;
% image=[cdnt(:,2) -c*cdnt(:,2)-a1*cdnt(:,1)-a2*cdnt(:,3)-a3*cdnt(:,1).^2-a4*cdnt(:,1).*cdnt(:,3)-a5*cdnt(:,3).^2-a6*cdnt(:,1).^3-a7*cdnt(:,3).^3-a8*cdnt(:,1).^2.*cdnt(:,3)-a9*cdnt(:,1).*cdnt(:,3).^2 b1*cdnt(:,1)+b2*cdnt(:,3)+b3*cdnt(:,1).^2+b4*cdnt(:,1).*cdnt(:,3)+b5*cdnt(:,3).^2+b6*cdnt(:,1).^3+b7*cdnt(:,1).^2.*cdnt(:,3)+b8*cdnt(:,1).*cdnt(:,3).^2+b9*cdnt(:,3).^3];
% % -(a10+a11*cdnt(:,1)+a12*cdnt(:,1).^2)*sqrt(2*D/0.01).*randn(size(cdnt,1),1)




    








