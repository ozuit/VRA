function [imgData, lblData] = loadData()
    imgTrainDatas = load('dataTrainImage.mat');
    imgTrainLabels = load('dataTrainLabel.mat');
    imgData = imgTrainDatas.dataTrainImage;
    lblData = imgTrainLabels.dataTrainLabel;
end