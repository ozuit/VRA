function demoHog()
    imgTrainAll = loadMNISTImages('./train-images.idx3-ubyte');
    img1D = imgTrainAll(:, 1994);
    img2D = reshape(img1D, 28, 28);
    subplot(2,5,1);
    imshow(img2D);
    
    [featuresVetor, visualHog] = extractHOGFeatures(img2D, 'CellSize', [2 2]);
    subplot(2,5,2);
    plot(visualHog);

    [featuresVetor, visualHog] = extractHOGFeatures(img2D, 'CellSize', [3 3]);
    subplot(2,5,3);
    plot(visualHog);
    
    [featuresVetor, visualHog] = extractHOGFeatures(img2D, 'CellSize', [4 4]);
    subplot(2,5,4);
    plot(visualHog);
    
    subplot(2,5,5);
    hist(featuresVetor);
end