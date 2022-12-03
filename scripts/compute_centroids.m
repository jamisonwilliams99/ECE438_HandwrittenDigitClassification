function centroids = compute_centroids(features, N)
    centroids = zeros(1, N);
    for c = 1 : N
        column = features(:, c);
        centroid = mean(column);
        centroids(c) = centroid;
    end 
end