% read the image
flash = double(imread('cave-flash.bmp')) / 255;
noflash=double(imread('cave-noflash.bmp')) / 255;
% select the window size
r = 8; 
% value of epsilon in two guided filter esp1 for nolash esp2 for flash
eps1 = 0.02^2; 
eps2 = 0.08^2; 
% guide filter flash image using itself as guidance
filter_flash= zeros(size(flash));
filter_flash(:, :, 1) = selffilter(flash(:, :, 1),  r, eps2);
filter_flash(:, :, 2) = selffilter(flash(:, :, 2),  r, eps2);
filter_flash(:, :, 3) = selffilter(flash(:, :, 3),  r, eps2);
% guide filter noflash image using itself as guidance
filter_noflash= zeros(size(flash));
filter_noflash(:, :, 1) = guidedfilter(flash(:, :, 1), noflash(:, :, 1), r, eps1);
filter_noflash(:, :, 2) = guidedfilter(flash(:, :, 2), noflash(:, :, 2), r, eps1);
filter_noflash(:, :, 3) = guidedfilter(flash(:, :, 3), noflash(:, :, 3), r, eps1);
% detail layer
detail=flash-filter_flash;
tao=1;
final = filter_noflash+detail; 
% 
% % iteration
% for n=2:10
%   tao = 1/(n^2)  ;
% final(:, :, 1) = guidedfilter(flash(:, :, 1), final(:, :, 1), r, eps1);
% final(:, :, 2) = guidedfilter(flash(:, :, 2), final(:, :, 2), r, eps1);
% final(:, :, 3) = guidedfilter(flash(:, :, 3), final(:, :, 3), r, eps1);
% 
% final = final + tao .* detail; 


% end

figure(1);
imshow(final, [0, 1]);

