function question6(n)
    imgTrainDatas = load('imgTrainImagesAll.mat');
    imgTrainLabels = load('lblTrainLabelsAll.mat');
    imgTrainAll = imgTrainDatas.imgTrainImagesAll;
    lblTrainAll = imgTrainLabels.lblTrainLabelsAll;
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTrainDatas = load('imgTestImagesAll.mat');
    imgTrainLabels = load('lblTestLabelsAll.mat');
    imgTestAll = imgTrainDatas.imgTestImagesAll;
    lblTestAll = imgTrainLabels.lblTestLabelsAll;
    imgTest = imgTestAll(:, n);
    lblPredictTest = predict(Mdl, imgTest');
    lblImageTest = lblTestAll(n);
    
    figure;
    img2D = reshape(imgTest, 112, 92);
    imshow(img2D);
    strLabelImage = 'Ban dau ';
    strLabelImage = [strLabelImage, num2str(lblImageTest), '.'];
    strLabelImage = [strLabelImage, ' Du doan: '];
    strLabelImage = [strLabelImage, num2str(lblPredictTest), '.'];
    
    if(lblPredictTest == lblImageTest)
        strLabelImage = [strLabelImage, ' Nhan dang dung.'];
    else
        strLabelImage = [strLabelImage, ' Nhan dang sai.'];
    end
    title(strLabelImage);
end