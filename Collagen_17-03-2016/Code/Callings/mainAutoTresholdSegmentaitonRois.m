%%Auto segmentation callinf from autothreshold


cd ..\..
cd Photos
%Path of ratolis
[stat,struc] = fileattrib;
PathCurrent = struc.Name;

ratolis = dir(PathCurrent);
ratolis(1:2)=[];


for i=1:length(ratolis)
    
    ratoli=ratolis(i).name;
    cd (ratoli)
    %%Path of muscles
    [stat,struc] = fileattrib;
    PathCurrent = struc.Name;
    
    muscleRatolis = dir(PathCurrent);
    muscleRatolis(1:2)=[];
    
    for j=1:length(muscleRatolis)
                
        muscle=muscleRatolis(j).name;
        cd (muscle)
        
        %%Path for each photo
        [stat,struc] = fileattrib;
        PathCurrent = struc.Name;

        photosRatoli = dir(PathCurrent);
        photosRatoli(1:2)=[];        
        
        %%loop each photo
               
        for k=1:length(photosRatoli)
            
            photo=photosRatoli(k).name;
            
            if strcmp(photo(end-6:end),'OIs.jpg')~=1 && strcmp(photo(end-3:end),'.mat')~=1
                 
                Img=imread(photo);
                name=photo(1:end-4);
                load([name '_data_ROIS\' name '_data_ROIs.mat'])
                
                for r=1:size(mask_ROIS,1)
                   
                    cd ..\..\..
                    cd 'Code'

                    mask_ROI=mask_ROIS{r,1};
                    
                    [area_norm,BW]=roiSegmentation(Img,mask_ROI);
             
                    cd ..\Photos
                    cd (ratoli)
                    cd (muscle)
                    
                           
                    if isdir([name '_data_ROIS'])==0
                      mkdir([name '_data_ROIS']);
                    end

                    cd ([name '_data_ROIS'])

                    imwrite(BW,[name '_ROI_' num2str(r) '_collagen.jpg'])
                    Area_norm_ROIS(r)=area_norm;    

                    cd ..
                    
                end
                save([name '_data_ROIS\Data_area.mat'],'Area_norm_ROIS')
                Area_norm_ROIS=[];
            end
            
            
        
        end    
        
        cd ..
    end
    
    cd ..
    
 
end

cd ..
cd Code