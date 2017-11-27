function [featuresDataTrain] = extractFeaturesLBP(imgDataTrain)
    imgI1D = imgDataTrain(:,1);
    imgI2D = reshape(imgI1D,112,92);
	featureVector = extractLBPFeatures(imgI2D,'CellSize',[4 4],'Normalization','None');
	nSize = length(featureVector);
	nTrainData = size(imgDataTrain,2);
	featuresDataTrain=zeros(nSize,nTrainData);
    for i = 1:nTrainData
        imgI1D = imgDataTrain(:,i);
        imgI2D = reshape(imgI1D,112,92);
        featuresDataTrain(:,i) = extractLBPFeatures(imgI2D,'CellSize',[4 4],'Normalization','None');
    end
end