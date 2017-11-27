function storeNewFace(croped_images, image_label)
    % Store new faces and new labels
    if exist('dataTrainImage.mat', 'file')
        dataImage = load('dataTrainImage.mat');
        dataTrainImage = dataImage.dataTrainImage;
    else
        dataTrainImage = [];
    end    

    if exist('dataTrainLabel.mat', 'file')
        dataLabel = load('dataTrainLabel.mat');
        dataTrainLabel = dataLabel.dataTrainLabel;
    else
        dataTrainLabel = [];
    end
    for i=1:size(croped_images,2)
        dataTrainImage = [dataTrainImage, croped_images(:,i)];
        dataTrainLabel = [dataTrainLabel; string(image_label)];
    end
    save('dataTrainImage.mat', 'dataTrainImage');
    save('dataTrainLabel.mat', 'dataTrainLabel');
end