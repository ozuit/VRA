function [featuresDataTrain] = extractFeaturesHOG(imgDataTrain)
    imgI1D = imgDataTrain(:,1);
    imgI2D = reshape(imgI1D,112,92);
	featureVector = extractHOGFeatures(imgI2D, 'CellSize', [4 4]);
	nSize = length(featureVector);
	nTrainData = size(imgDataTrain,2);
	featuresDataTrain=zeros(nSize,nTrainData);
    for i = 1:nTrainData
        imgI1D = imgDataTrain(:,i);
        imgI2D = reshape(imgI1D,112,92);
        featuresDataTrain(:,i) = extractHOGFeatures(imgI2D, 'CellSize', [4 4]);
    end
end