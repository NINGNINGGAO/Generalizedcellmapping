if isempty(SEC)==0
SE_C=Z_K(SEC,bcell,cellnum);
[~,SECR]=G(SE_C,interval,widght);
scatter(SECR(:,1),SECR(:,2),1,'filled');
end