function P=MATANA(varargin)
% P=MATANA(CMQmat,n步迭代（应改写为-n）,[感兴趣的胞的编号])
minArgs=1;
maxArgs=3;
narginchk(minArgs,maxArgs)
CMQmat=varargin{1};
num=100;
if nargin==3 && varargin{2}>0
    error('ITERATION MUST BE NEGATIVE \n varargin{2}')
end
if varargin{2}<0
    num=-varargin{2};
end
if varargin{end}>0
    P=zeros(size(CMQmat,1),1);
    temp=varargin{end};
    temp=temp(:);
    P(temp)=ones(size(temp,1),1)/size(temp,1);    
else
    P=ones(size(CMQmat,1),1)./size(CMQmat,1);
end
for i=1:num
    P=CMQmat'*P;
end

    