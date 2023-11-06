flash = im2double(imread('flash3.jpg'));
noflash= im2double(imread('noflash3.jpg'));

yf = rgb2ycbcr(flash);
ya = rgb2ycbcr(noflash);

figure(1)
 a=-0.5;
    adjust = (1-a)*ya + a*yf;
    adjust = ycbcr2rgb(adjust);
    
    subplot(1,6,1)
    imshow(adjust)
  
 a=0;
    adjust = (1-a)*ya + a*yf;
    adjust = ycbcr2rgb(adjust);
    
    subplot(1,6,2)
    imshow(adjust)

 a=0.33;
    adjust = (1-a)*ya + a*yf;
    adjust = ycbcr2rgb(adjust);
    
    subplot(1,6,3)
    imshow(adjust)

 a=0.66;
    adjust = (1-a)*ya + a*yf;
    adjust = ycbcr2rgb(adjust);
    
    subplot(1,6,4)
    imshow(adjust)

 a=1;
    adjust = (1-a)*ya + a*yf;
    adjust = ycbcr2rgb(adjust);
    
    subplot(1,6,5)
    imshow(adjust)
  
 a=1.5;
    adjust = (1-a)*ya + a*yf;
    adjust = ycbcr2rgb(adjust);
    
    subplot(1,6,6)
    imshow(adjust)

