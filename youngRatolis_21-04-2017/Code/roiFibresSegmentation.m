function roiFibresSegmentation(photoPath)
% This script has the proposal of segmenting perfectly ratoli's rois
% edited with Ps.

    % Selection of corrects parameters
    Noise_background=300; % Delete noise

    %% SEGMENTATION
    %%Load image
    
    Img=rgb2gray(imread(photoPath));

    [H,W,c]=size(Img);
    
    %%Modify the contrast automatically
    J=Img(Img>0);
    imgThreshold = graythresh(J);
    BWmin=im2bw(Img,imgThreshold);
    BWmin=1-BWmin;
    %figure,imshow(BWmin)

    %% DELETING NO CELLS

    %% MORPHOLOGY. 
    %fill holes
    BW = 1-bwmorph(1-BWmin,'fill');
    % Compacting cells dilating and eroding
    se = strel('disk',10);
    BW = imerode(BW,se);
    %figure,imshow(BW)
    BW = 1-imdilate(BW,se);
    %figure,imshow(BW)
    
    % Noise 
    BW= bwareaopen(BW,Noise_background);
    %figure,imshow(BW)
    BW= 1-bwareaopen(1-BW,Noise_background);
    %figure,imshow(BW)

    splittedPath=strsplit(photoPath, '\');
    path2Save=[splittedPath{1} '\' splittedPath{2} '\' splittedPath{3} ...
         '\' splittedPath{4} '\' splittedPath{5} '\' splittedPath{6} '\mask_' splittedPath{7}];
    imwrite(BW,path2Save);
    
end
