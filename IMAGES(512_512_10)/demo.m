
clc; clear; close all;

numPatches = 11*11;
images = load('IMAGES.mat');
images = images.IMAGES;                             % ��ȡ mat �ļ��е�ͼ������

[h, w, d] = size(images);
patchDim = 5;
patches = zeros(patchDim*patchDim, numPatches);

img_idx = randi(d, [1, numPatches]);                % ͼ�����
row_idx = randi(h-patchDim+1, [1, numPatches]);     % �����
col_idx = randi(w-patchDim+1, [1, numPatches]);     % �������֮����Ҫ��ȥ patchDim���Ǳ���߽���鷳

for i = 1:numPatches,
    rnd_patch = images(row_idx(i):row_idx(i)+patchDim-1, col_idx(i):col_idx(i)+patchDim-1, img_idx(i));
    patches(:, i) = rnd_patch(:);
end

display_network(patches);