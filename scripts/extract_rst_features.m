function rst_features = extract_rst_features(lab_image, featSelect)
    % find a pixel cordinate within the object
    [rows, cols] = find(lab_image);
    r = rows(1);
    c = cols(1);

    features = rst_invariant_cvip(lab_image, [r, c], featSelect);
    
    rst_features = [];
    % start at 2 bc we do not want to include the obj_id in the
    % features
    for idx = 3 : 5
        item = features{2, idx};
        rst_features = [rst_features, item];
    end
end