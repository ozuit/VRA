function detectFace(image_path)
    % Read the image
    A = imread(image_path);

    % Get FaceDetector Object
    FaceDetector = vision.CascadeObjectDetector();
    FaceDetector.MergeThreshold = 6;

    % Use FaceDetector on img and get the faces
    BBOX = step(FaceDetector, A);
    n = size(BBOX, 1);

    % Annotate these faces on the top of the image
    label = cell(n,1); 
    
    for i=1:n
        % Drop face image
        faceImage = imcrop(A,BBOX(i,:));
        
        % Check face again
        FaceDetector1 = vision.CascadeObjectDetector('Mouth');
        BBOX1 = step(FaceDetector1,faceImage);
        n1=size(BBOX1,1);
        
        if n1>0
            J = imresize(faceImage,[112 92]);
            l = rgb2gray(J);
            vector_image = reshape(l, 1, size(l,1)*size(l,2));
            
            % Show face
%             figure;
%             imshow(l);
%             title(['Face ' num2str(i)]);
            
            cell_label = predict(vector_image');
            label{i} = char(cell_label);
        else
            label{i} = ['Face ' num2str(i)];
        end
    end
    
    B = insertObjectAnnotation(A, 'rectangle', BBOX, label);
    figure, imshow(B), title('Kết quả nhận diên');
end