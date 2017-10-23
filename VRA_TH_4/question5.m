function question5(n)
    imgTrainDatas = load('imgTrainImagesAll.mat');
    imgTrainLabels = load('lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainDatas.imgTrainImagesAll;
    lblTrainAll = imgTrainLabels.lblTrainLabelsAll;
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTrainDatas = load('imgTestImagesAll.mat');
    imgTestAll = imgTrainDatas.imgTestImagesAll;
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    fprintf('Ket qua nhan dang cua anh co thu tu %d trong tap test la: %d\n', n, lblPredictTest);
end