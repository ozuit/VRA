function buildModelKNN()
    % Load Data Train
	[imgDataTrain,lblDataTrain] = loadData();
    
	%  Extract Features
    if exist('FeatureDataLBP.mat', 'file')
        feature = load('FeatureDataLBP.mat');
        modelName = 'ModelLBP.mat';
    else
        feature = load('FeatureDataHOG.mat');
        modelName = 'ModelHOG.mat';
    end
    featuresDataTrain = feature.featuresDataTrain;
    
	%  Build model KNN
    if exist('ModelHOG.mat', 'file')
        delete ModelHOG.mat;
    end
    if exist('ModelLBP.mat', 'file')
        delete ModelLBP.mat;
    end
    Mdl = fitcknn(featuresDataTrain', lblDataTrain);
    save(modelName, 'Mdl');
    msgbox('Build KNN model completed','Success');
end