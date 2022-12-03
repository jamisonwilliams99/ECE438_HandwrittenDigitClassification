
NUM_FEATURES = 4;

num_correct = 0;
num_incorrect = 0;

for i = 0 : 9
    switch i
        case 0
            continue
        case 1
            continue
        case 2
            number = "two";
        case 3
            number = "three";
        case 4
            number = "four";
        case 5
            number = "five";
        case 6
            continue
        case 7
            number = "seven";
        case 8
            continue
        case 9
            continue
    end

    for j = 11 : 20
        numID = number + "_" + int16(j);
        filename = "../" + number + "s/test/" + numID + ".jpg";
        I = imread(filename);
        
        I = preprocess(I);

        imshow(I);
        
        % Label image
        lab_image = label_cvip(I);
        
        try
            binary_features = extract_binary_features(lab_image, [0 0 0 0 0 0 1 1], 21);
        catch
            warning("unable to load binary features for this image");
            continue
        end
        
        rst_features = extract_rst_features(lab_image, [1 1 1]);

        features = [binary_features, rst_features];

        nearest = nearest_centroid(features);

        if (nearest == number)
            num_correct = num_correct + 1;
        else
            num_incorrect = num_incorrect + 1;
            disp(numID + " guessed incorrectly");
        end

        %sprintf("%s classified as %s", numID, nearest);

    end

end

disp(num_correct);
disp(num_incorrect);