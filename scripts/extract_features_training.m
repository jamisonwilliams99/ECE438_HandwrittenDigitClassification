feature_mat = [];

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

    for j = 1 : 10
        numID = number + "_" + int16(j)
        filename = "../" + number + "s/training/" + numID + ".jpg";
        I = imread(filename);

        I = preprocess(I);
        
        % Label image
        lab_image = label_cvip(I);
        
        binary_features = extract_binary_features(lab_image, [0 0 0 0 0 0 1 0], 20);
        rst_features = extract_rst_features(lab_image, [1 1 1]);

        features = [binary_features, rst_features];

        feature_mat = [feature_mat; features];

    end

end

writematrix(feature_mat, "rst_features_training2.csv");

