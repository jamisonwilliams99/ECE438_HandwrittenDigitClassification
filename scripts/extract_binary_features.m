
function binary_features = extract_binary_features(lab_image, featSelect, N)
% object label
objLabel = [1];

% extract binary object features
features = binary_feature_cvip(lab_image, objLabel,featSelect);

binary_features = [];

% start at 2 bc we do not want to include the obj_id in the
% features
for idx = 2 : N + 1
    item = double(features{2, idx});
    binary_features = [binary_features, item];
end