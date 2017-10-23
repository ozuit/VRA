function question7_advance(n)
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
    
    countFailure = zeros(1, 40);
    for i = 1:size(arrImagesNTest,2)
        imgTest = arrImagesNTest(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= n)
            countFailure(lblPredictTest) = countFailure(lblPredictTest) + 1;
        end
    end
    
    for i = 1:40
       if (i ~= n)
          fprintf('So luong anh co label %d bi nhan dang sai thanh %d la: %d\n', n, i, countFailure(i));
       end
    end
end