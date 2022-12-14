
% notes
% 0, 6, and 9 will all have an euler number of 0
% 8 will have an euler number of -1

function output = digit_guesser(I)
    output = ""; % output will be a string stating what digit the application thinks the input image contains
    I = preprocess(I);
    
    % Label image
     lab_image = label_cvip(I);

     % feature select vector
     featSelect = [0 0 0 1 0 0 1 1];

    try
        binary_features = extract_binary_features(lab_image, featSelect, 22);
    catch
        warning("unable to load binary features for this image");
        output = "-1";
        return;
    end

     euler_number = binary_features(1);
     hor_projections = binary_features(2:11);
     vert_projections = binary_features(12:21);
     thinness = binary_features(22);
    
     
     if (euler_number == -1)
         output = "eight";
     elseif (euler_number == 0)
         if (thinness > 0.32)
             output = "zero";
         else
            if (hor_projections(2) == 1 && hor_projections(3) == 1)
                output = "six";
            else
                output = "nine";
            end
         end
     else
         if (~any(hor_projections) && ~any(vert_projections))
             output = "one";
         else
            try
                binary_features = extract_binary_features(lab_image, [0 0 0 0 0 0 1 1], 21);
            catch
                warning("unable to load binary features for this image");
                output = "-1";
                return;
            end
            
            rst_features = extract_rst_features(lab_image, [1 1 1]);
            features = [binary_features, rst_features];
            
            output = nearest_centroid(features);
         end
     end
end