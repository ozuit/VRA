function question7_advance(n)
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    lblTrainAll = loadMNISTLabels('./train-labels.idx1-ubyte');
    
    Mdl = fitcknn(imgTrainAll' , lblTrainAll);
    
    imgTestAll = loadMNISTImages('./t10k-images.idx3-ubyte');
    lblTestAll = loadMNISTLabels('./t10k-labels.idx1-ubyte');
    
    arrImagesNTest = [];
    for i = 1:size(imgTestAll, 2)
       if (lblTestAll(i) == n)
          arrImagesNTest = [arrImagesNTest, imgTestAll(:, i)];
       end
    end
    
    countFailure = [0 0 0 0 0 0 0 0 0 0];
    for i = 1:size(arrImagesNTest,2)
        imgTest = arrImagesNTest(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= n)
            countFailure(lblPredictTest + 1) = countFailure(lblPredictTest + 1) + 1;
        end
    end
    
    for i = 0:9
       if (i ~= n)
          fprintf('So luong anh co label %d bi nhan dang sai thanh %d la: %d\n', n, i, countFailure(i + 1));
       end
    end
end