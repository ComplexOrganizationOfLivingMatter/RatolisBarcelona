function segmentationRois(photoPath)
% This script has the proposal of segmenting perfectly ratoli's rois
% edited with Ps.

% Selection of corrects parameters
splittedPath=strsplit(photoPath, '\');
if isempty(strfind(splittedPath{6},'Non-'))==0
    Noise_background=3000; % Delete noise
    Divide_cells=4; % Ratio used to divide cells
else if isempty(strfind(splittedPath{6},'Treated'))==0
        Noise_background=4200; % Delete noise
        Divide_cells=4; % Ratio used to divide cells
    else if isempty(strfind(splittedPath{6},'WT'))==0
            Noise_background=3000; % Delete noise
            Divide_cells=4; % Ratio used to divide cells
        end    
    end
end


%% SEGMENTATION

%%Load image
    
    Img=rgb2gray(imread(photoPath));

    [H,W,c]=size(Img);
    
%%Modify the contrast automatically
J=adapthisteq(Img);
imgThreshold = multithresh(J,5);
BWmin=im2bw(J,double(imgThreshold(2))/double(255));
BWmin=1-BWmin;
% We modify G regarding intensity property. Get a treshold overlapping 3 diferent layers to obtein the most representative data. 
% J=adapthisteq(Img);
% meanJ=mean(mean(J));
% h3=(meanJ/3); h15=(meanJ/1.5); h2=meanJ/2;
% BWmin3 = imextendedmin(Img,h3);
% BWmin2 = imextendedmin(Img,h2);
% BWmin15 = imextendedmin(Img,h15);
% 
% 
% BWmin=BWmin15+BWmin3+BWmin2;

%% DELETING NO CELLS

% Noise 
BWmin= bwareaopen(BWmin,Noise_background);
L = bwlabel(BWmin,8);  % labelling regions to represent
L(L==1)=0;
L=bwlabel(L);

BW=logical(L);
%% MORPHOLOGY. 
% Fill holes
BW = imfill(BW,'holes');
%imshow(BW)

% Compacting cells eroding and dilating
se = strel('disk',9);
BW = imerode(BW,se);
se = strel('disk',8);
BW = imdilate(BW,se);
%figure,imshow(BW)

% Fill holes again
BW = imfill(BW,'holes');


%delete artifacts
BW= bwareaopen(BW,Noise_background);
%figure,imshow(BW)

path2Save=[splittedPath{1} '\' splittedPath{2} '\' splittedPath{3} ...
    '\' splittedPath{4} '\' splittedPath{5} '\' splittedPath{6} ...
    '\' splittedPath{7} '\' splittedPath{8} '\'];

imwrite(BW,[path2Save 'mask_' splittedPath{9}]);

end
