clear all
close all
 
cd '..\..\Data_Rois'
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
cd '..\Code'
%get all filepath
fileList=getAllFiles(PathCurrent);
%%Detele files .mat : due to problems if there are some .mat file in these
%%directories
for nFile = 1:size(fileList,1)
    fullPathFile = fileList(nFile);
    fullPathFile = fullPathFile{:};
    fullPathSplitted = strsplit(fullPathFile, '\');
    diagramName = fullPathSplitted{end};
 
    
    if isempty(strfind(lower(diagramName), '.mat'))==0
              delete(fullPathFile)
    end
end



DataTreatedDiaf=[];
DataTreatedTant=[];
DataTreatedQuad=[];
DataNonTreatedDiaf=[];
DataNonTreatedTant=[];
DataNonTreatedQuad=[];
DataWTDiaf=[];
DataWTTant=[];
DataWTQuad=[];

RatDataTreatedDiaf=[];
RatDataTreatedTant=[];
RatDataTreatedQuad=[];
RatDataNonTreatedDiaf=[];
RatDataNonTreatedTant=[];
RatDataNonTreatedQuad=[];
RatDataWTDiaf=[];
RatDataWTTant=[];
RatDataWTQuad=[];

%filtering to get only our paths of interest (edited rois)
for nFile = 1:size(fileList,1)
    fullPathFile = fileList(nFile);
    fullPathFile = fullPathFile{:};
    fullPathSplitted = strsplit(fullPathFile, '\');
    diagramName = fullPathSplitted{end};
    muscleType=fullPathSplitted{8};
    kinfOfMouse=fullPathSplitted{6};
    
    splittedPath=strsplit(fullPathFile,'\');
    
    %filtering for kind of fenotype and muscle
    switch lower(kinfOfMouse)
    
        case 'non-treated mdx'
            
            switch lower(muscleType)
                case {'tant','t ant','tan','ant','colagen tant','col tant','tant col ratoli i','tib ant'}
                     if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataNonTreatedTant(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8];namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2};
                         RatDataNonTreatedTant{end+1}=[splittedPath{7} '-' namePhoto];
                         
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             a=getAllFiles([fullPathFile(1:end-4) '_ps.jpg']);
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataNonTreatedTant(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2};
                             RatDataNonTreatedTant{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end

                case {'diaf','col diaf','diaf col'}
                    if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataNonTreatedDiaf(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataNonTreatedDiaf{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataNonTreatedDiaf(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataNonTreatedDiaf{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end
                case {'quad','col quad','quaf n','quad col'}
                    if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataNonTreatedQuad(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataNonTreatedQuad{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataNonTreatedQuad(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataNonTreatedQuad{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end
            end
     
        case 'treated mdx'
            switch lower(muscleType)
                case {'tant','t ant','tan','ant','colagen tant','col tant','tant col ratoli i','tib ant'}
                     if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataTreatedTant(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataTreatedTant{end+1}=[splittedPath{7} '-' namePhoto];

                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataTreatedTant(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataTreatedTant{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end

                case {'diaf','col diaf','diaf col'}
                    if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataTreatedDiaf(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataTreatedDiaf{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataTreatedDiaf(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataTreatedDiaf{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end
                case {'quad','col quad','quaf n','quad col'}
                    if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataTreatedQuad(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataTreatedQuad{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataTreatedQuad(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataTreatedQuad{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end
            end
        case 'wt'
            switch lower(muscleType)
                case {'tant','t ant','tan','ant','colagen tant','col tant','tant col ratoli i','tib ant'}
                     if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataWTTant(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataWTTant{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataWTTant(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataWTTant{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end

                case {'diaf','col diaf','diaf col'}
                    if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataWTDiaf(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataWTDiaf{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataWTDiaf(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataWTDiaf{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                     end
                case {'quad','col quad','quaf n','quad col'}
                    if isempty(strfind(lower(diagramName), '_edited_ps.'))==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                         [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);
                         DataWTQuad(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                         RatDataWTQuad{end+1}=[splittedPath{7} '-' namePhoto];
                     else if isempty(strfind(lower(diagramName), '_edited.'))==0 && exist([fullPathFile(1:end-4) '_ps.jpg'])==0 && isempty(strfind(lower(diagramName), 'mask'))==0
                             [cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]=getGeometricCCRoi(fullPathFile);    
                             DataWTQuad(end+1,1:8)=[cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]; namePhoto=strsplit(splittedPath{9},'_');namePhoto=namePhoto{2}; namePhoto=strsplit(splittedPath{9},'_');                          namePhoto=namePhoto{2};
                             RatDataWTQuad{end+1}=[splittedPath{7} '-' namePhoto];
                          end
                    end
            end
    end
end
save('D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\Treated mdx\DataTreated.mat','DataTreatedDiaf','DataTreatedQuad','DataTreatedTant')
save('D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\Non-treated mdx\DataNonTreated.mat','DataNonTreatedDiaf','DataNonTreatedQuad','DataNonTreatedTant')
save('D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\WT\DataWT.mat','DataWTDiaf','DataWTQuad','DataWTTant')

save('D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\Non-treated mdx\NameRatolisNonTreated.mat','RatDataNonTreatedDiaf','RatDataNonTreatedQuad','RatDataNonTreatedTant')
save('D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\Treated mdx\NameRatolisTreated.mat','RatDataTreatedDiaf','RatDataTreatedQuad','RatDataTreatedTant')
save('D:\Pedro\Ratolis Barcelona\Fibers_size_20-01-2017\Data_Rois\WT\NameRatolisWT.mat','RatDataWTDiaf','RatDataWTQuad','RatDataWTTant')


cd Calling