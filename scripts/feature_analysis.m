%{
with projections included
varNames = ["NumID", "Area", "Euler", "Proj_H_1", "Proj_H_2", "Proj_H_3",...
    "Proj_H_4", "Proj_H_5", "Proj_H_6", "Proj_H_7", "Proj_H_8", "Proj_H_9", "Proj_H_10",... 
    "Proj_W_1", "Proj_W_2", "Proj_W_3", "Proj_W_4", "Proj_W_5", "Proj_W_6", "Proj_W_7",...
    "Proj_W_8", "Proj_W_9", "Proj_W_10", "Thinness"];
%}



NUM_FEATURES = 26;
varNames = ["NumID", "Centroid_R", "Centroid_C", "Euler", "Perimeter", "Proj_H_1", "Proj_H_2", "Proj_H_3",...
    "Proj_H_4", "Proj_H_5", "Proj_H_6", "Proj_H_7", "Proj_H_8", "Proj_H_9", "Proj_H_10",... 
    "Proj_W_1", "Proj_W_2", "Proj_W_3", "Proj_W_4", "Proj_W_5", "Proj_W_6", "Proj_W_7",...
    "Proj_W_8", "Proj_W_9", "Proj_W_10", "Thinness"];

T = table();

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

    for j = 1 : 10
        numID = number + "_" + int16(j)
        filename = "../" + number + "s/training/" + numID + ".jpg";
        I = imread(filename);

        I = preprocess(I);

        imshow(I);
        
        % Label image
        lab_image = label_cvip(I);
        
        % object label
        objLabel = [1];
        
        % feature select vector
        featSelect = [0 0 1 1 0 1 1 1];
        
        % extract binary object features
        features = binary_feature_cvip(lab_image, objLabel,featSelect);
        disp(features);
        
        data = [numID];

        % start at 2 bc we do not want to include the obj_id in the
        % features
        for idx = 2 : NUM_FEATURES
            item = string(features{2, idx});
            data = [data, item];
        end
        T_temp = array2table(data, 'VariableNames', varNames);
        T = [T;T_temp];
        
    end

end


writetable(T, "features_5.xlsx", "Sheet", 1);

