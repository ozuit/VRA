function question8_advance()
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    arrImagesNTest = [];
    for i = 1:size(imgTestAll, 2)
       if (lblTestAll(i) == 0)
          arrImagesNTest = [arrImagesNTest, imgTestAll(:, i)];
       end
    end
    numImagesNTest = size(arrImagesNTest,2);
    fprintf('So luong anh test co label 0 la %d\n', size(arrImagesNTest,2));
    
    countFailure = 0;
    for i = 1:numImagesNTest
        imgTest = arrImagesNTest(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= 0)
            countFailure = countFailure + 1;
        end
    end
    fprintf('So luong anh co label 0 bi nhan dang sai la: %d\n', countFailure);
    percentageAccuracy = (numImagesNTest - countFailure)*100/numImagesNTest;
    fprintf('=> Do chinh xac cua thuat toan knn voi 1 nearest neighbors la %d\n', round(percentageAccuracy, 2));
end
