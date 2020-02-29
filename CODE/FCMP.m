
function columnmatrix=FCMP(column,group,cgrouping,grouping)
%author：GNN
%input:输入压缩后的第二顶点集和第三顶点集
%output:输出未压缩前的第二第三顶点集
%Notes:如果需要输出未压缩前的第一第二第三顶点集，转到6行（[temp1,~]=find(cgrouping<0);）
[temp1,~]=find(cgrouping<0);%若想把第一顶点集映射成原像点,需要把<换成~=
[~,ib,ia]=intersect(column,temp1);
if isempty(ib)==0
    [n,~]=size(ib);
    column(ib)=[];
    mid=[];
    for i=1:n
        [mid1,~]=find(group==cgrouping(temp1(ia(i))));
        mid=[mid;mid1];
    end
    column=grouping(column);
    mid=[column;mid];
    columnmatrix=unique(mid);
else
    columnmatrix=grouping(column);
end
end
