%this function is called in main file to resize the images
%for both lesion data store and masked datastore
function [Resized_Lesions,Resized_Masks] = resize(Lesion_DS, Masked_DS)
% read in all Lesion images
lesionimages = readall(Lesion_DS); 
% read in all masked images
maskimages = readall(Masked_DS); 
%New folder is made for resized lesion dataset
Lesion_resized_file="Resiz_legions";
%New folder is made for resized masked dataset
Mask_resized_file="Resiz_masks";
%Efficient outputsize was found to be 350 and 450
% 350x450 pixels strike a balance between image resolution and file size
%as found to be in some threads in stack overflow
outputSize = [350, 450];
%Looping through lesion images to write the resized images to new
%datastores created by the function
for i=1:length(lesionimages)
    Resized_Lesions = imresize(lesionimages{i}, outputSize);
    Resized_Masks = imresize(maskimages{i}, outputSize);
    [~, filename, ext] = fileparts(Lesion_DS.Files{i});
    %We then put resized image in the new folders
    imwrite(Resized_Lesions, fullfile(Lesion_resized_file, [filename, ext]));
    imwrite(Resized_Masks, fullfile(Mask_resized_file, [filename, ext]));
end
Resized_Lesions=imageDatastore(Lesion_resized_file);%storing in now
Resized_Masks=imageDatastore(Mask_resized_file);%storing in now
end