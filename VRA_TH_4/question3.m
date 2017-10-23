function question3()
   imgTrainLabels = load('lblTrainLabelsAll.mat');
   allLabelsTrain = imgTrainLabels.lblTrainLabelsAll;
   numLabelsTrain = size(allLabelsTrain, 2);
   fprintf('Tong so label la: %d\n',numLabelsTrain);
   countLabel = zeros(1, 40);
   for i = 1:numLabelsTrain
       countLabel(allLabelsTrain(i)) = countLabel(allLabelsTrain(i)) + 1;
   end
   
   for j = 1:40
    fprintf('So anh co label %d la: %d\n', j, countLabel(j));
   end
end