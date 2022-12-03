function I = preprocess(I)
    % preprocess image
    %   - resize to 256x256 pixels
    %   - convert image to binary
    %   - invert image
    imshow(I);
    mask_size = 3;
    I = imresize(I, [256, 256]);
    I = rgb2gray(I);
    I = threshold_cvip(I);
    I = not_cvip(I);
    I = morphclose_cvip(I,3,5,[5 3]);
    I = median_filter_cvip(I, 5);
    [I, kernel] = morphdilate_cvip(I,3,5,[5 3]); %5*5 rectangle kernel with rectangle width 5 and rectangle height 3
end