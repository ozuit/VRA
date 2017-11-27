function lblPredict = predict(imgTest)
    if exist('ModelLBP.mat', 'file')
        % Load model
        model = load('ModelLBP.mat');
        %  Extract Features
        featuresDataTest = extractFeaturesLBP(imgTest);
    else exist('ModelHOG.mat', 'file')
        % Load model
        model = load('ModelHOG.mat');
        %  Extract Features
        featuresDataTest = extractFeaturesHOG(imgTest);
    end
    
    % Predict
    Mdl = model.Mdl;
    lblPredict = predict(Mdl, featuresDataTest');
end