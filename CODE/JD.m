function [bcell,smcell,interval,MC,MQ,MemorySize,t,D,h,OSS]=JD(varargin)
%--------------------------------------------------------------------------
%input name function (It has nothing with JD)
% 
%author:NINGNINGGAO
%--------------------------------------------------------------------------

for i=1:nargin
    if ~isnumeric(varargin{i})
        error('InputError')
    end
end
if length(varargin{1})~=length(varargin{2})
    error('DimensionError')
end
if 2*length(varargin{1})~=length(varargin{3})
    error('DimensionError')
end
bcell=varargin{1};
smcell=varargin{2};
interval=varargin{3};
MC=varargin{4};
MQ=varargin{5};
MemorySize=varargin{6};
t=varargin{7};
D=varargin{8};
h=varargin{9};
OSS=varargin{10};



