%{

%}
data = {};
for i = 0 : 9
    switch i
        case 0
            number = "zero";
        case 1
            number = "one";
        case 2
            number = "two";
        case 3
            number = "three";
        case 4
            number = "four";
        case 5
            number = "five";
        case 6
            number = "six";
        case 7
            number = "seven";
        case 8
            number = "eight";
        case 9
            number = "nine";
    end

    for j = 1 : 3
        filename = "../" + number + "s/training/" + number + "_" + int16(j) + ".jpg";
        I = imread(filename);

        % preprocess image
        %   - resize to 256x256 pixels
        %   - convert color image to grayscale
        %   - convert grayscale image to binary
        %   - invert image
        I = imresize(I, [256, 256]);
        I = rgb2gray(I);
        I = threshold_cvip(I);
        I = not_cvip(I);
        I = median_filter_cvip(I, 3);

        imshow(I);
        
        % Label image
        lab_image = label_cvip(I);
        
        % object label
        objLabel = [1];
        
        % feature select vector
        featSelect = [1 0 0 1 0 0 1 1];
        
        % extract binary object features
        features = binary_feature_cvip(lab_image, objLabel,featSelect);
        fprintf("%s %d \n", number, j);
        %disp(features);
    end

end
