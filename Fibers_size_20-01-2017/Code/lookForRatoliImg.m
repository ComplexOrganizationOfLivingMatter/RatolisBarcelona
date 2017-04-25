function [ photo_path ] = lookForRatoliImg(typeRatoli,nameRatoli,n_photo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%With this function I want find a photo's path with only 3 parameters (type and name of ratoli and number of photo).
cd ..\Photos
cd (typeRatoli)
cd (['ratoli ' nameRatoli])
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
cd ..\..\..\Code

%get all filepath
fileList=getAllFiles(PathCurrent);

%filtering to get only our path of interest
for nFile = 1:size(fileList,1)
    fullPathFile = fileList(nFile);
    fullPathFile = fullPathFile{:};
    diagramName = strsplit(fullPathFile, '\');
    diagramName = diagramName(end);
    diagramName = diagramName{1};
    
     %Check which files we want.
     if isempty(strfind(lower(diagramName), lower(['v' num2str(n_photo) '.']))) == 0
        photo_path=fullPathFile;
        break;
     else
         if isempty(strfind(lower(diagramName), lower(['v' num2str(n_photo) 'm']))) == 0
            photo_path=fullPathFile;
            break;  
            
         else
             if isempty(strfind(lower(diagramName), lower(['v' num2str(n_photo) ' m']))) == 0
                photo_path=fullPathFile;
                break; 
             end
         end
     end
     
     
     
     
end


end

