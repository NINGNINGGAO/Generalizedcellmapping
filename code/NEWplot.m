function NEWplot(FIR,SEC,D,trapD,D1,D2,SM,UM,interval,widght,bcell,cellnum)

m=length(bcell);
if m==3
    subplot(1,2,1)
%     figure()
    
    hold on
    if isempty(D1)==0
        D_1=Z_K(D1,bcell,cellnum);
        [DR,~]=G(D_1,interval,widght);
        scatter3(DR(:,1),DR(:,2),DR(:,3),2,'filled');
    end
    
    
    hold on
    if isempty(trapD)==0
        trap_D=Z_K(trapD,bcell,cellnum);
        [trapDR,~]=G(trap_D,interval,widght);
        scatter3(trapDR(:,1),trapDR(:,2),trapDR(:,3),2,'filled');
    end
    
    hold on
    if isempty(FIR)==0
        FI_R=Z_K(FIR,bcell,cellnum);
        FIRR=G(FI_R,interval,widght);
        scatter3(FIRR(:,1),FIRR(:,2),FIRR(:,3),1);
    end
    
    
%     figure()
    subplot(1,2,2)

    if isempty(UM)==0
        U_M=Z_K(UM,bcell,cellnum);
        [UMR,~]=G(U_M,interval,widght);
        scatter3(UMR(:,1),UMR(:,2),UMR(:,3),1);
    end
    
    hold on
    if isempty(SM)==0
        S_M=Z_K(SM,bcell,cellnum);
        [SMR,~]=G(S_M,interval,widght);
        scatter3(SMR(:,1),SMR(:,2),SMR(:,3),1);
    end
    
    hold on
    if isempty(FIR)==0
        scatter3(FIRR(:,1),FIRR(:,2),FIRR(:,3),1);
    end
    
    hold on
    if isempty(SEC)==0
        SE_C=Z_K(SEC,bcell,cellnum);
        [SECR,~]=G(SE_C,interval,widght);
        scatter3(SECR(:,1),SECR(:,2),SECR(:,3),1,'filled');
    end
else
    if m==2
        subplot(1,2,1)
%         figure()
        if isempty(D1)==0
            D_1=Z_K(D1,bcell,cellnum);
            [DR,~]=G(D_1,interval,widght);
            scatter(DR(:,1),DR(:,2),2,'filled');
        end
        
        hold on
        if isempty(trapD)==0
            trap_D=Z_K(trapD,bcell,cellnum);
            [trapDR,~]=G(trap_D,interval,widght);
            scatter(trapDR(:,1),trapDR(:,2),2,'filled');
        end
        
        hold on
        if isempty(FIR)==0
            FI_R=Z_K(FIR,bcell,cellnum);
            [FIRR,~]=G(FI_R,interval,widght);
            scatter(FIRR(:,1),FIRR(:,2),1);
        end
        hold on
        
        
        
%         figure()
        subplot(1,2,2)
        if isempty(D)==0
            for i=1:size(D,2)
                D_D=find(D(:,i)==1);
                D_D=Z_K(D_D,bcell,cellnum);
                [DD,~]=G(D_D,interval,widght);
                hold on
                scatter(DD(:,1),DD(:,2),1);
            end
        end
        
        hold on
        if isempty(UM)==0
            U_M=Z_K(UM,bcell,cellnum);
            [UMR,~]=G(U_M,interval,widght);
            scatter(UMR(:,1),UMR(:,2),1);
        end
        
        hold on
        if isempty(SM)==0
            S_M=Z_K(SM,bcell,cellnum);
            [SMR,~]=G(S_M,interval,widght);
            scatter(SMR(:,1),SMR(:,2),1);
        end
        

        
        hold on
        if isempty(FIR)==0
            scatter(FIRR(:,1),FIRR(:,2),1);
        end
        
        hold on
        if isempty(SEC)==0
            SE_C=Z_K(SEC,bcell,cellnum);
            [SECR,~]=G(SE_C,interval,widght);
            scatter(SECR(:,1),SECR(:,2),1,'filled');
        end
    end
end
