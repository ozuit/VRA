function question3()
   allLabelsTrain = loadMNISTLabels('train-labels.idx1-ubyte');
   numLabelsTrain = size(allLabelsTrain, 1);
   fprintf('Tong so label la: %d\n',numLabelsTrain);
   countNum0 = 0;
   countNum1 = 0;
   countNum2 = 0;
   countNum3 = 0;
   countNum4 = 0;
   countNum5 = 0;
   countNum6 = 0;
   countNum7 = 0;
   countNum8 = 0;
   countNum9 = 0;
   for i = 1:numLabelsTrain
       if (allLabelsTrain(i) == 0) 
           countNum0 = countNum0 + 1;
       elseif (allLabelsTrain(i) == 1)
           countNum1 = countNum1 + 1;
       elseif (allLabelsTrain(i) == 2)
           countNum2 = countNum2 + 1;
       elseif (allLabelsTrain(i) == 3)
           countNum3 = countNum3 + 1;
       elseif (allLabelsTrain(i) == 4)
           countNum4 = countNum4 + 1;
       elseif (allLabelsTrain(i) == 5)
           countNum5 = countNum5 + 1;
       elseif (allLabelsTrain(i) == 6)
           countNum6 = countNum6 + 1;
       elseif (allLabelsTrain(i) == 7)
           countNum7 = countNum7 + 1;
       elseif (allLabelsTrain(i) == 8)
           countNum8 = countNum8 + 1;
       else
           countNum9 = countNum9 + 1;
       end
   end
   fprintf('So anh co label 0 la: %d\n', countNum0);
   fprintf('So anh co label 1 la: %d\n', countNum1);
   fprintf('So anh co label 2 la: %d\n', countNum2);
   fprintf('So anh co label 3 la: %d\n', countNum3);
   fprintf('So anh co label 4 la: %d\n', countNum4);
   fprintf('So anh co label 5 la: %d\n', countNum5);
   fprintf('So anh co label 6 la: %d\n', countNum6);
   fprintf('So anh co label 7 la: %d\n', countNum7);
   fprintf('So anh co label 8 la: %d\n', countNum8);
   fprintf('So anh co label 9 la: %d\n', countNum9);
end