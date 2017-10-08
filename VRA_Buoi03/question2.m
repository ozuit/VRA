function question2(n)
   allImagesTest = loadMNISTImages('t10k-images.idx3-ubyte');
   allLabelsTest = loadMNISTLabels('t10k-labels.idx1-ubyte');
   img2D = reshape(allImagesTest(:, n), 28, 28);
   imgLabel = num2str(allLabelsTest(n));
   figure
   imshow(img2D);
   title(imgLabel);
end