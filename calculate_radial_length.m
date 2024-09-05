function normalized_radial_length = calculate_radial_length(mask_binary)
    % Estimates the center using the centroid
    %we use regionprops fn to get the centroid and put it in lesioncentre
    stats = regionprops(mask_binary, 'Centroid');
    lesion_center = stats.Centroid;

    % Next we compute Euclidean distance from the center to each boundary point
    boundary = bwboundaries(mask_binary);
    boundary_coords = boundary{1};
    num_boundary_points = size(boundary_coords, 1);
    %put max radial length as 0
    max_radial_length = 0;
    for i = 1:num_boundary_points
        radial_length = sqrt((boundary_coords(i, 1) - lesion_center(1))^2 + (boundary_coords(i, 2) - lesion_center(2))^2);
        if radial_length > max_radial_length
            max_radial_length = radial_length;
        end
    end

    % Normalize the radial length
    normalized_radial_length = max_radial_length / sqrt(sum(size(mask_binary).^2));
end
