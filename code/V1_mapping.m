function image=V1_mapping(cdnt,t,D,h,OSS)
image=cdnt;
for i=0:h:OSS
    K1=V_tode(t,image,D,h,A);
    K2=V_tode(t+h/2,image+h/2*K1,D,h,A);
    K3=V_tode(t+h/2,image+h/2*K2,D,h,A);
    K4=V_tode(t+h,image+h*K3,D,h,A);
    t=t+h;
    image=image+h/6*(K1+2*K2+2*K3+K4);   
end