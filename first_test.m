
%%
img = imread('tum3.jpg');
gr = rgb2gray(img);

bw_img = im2bw(img,0.7);

bw1 = bwlabel(bw_img);


stats = regionprops(bw1,'Solidity','Area');

denisty = [stats.Solidity];
area = [stats.Area];

high_dense = denisty > 0.5;
max_area = max(area(high_dense));
tumor_label = find(area == max_area);
tumor = ismember(bw1,tumor_label);

subplot(1,3,1);
imshow(img,[])
title('Brain');

subplot(1,3,2);
imshow(tumor,[])
title('Tumor alone');


[B,L] = bwboundaries(tumor,'noholes');
subplot(1,3,3);
imshow(img,[]);
hold on;
for i = 1:length(B)
    plot(B{i} (:,2),B{i}(:,1),'y','linewidth',1.45)
end
title('Detected tumor');
hold off;
%%