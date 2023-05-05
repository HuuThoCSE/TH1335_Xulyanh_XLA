function [com, omap]=layanhamban(file)
% Hàm trả về ảnh âm bản của một ảnh * Đọc ảnh từ file, chuyển ảnh sang ảnh đa cấp xâm
% Tính ảnh âm bản của ảnh đa cấp xám
% Trả kết quả ảnh đầu ra cho com,
%và colormap của ảnh đẩu vào cho omap cho việc hiển thị ảnh
[img, map]=imread(file);
info=imfinfo(file);
if length (info)>1
    info=info(1);
end
bitdepth=info.BitDepth;
if info.ColorType=="truecolor"
    gray=rgb2gray (img);
    bitdepth=bitdepth/3;
elseif info.ColorType=="indexed"
    gray=ind2gray(img, map);
else
    gray=img;
end
Lmax=2^bitdepth-1;
[yl, x1]=size (gray);
com=zeros (yl, x1);
omap=map;
for i=1:yl
    for j=1:x1
        com(i,j)=Lmax-gray (i, j);
    end
end