img=imread('B3_images/cameraman.tif');
low=ones(3)/9;
f2=filter2(low,img);
subplot(121);
imshow(img);
title('Ảnh gốc');
subplot(122);
imshow(f2,[]);
title('Ảnh lọc thông thấp');
