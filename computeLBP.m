function lbpFeatures = computeLBP(image)
    % LBP features for a input image
    
    % Convert the image to grayscale if it's not already in grayscale
    if size(image, 3) > 1
        grayImage = rgb2gray(image);
    else
        grayImage = image;
    end
    
    % Using LBP built in matlab function over grayimage
    lbpImage = extractLBPFeatures(grayImage);
    
    % Return with LBP features
    lbpFeatures = lbpImage;
end
