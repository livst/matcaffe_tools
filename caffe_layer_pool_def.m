function [ layer_str ] = caffe_layer_pool_def( name, varargin )
%% Description:
% default initialization of the Pooling layer
% --- INPUT:
% indx = index for the layer
% --- OUTPUT:
% layer_str = structure describing a layer
%
%% Execution:
%Name
if isstr(name)
    layer_str.name = name;
else
    layer_str.name = sprintf('pool%d', name);
end
layer_str.type = 'Pooling';

%Bottom
var_i = 1;
if length(varargin) >= var_i
    layer_str.bottom = varargin{var_i};
else
    layer_str.bottom = sprintf('conv%d', name);
end

layer_str.top = layer_str.name;

layer_str.pooling_param.pool = 'MAX';

layer_str.pooling_param.kernel_h = 2;
layer_str.pooling_param.kernel_w = 2;
layer_str.pooling_param.stride_h = 2;
layer_str.pooling_param.stride_w = 2;

% layer {
%   name: "pool0"
%   type: "Pooling"
%   bottom: "conv0"
%   top: "pool0"
%   pooling_param {
%     pool: MAX
%     kernel_h: 1
%     kernel_w: 2
%     stride_h: 1
%     stride_w: 2
%   }
% }

end

