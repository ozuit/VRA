function question2(n)
   imgTrainDatas = load('imgTestImagesAll.mat');
   imgTrainLabels = load('lblTestLabelsAll.mat');
   allImagesTest = imgTrainDatas.imgTestImagesAll;
   allLabelsTest = imgTrainLabels.lblTestLabelsAll;
   img2D = reshape(allImagesTest(:, n), 112, 92);
   imgLabel = num2str(allLabelsTest(n));
   figure
   imshow(img2D);
   title(imgLabel);
end