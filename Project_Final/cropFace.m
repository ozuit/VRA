function croped_images = cropFace(image_path)
    % Read the image
    A = imread(image_path);

    % Get FaceDetector Object
    FaceDetector = vision.CascadeObjectDetector();
    FaceDetector.MergeThreshold = 5;

    % Use FaceDetector on img and get the faces
    BBOX = step(FaceDetector, A);

    % Display the number of faces in a string
    n = size(BBOX, 1);

    croped_images = [];
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
            croped_images = [croped_images, vector_image'];
        end
    end
end