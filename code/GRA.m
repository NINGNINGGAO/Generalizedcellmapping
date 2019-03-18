function GRA(P,bcell,interval,widght,M)
P(end)=[];
P_P=reshape(P,bcell);
m=length(bcell);
M=M(:);
M=unique(M);
if ~isempty(M(M>m-1))
    error('OVER DIMENSION')
end
time=datevec(datestr(now));
eval(['save(''F:\code\GNN\cache\G_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'.mat'',''bcell'');'])
if M<0
    mid_1=1;
    A=nchoosek(1:m,mid_1);
    for k=1:length(bcell)
        mid1=widght(k)*[1:bcell(k)]'-widght(k)/2;
        eval(['temp_',num2str(k),'=interval(2*k-1)+mid1;']);
    end
    figure()
    for i=1:size(A,1)
        mid=P_P;
        for j=1:size(A,1)
            if ~isempty(A(A(i,:)==j))
                continue
            end
            mid=sum(mid,j);
        end
        mid=mid(:);
        eval(['X_',num2str(mid_1),'_',num2str(i),'P=mid;'])
        eval(['save(''F:\code\GNN\cache\G_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'.mat'',''X_',num2str(mid_1),'_',num2str(i),'P'',''-append'');'])
        subplot(1,size(A,1),i);
        eval(['plot(temp_',num2str(i),',X_',num2str(mid_1),'_',num2str(i),'P)'])
    end
else
    for k=1:size(M,1)
        figure()
        mid_1=M(k);
        A=nchoosek(1:m,mid_1);
        for i=1:size(A,1)
            mid=P_P;
            for j=1:size(A,1)
                if ~isempty(A(A(i,:)==j))
                    continue
                end
                mid=sum(mid,j);
            end
            mid=mid(:);
            eval(['X_',num2str(mid_1),'_',num2str(i),'P=mid;'])
            eval(['save(''F:\code\GNN\cache\G_',num2str(time(1)),'_',num2str(time(2)),'_',num2str(time(3)),'_',num2str(time(4)),'_',num2str(time(5)),'.mat'',''X_',num2str(mid_1),'_',num2str(i),'P'',''-append'');'])
            %%在此可以增加二维以上的画图
        end 
    end
end