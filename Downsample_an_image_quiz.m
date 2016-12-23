% Downsample an image
1;  % Octave script guard

function img_d = downsample(img)
    % TODO: img_d = ? (pick alternate rows, cols: 1, 3, 5, ...)
    img_d = img(1:2:end, 1:2:end);
end

function img_bd = blur_downsample(img)
    % TODO: img_bd = ? (blur by 5x5 gaussian, then downsample)
    g_filt = fspecial('gaussian',5); % 5x5 gaussian filter
    img_temp = imfilter(img,g_filt); %filter the original image
    img_bd = img_temp(1:2:end, 1:2:end); %downsample the filtered image
end

% Test code:
pkg load image;

img = imread('penny-farthing.png');
imshow(img);

img_d = downsample(img);    % 1/2 size
img_d = downsample(img_d);  % 1/4 size
img_d = downsample(img_d);  % 1/8 size

img_bd = blur_downsample(img);     % 1/2 size
img_bd = blur_downsample(img_bd);  % 1/4 size
img_bd = blur_downsample(img_bd);  % 1/8 size

imshow(imresize(img_d, size(img)));   % view downsampled image in original size
imshow(imresize(img_bd, size(img)));  % compare with blurred & downsampled
