%% Segmentation calling

cd '..\..\Data_Rois'
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
cd '..\Code'
%get all filepath
fileList=getAllFiles(PathCurrent);

%filtering to get only our paths of interest (edited rois)
for nFile = 1:size(fileList,1)
    fullPathFile = fileList(nFile);
    fullPathFile = fullPathFile{:};
    diagramName = strsplit(fullPathFile, '\');
    diagramName = diagramName(end);
    diagramName = diagramName{1};
    
     %Check which files we want.
     if isempty(strfind(lower(diagramName), '_edited.')) == 0 && isempty(strfind(lower(diagramName), 'mask_')) == 1
         segmentationRois(fullPathFile);
     end
end

cd Calling