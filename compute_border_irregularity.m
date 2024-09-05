function border_irregularity_index = compute_border_irregularity(lesion_image, mask_image, filter_size)
    % Applying filters to the lesion image separately from main code as using
    % testing and trial to pull out better results
    filtered_lesion_image = imfilter(lesion_image, fspecial('average', filter_size), 'replicate');
    filtered_lesion_image = imgaussfilt(filtered_lesion_image, 2); % Apply Gaussian filter with default size 1
    
    % Apply mask to the filtered lesion image
    masked_filtered_lesion_image = bsxfun(@times, filtered_lesion_image, cast(mask_image, class(filtered_lesion_image)));
    
    % perimeter of the lesion region
    perimeter = sum(bwperim(mask_image), 'all');
    
    % Area of the lesion region
    area = sum(mask_image(:));
    
    % This is the border irregularity index
    border_irregularity_index = perimeter / sqrt(area);
end
