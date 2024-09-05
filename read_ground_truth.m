function groundtruth = read_ground_truth(Groundtruth_Label)
%  We first open and read the file for the ground labels
fid = fopen(Groundtruth_Label, 'r');
% Initializing array to store our labels
%200 according to our ground truth labels
groundtruth = cell(200, 1);
%Iterate line by line through the file and extract the label from corresponding line
for i = 1:200
    line = fgetl(fid);
    comma_index = strfind(line, ',');label = line(comma_index+1:end);
    groundtruth{i} = label;
end
% Close the file
fclose(fid);
groundtruth=groundtruth(:);
end