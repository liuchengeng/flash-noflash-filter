clear all
flash = im2double(imread('flash.jpg'));
noflash= im2double(imread('noflash.jpg'));
tflash =  rgb2ycbcr(flash);
tnoflash = rgb2ycbcr(noflash);

noflash_Y=tnoflash(:,:,1);
flash_Cr = tflash(:,:,3);
noflash_Cr = tnoflash(:,:,3);

R = flash_Cr-noflash_Cr;
R=mat2gray(R);
mask = zeros(size(R));
 mean1= mean(R(:));
std1 = std(R(:));
threshold = max(0.5,mean1+(std1*1));
[height,width]=size(R);
for i=1:height
   for j=1:width
      if R(i,j)>threshold && noflash_Y(i,j)<=0.6
          mask(i,j)=1;
      end
   end
end

se = strel('disk',6);

mask = imerode(mask,se);
mask = imdilate(mask,se);
figure(1)
imshow(mask)
% reduction_factor = 0.7;
red_channel = flash(:,:,1);
green_channel = flash(:,:,2);
blue_channel = flash(:,:,3);

red_correction_filter = [0.5, -0.5, 0; -0.5, 1, -0.5; 0, -0.5, 0.5];
recover = roifilt2(red_correction_filter, flash(:,:,1), mask);
recover= cat(3, recover, green_channel, blue_channel);

figure(2),imshow(recover)



