function colour_Hist = calculateColorHistograms(images)
    num_images = numel(images);%number of imgs
    colour_Hist = zeros(num_images, 512);%initialising an array with 512 size
    noBins = 8; % 8 bins for each dimension)
    
    for x = 1:num_images
        % Converting RGB image into HSV color space 
        img_hsv = rgb2hsv(images{x});
        
        % Next we create a 3D histogram
        Hist = zeros(noBins, noBins, noBins); %we initialise empty histogram for the starting
        for i = 1:size(img_hsv, 1)
            for j = 1:size(img_hsv, 2)%iterating using for loop
                hue = round(img_hsv(i, j, 1) * (noBins - 1)) + 1;% for hue
                sat = round(img_hsv(i, j, 2) * (noBins - 1)) + 1;%for saturation
                val = round(img_hsv(i, j, 3) * (noBins - 1)) + 1;%for value
                Hist(hue, sat, val) = Hist(hue, sat, val) + 1;%Incrementing the corresponding bin for each pixel's HSV values
            end
        end
        
        % Next we flatten the histogram into a one-D array using rebuilt
        % from MATLAB
        colour = reshape(Hist, [1, 512]);
        colour_Hist(x, :) = colour;%We put color after reshaping into color_hist
    end
    
    % Normalize the histograms
    colour_Hist = normalize(colour_Hist);
    % Key step to remove NaNs and Infs
    colour_Hist(isnan(colour_Hist)) = 0;
    colour_Hist(isinf(colour_Hist)) = 0;
    % Lastly we can ensure all values are non-negative so we put absolute.
    colour_Hist = abs(colour_Hist);
end
