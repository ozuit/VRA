function question1(n)
   imgTrainDatas = load('imgTrainImagesAll.mat');
   imgTrainLabels = load('lblTrainLabelsAll.mat');
   allImagesTrain = imgTrainDatas.imgTrainImagesAll;
   allLabelsTrain = imgTrainLabels.lblTrainLabelsAll;
   img2D = reshape(allImagesTrain(:, n), 112, 92);
   imgLabel = num2str(allLabelsTrain(n));
   figure
   imshow(img2D);
   title(imgLabel);
end