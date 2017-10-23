function question8_advance(k)
    imgTrainDatas = load('imgTrainImagesAll.mat');
    imgTrainLabels = load('lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainDatas.imgTrainImagesAll;
    lblTrainAll = imgTrainLabels.lblTrainLabelsAll;
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll, 'NumNeighbors', k);
    
    imgTrainDatas = load('imgTestImagesAll.mat');
    imgTrainLabels = load('lblTestLabelsAll.mat');
    imgTestAll = imgTrainDatas.imgTestImagesAll;
    lblTestAll = imgTrainLabels.lblTestLabelsAll;
    
    lblResult = predict(Mdl,imgTestAll');
	nResult = (lblResult == lblTestAll');
	nCount = sum(nResult);
    percentageAccuracy = nCount*100/size(imgTestAll, 2);
    fprintf('=> Do chinh xac cua thuat toan knn voi %d nearest neighbors la %.2f\n', k, percentageAccuracy);
end
