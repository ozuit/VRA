function question1(n)
   allImagesTrain = loadMNISTImages('train-images.idx3-ubyte');
   allLabelsTrain = loadMNISTLabels('train-labels.idx1-ubyte');
   img2D = reshape(allImagesTrain(:, n), 28, 28);
   imgLabel = num2str(allLabelsTrain(n));
   figure
   imshow(img2D);
   title(imgLabel);
end