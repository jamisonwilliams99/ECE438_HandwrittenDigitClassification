

imread()

N = 1;
for i = 1 : N
    filename = ['ones_',int2str(i)];     % build filename
    image = imread(filename);
end

imshow(image);
