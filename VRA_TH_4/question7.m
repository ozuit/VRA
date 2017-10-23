function question7(n)
    imgTrainDatas = load('imgTrainImagesAll.mat');
    imgTrainLabels = load('lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainDatas.imgTrainImagesAll;
    lblTrainAll = imgTrainLabels.lblTrainLabelsAll;
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTrainDatas = load('imgTestImagesAll.mat');
    imgTrainLabels = load('lblTestLabelsAll.mat');
    imgTestAll = imgTrainDatas.imgTestImagesAll;
    lblTestAll = imgTrainLabels.lblTestLabelsAll;
    
    arrImagesNTest = [];
    for i = 1:size(imgTestAll, 2)
       if (lblTestAll(i) == n)
          arrImagesNTest = [arrImagesNTest, imgTestAll(:, i)];
       end
    end
    
    countFailure = 0;
    for i = 1:size(arrImagesNTest,2)
        imgTest = arrImagesNTest(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= n)
            countFailure = countFailure + 1;
        end
    end
    
    fprintf('So luong anh co label %d bi nhan dang sai la: %d\n', n, countFailure);
end