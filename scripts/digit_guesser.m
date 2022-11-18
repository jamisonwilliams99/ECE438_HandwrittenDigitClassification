
% notes
% 0, 6, and 9 will all have an euler number of 0
% 8 will have an euler number of -1

function output = digit_guesser()
    output = ""; % output will be a string stating what digit the application thinks the input image contains 
    
    mask_size = 3;
    I = input_image();
    
    % preprocess image
    %   - resize to 256x256 pixels
    %   - convert image to binary
    %   - invert image
    I = imresize(I, [256, 256]);
    I = rgb2gray(I);
    I = threshold_cvip(I);
    I = not_cvip(I);
    I = median_filter_cvip(I, mask_size);

    
    % Label image
     lab_image = label_cvip(I);
    
    % object label
    
     objLabel = [1];
    
    % feature select vector
     featSelect = [1 0 0 1 0 0 1 0];
    
    % extract binary object features
     features = binary_feature_cvip(lab_image, objLabel,featSelect, 'normWidth',8 , 'normHeight',8);
     disp(features);

     euler_number = features{2, 3}

     if (euler_number == -1)
         output = "The number is 8";
     elseif (euler_number == 0)
         output = "The number is either 0, 6, or 9";
     else
         output = "The number is either 1, 2, 3, 4, 5, or 7";
     end

     imshow(I);

end