function nearest = nearest_centroid(test_data)
    N = 24; % number of features
    
    training_set = csvread("features_training.csv");
    
    two_features = training_set(1:10, 1:N);
    three_features = training_set(11:20, 1:N);
    four_features = training_set(21:30, 1:N);
    five_features = training_set(31:40, 1:N);
    seven_features = training_set(41:50, 1:N);
    
    two_centroids = compute_centroids(two_features, N);
    three_centroids = compute_centroids(three_features, N);
    four_centroids = compute_centroids(four_features, N);
    five_centroids = compute_centroids(five_features, N);
    seven_centroids = compute_centroids(seven_features, N);
    
    shortest_distance = realmax;
    nearest = "";
    
    distance_two = city_block_cvip(test_data, two_centroids);
    if (distance_two < shortest_distance)
        shortest_distance = distance_two;
        nearest = "two";
    end
    
    distance_three = city_block_cvip(test_data, three_centroids);
    if (distance_three < shortest_distance)
        shortest_distance = distance_three;
        nearest = "three";
    end
    
    distance_four = city_block_cvip(test_data, four_centroids);
    if (distance_four < shortest_distance)
        shortest_distance = distance_four;
        nearest = "four";
    end
    
    distance_five = city_block_cvip(test_data, five_centroids);
    if (distance_five < shortest_distance)
        shortest_distance = distance_five;
        nearest = "five";
    end
    
    distance_seven = city_block_cvip(test_data, seven_centroids);
    if (distance_seven < shortest_distance)
        shortest_distance = distance_seven;
        nearest = "seven";
    end
end








