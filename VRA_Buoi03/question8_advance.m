function question8_advance(k)
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll, 'NumNeighbors', k);
    
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    lblResult = predict(Mdl,imgTestAll');
	nResult = (lblResult == lblTestAll);
	nCount = sum(nResult);

    percentageAccuracy = nCount*100/size(imgTestAll, 2);
    fprintf('=> Do chinh xac cua thuat toan knn voi %d nearest neighbors la %.2f\n', k, percentageAccuracy);
end
