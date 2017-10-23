function question4()
   imgTestLabels = load('lblTestLabelsAll.mat');
   allLabelsTest = imgTestLabels.lblTestLabelsAll;
   numLabelsTest = size(allLabelsTest, 2);
   fprintf('Tong so label la: %d\n',numLabelsTest);
   countLabel = zeros(1, 40);
   for i = 1:numLabelsTest
       countLabel(allLabelsTest(i)) = countLabel(allLabelsTest(i)) + 1;
   end
   
   for j = 1:40
    fprintf('So anh co label %d la: %d\n', j, countLabel(j));
   end
end