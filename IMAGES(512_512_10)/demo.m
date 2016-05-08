
clc; clear; close all;

numPatches = 11*11;
images = load('IMAGES.mat');
images = images.IMAGES;                             % 提取 mat 文件中的图像数据

[h, w, d] = size(images);
patchDim = 5;
patches = zeros(patchDim*patchDim, numPatches);

img_idx = randi(d, [1, numPatches]);                % 图像随机
row_idx = randi(h-patchDim+1, [1, numPatches]);     % 行随机
col_idx = randi(w-patchDim+1, [1, numPatches]);     % 列随机，之所以要减去 patchDim，是避免边界的麻烦

for i = 1:numPatches,
    rnd_patch = images(row_idx(i):row_idx(i)+patchDim-1, col_idx(i):col_idx(i)+patchDim-1, img_idx(i));
    patches(:, i) = rnd_patch(:);
end

display_network(patches);