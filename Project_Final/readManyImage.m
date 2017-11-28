function readManyImage()
    d = uigetdir([pwd '/DataTrain'], 'Select a folder');
    if (d)
        files = dir(fullfile(d, '*.jpg'));
        folders = strsplit(d, '/');
        image_label = folders(size(folders,2));
        mkdir(['CropedImages/' char(image_label)]);
        all_images = [];
        h = waitbar(0,'Đang xử lý...');
        for i=1:size(files,1)
            image_path = [files(i).folder '/' files(i).name];
            croped_images = cropFace(image_path);
            if (size(croped_images,2) > 0)
                for j=1:size(croped_images,2)
                    %% Store image in an array
                    all_images = [all_images, croped_images(:,j)];
                    %% Wite image to disk
                    strFileName = ['image_' num2str(i) '.jpg'];
                    strPath = ['CropedImages/' char(image_label) '/' strFileName];
                    img2D = reshape(croped_images(:,j), 112, 92);
                    imwrite(img2D, strPath);
                end
            end
            waitbar(i / size(files,1));
        end
        close(h);
        storeNewFace(all_images, image_label);
    end
end