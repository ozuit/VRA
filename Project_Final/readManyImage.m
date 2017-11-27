function readManyImage()
    d = uigetdir([pwd '/DataTrain'], 'Select a folder');
    if (d)
        files = dir(fullfile(d, '*.jpg'));
        folders = strsplit(d, '/');
        image_label = folders(size(folders,2));
        all_images = [];
        h = waitbar(0,'Đang xử lý...');
        for i=1:size(files,1)
            image_path = [files(i).folder '/' files(i).name];
            croped_images = cropFace(image_path);
            if (size(croped_images,2) > 0)
                for j=1:size(croped_images,2)
                    all_images = [all_images, croped_images(:,1)];
                end
            end
            waitbar(i / size(files,1));
        end
        close(h);
        storeNewFace(all_images, image_label);
    end
end