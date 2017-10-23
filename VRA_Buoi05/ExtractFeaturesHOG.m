function [featuresDataTrain] = ExtractFeaturesHOG(imgDataTrain)
    imgI1D = imgDataTrain(:,1);
    imgI2D = reshape(imgI1D,28,28);
%     cellsize càng nhỏ -> số chiều vector càng lớn
	featureVector = extractHOGFeatures(imgI2D, 'CellSize', [4 4]);
%   lấy số chiều vector  
	nSize = length(featureVector); 
	nTrainData = size(imgDataTrain,2);
	featuresDataTrain=zeros(nSize,nTrainData);
    for i = 1:nTrainData
        imgI1D = imgDataTrain(:,i);
        imgI2D = reshape(imgI1D,28,28);
        featuresDataTrain(:,i) = extractHOGFeatures(imgI2D, 'CellSize', [4 4]);
	end
end